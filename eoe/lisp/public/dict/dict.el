;;; dict.el -- an interface to RFC 2229 dictionary server

;; Author: Torsten Hilbrich <Torsten.Hilbrich@gmx.net>
;; Keywords: interface, dictionary
;; $Id: dict.el,v 1.1.1.1 2007-02-23 22:32:57 mohsen Exp $

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;; Commentary:

;; This is dict.el, an emacs lisp package implementing a client
;; for searching a dictionary server using the protocol defined
;; in RFC 2229

;; To startup simply evaluate this file and use the dict-search
;; function to do an exact search for a specific word.
;; You can visit a link using button2 or using return, pressing
;; s will ask for a new search word, tab or n will move forward
;; through all links, pressing shift tab or p will move backwards.

;; Please note, this is work in process, I think about implemeting
;; other search modes and some kind of history list (like the l key in
;; info mode)

(require 'cl)
(require 'custom)

(defgroup dict nil
  "Client for accessing the dictd server based dictionaries"
  :group 'help
  :group 'hypermedia)

(defcustom dict-server
  "dict.org" ;"localhost"
  "This server is contacted for searching the dictionary"
  :group 'dict
  :type 'string)

(defcustom dict-port
  2628
  "The port that is used for contacting the dictionary server defined by the dict-server variable"
  :group 'dict
  :type 'number)

(defface dict-word-entry-face
  '((t (:bold t :italic t)))
  "The face that is used for displaying the initial word entry line."
  :group 'dict)

(defface dict-reference-face
  '((((class color)
      (background dark))
     (:foreground "Yellow"))
    (((class color)
      (background light))
     (:foreground "Blue"))
    (t
     (:underline t)))

  "The face that is used for displaying a reference word."
  :group 'dict)

(defvar dict-read-point
  nil
  "Remembers the current position in the buffer associated with the network connection")

(defvar dict-stack
  nil
  "A stack to remember the older words and positions")

(defvar dict-reference-keymap
  nil
  "The keymap used for handling clicking these references")

(defun dict-open-connection (server port)
  "Open a connection to the dictserver server with port and the dictionary."
  (let ((process-buffer
	 (get-buffer-create (format "trace of dict session to %s on port %d"
				    server
				    port)))
	(process))
    (save-excursion
      (set-buffer process-buffer)
      (erase-buffer)
      (setq dict-read-point (point-min)))
    (setq process
	  (open-network-stream "dict" process-buffer dict-server dict-port))
    (let* ((response (dict-read-response process))
	   (code (dict-response-code response)))
      (if (= code 220)
	  process
	nil))))

(defvar dict-buffer
  nil
  "The buffer used for dictionary display")

(defvar dict-process-buffer
  nil
  "The buffer used for interaction with the dictionary server")

(defun dict-read (process delimiter)
  "Reads text from the buffer associated with process.
The delimiters is the end of the text to read and is returned as part of
the answer."
  (let ((case-fold-search nil)
	match-end)
    (save-excursion
      (set-buffer (process-buffer process))
      (goto-char dict-read-point)
      ;; Wait until at least one response could be read
      (while (not (search-forward delimiter nil t))
	(accept-process-output process 3)
	(goto-char dict-read-point))
      (setq match-end (point))
      ;; And return the result
      (let ((result (buffer-substring dict-read-point match-end)))
	(setq dict-read-point match-end)
	result))))

(defun dict-read-response (process)
  "Reads the next response from the buffer associated with process.
The variable dict-read-point is used for determining the start."
  (dict-read process "\r\n"))

(defun dict-response-code (response)
  "Returns the response code as number"
  (string-to-number (car (dict-string-to-list response))))

(defun dict-read-whole-answer (process)
  "Reads all the answer from the current read point to the next \\r\\n.\\r\\n"
  (dict-read process "\r\n.\r\n"))

(defun dict-send-command (process command)
  "Send the command to the process.
The read point is set to the end of the buffer."
  (save-excursion
    (set-buffer (process-buffer process))
    (goto-char (point-max))
    (setq dict-read-point (point))
    (process-send-string process command)
    (process-send-string process "\r\n")))

(defun dict-cleanup-region (start end)
  "Removes all \\r and the . at the start of the line"
  (save-excursion
    (goto-char start)
    (while (and (< (point) end) (re-search-forward "^\\." end t))
      (replace-match "" t t)
      (forward-char))
    (goto-char start)
    (while (and (< (point) end) (search-forward "\r\n" end t))
      (replace-match "\n" t t))))

(defun dict-string-to-list (string)
  "Split the string into fields and return them as list."

  (let ((list)
	(string (if (string-match "\r" string)
		    (substring string 0 (match-beginning 0))
		  string)))
    (while (and string (> (length string) 0))
      (let ((search "\\(\\s-\\)")
	    (start 0))
	(if (= (aref string 0) ?\")
	    (setq search "\\(\"\\)\\s-*"
		  start 1))
      (if (string-match search string start)
	  (progn
	    (setq list (cons (substring string start (- (match-end 1) 1)) list)
		  string (substring string (match-end 0))))
	(setq list (cons string list)
	      string nil))))
    (nreverse list)))

(defun dict-set-face (start end face)
  "Set the face for the region of text in the current buffer between start and end."
  (put-text-property start end 'face face))

(defun dict-insert-number-of-words-found (response)
  (let* ((number (nth 1 (dict-string-to-list response))))
    (insert number (if (= (string-to-number number) 1)
		       " definition"
		     " definitions")
	    " found.\n\n")))

(defun dict-insert-word-entry (response)
  (let ((result (dict-string-to-list response))
	(start (point)))
    (insert "From "
	    (nth 3 result)
	    "[" (nth 2 result) "]:\n")

    (dict-cleanup-region start (point))
    (dict-set-face start (point) 'dict-word-entry-face)))

(defun dict-mark-reference (start end)
  "Mark the text between start and end as reference"
  (setq word (buffer-substring-no-properties start end))
  (while (string-match "\n\\s-*" word)
    (setq word (replace-match " " t t word)))

  (let ((properties `(face dict-reference-face)))
		      ;mouse-face highlight
		      ;searchword ,word
		      ;keymap ,dict-reference-keymap)))
    (save-excursion
      (goto-char start)
      (while (search-forward-regexp "\\(.*\\)\n\\s-*" end t)
	(let ((extent (make-extent start (match-end 1))))
	  (set-extent-property 	 extent properties))
	(setq start (point)))
      (if (< (point) end)
	  (progn
	    (let ((extent (make-extent (point) end)))
	      (set-extent-property   extent properties)))))))
;    (set-extent-properties (make-extent start end) properties)))


(defun dict-insert-definition (definition)
  "Insert the definition into the buffer and do some cleanup and marking."
  (let ((start (point)))
    (insert definition)
    (dict-cleanup-region start (point))
    ;; Now search all {...} combinations
    (let ((regexp "{\\([^}]+\\)}"))
      (goto-char start)
      (while (< (point) (point-max))
	(if (search-forward-regexp regexp nil t)
	    (progn
	      (replace-match "\\1")
	      (dict-mark-reference (1- (match-beginning 1))
				   (1- (match-end 1))))
	  (goto-char (point-max)))))))

(defvar dict-mode-keymap
  nil
  "Keymap for dict mode")

(defun dict-mode ()
  (interactive)

  (unless dict-mode-keymap
    (setq dict-mode-keymap (make-sparse-keymap))
    (setq dict-reference-keymap (make-sparse-keymap))

    (define-key dict-mode-keymap "s" 'dict-search)
    (define-key dict-mode-keymap [tab] 'dict-next-entry)
    (define-key dict-mode-keymap "n" 'dict-next-entry)
    (define-key dict-mode-keymap [(shift tab)] 'dict-prev-entry)
    (define-key dict-mode-keymap "p" 'dict-prev-entry)

    (define-key dict-reference-keymap [return] 'dict-keyboard-search)
    (define-key dict-reference-keymap [button2] 'dict-mouse-search)

    (suppress-keymap dict-mode-keymap)
    (suppress-keymap dict-reference-keymap)

    )
  (use-local-map dict-mode-keymap)
  (setq major-mode 'dict-mode)
  (setq mode-name "Dictionary")
  (set-buffer-modified-p nil)
  (toggle-read-only 1)

)

(defun dict ()

  ;; Make sure the buffer is existing and selected

  (setq dict-process nil)

  (if (and dict-process-buffer
	   (buffer-live-p dict-process-buffer))
      (setq dict-process (get-buffer-process dict-process-buffer)))
  (unless (and dict-process
	       (eq (process-status (dict-process)) 'open))
    (setq dict-process (dict-open-connection dict-server dict-port))
    (setq dict-process-buffer (get-buffer-process dict-process-buffer))
    )

  (setq dict-buffer
	(get-buffer-create "*Dictionary entry*"))

  (unless (eq (current-buffer) dict-buffer)
    (switch-to-buffer-other-window dict-buffer))
  (dict-mode))


(defun dict-search (word)
  (interactive "sSearch word: ")

  (dict)

  (let* ((dummy (dict-send-command dict-process
				   (concat "define * \"" word "\"")))
	 (response (dict-read-response dict-process))
	 (code (dict-response-code response)))
    (toggle-read-only 0)
    (erase-buffer)
    (if (= code 552)
	(insert word " not found")
      (if (not (= code 150))
	  (insert "Error: " response)
	(dict-insert-number-of-words-found response)
	(setq response (dict-read-response dict-process))
	  (setq code (dict-response-code response))
	  (while (= code 151)
	    (dict-insert-word-entry response)
	    (let ((definition (dict-read-whole-answer dict-process)))
	      (dict-insert-definition definition))
	    (setq response (dict-read-response dict-process))
	    (setq code (dict-response-code response)))))
    (goto-char (point-min))
    (set-buffer-modified-p nil)
    (toggle-read-only 1)))

(defun dict-next-entry ()
  (interactive)

  (let ((pos (point))
	(oldpos 0)
	(found))

    (while (not (= oldpos (point)))
      (goto-char (next-extent-change (point)))
      (if (extent-at (point) (current-buffer)
		     'searchword)
	  (setq oldpos (point))))))

(defun dict-prev-entry ()
  (interactive)

  (let ((pos (point))
	(oldpos 0)
	(found))

    (while (not (= oldpos (point)))
      (goto-char (previous-extent-change (point)))
      (if (extent-at (point) (current-buffer)
		     'searchword)
	  (setq oldpos (point))))))

(defun dict-keyboard-search ()
  (interactive)

  (let* ((extent (extent-at (point)))
	 (word (extent-property extent 'searchword)))
    (if word
	(dict-search word)
      (error "There is no word at this place"))))

(defun dict-mouse-search (event)
  (interactive "@e")
  (save-excursion
    (mouse-set-point event)
    (dict-keyboard-search)))

(provide 'dict)
