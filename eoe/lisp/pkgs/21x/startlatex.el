;;; -*- Mode: Emacs-Lisp; -*-
;;; SCCS: @(#)startlatex.el	1.3 5/10/92
;;;
;;; LaTeXinfo 1.7

(setq load-path 
      (cons (setq latexinfo-formats-directory
		  (expand-file-name (concat (getenv "LATEXINFO") "/elisp")))
	    load-path))

(autoload 'latexinfo-format-region
          "latexinfo"
  "Convert the current region of the Latexinfo file to Info format.
This lets you see what that part of the file will look like in Info.
The command is bound to \\[latexinfo-format-region].  The text that is
converted to Info is stored in a temporary buffer."
          t nil)

(autoload 'latexinfo-format-buffer
          "latexinfo"
  "Process the current buffer as latexinfo code, into an Info file.
The Info file output is generated in a buffer visiting the Info file
names specified in the \\setfilename command.

Non-nil argument (prefix, if interactive) means don't make tag table
and don't split the file if large.  You can use Info-tagify and
Info-split to do these manually."
          t nil)

(autoload 'latexinfo-latex-buffer
          "latexnfo-tex"
  "Run LaTeX on current buffer.
After running LaTeX the first time, you may have to run \\[latexinfo-latexindex]
and then \\[latexinfo-latex-buffer] again."
          t nil)

(autoload 'latexinfo-latexindex
          "latexnfo-tex"
  "Run latexindex on unsorted index files.
The index files are made by \\[latexinfo-latex-region] or \\[latexinfo-latex-buffer].
Runs the shell command defined by latexinfo-latexindex-command."
          t nil)

(autoload 'latexinfo-make-menu
          "latexnfo-upd"
  "Without any prefix argument, make or update a menu.
Make the menu for the section enclosing the node found following point.

Non-nil argument (prefix, if interactive) means make or update menus
for nodes within or part of the marked region.

Whenever a menu exists, and is being updated, the descriptions that
are associated with node names in the pre-existing menu are
incorporated into the new menu.  Otherwise, the nodes' section titles
are inserted as descriptions."
          t nil)

(autoload 'latexinfo-update-node
          "latexnfo-upd"
  "Without any prefix argument, update the node in which point is located.
Non-nil argument (prefix, if interactive) means update the nodes in the
marked region.

The functions for creating or updating nodes and menus, and their
keybindings, are:

    latexinfo-update-node (&optional region-p)    \\[latexinfo-update-node]
    latexinfo-every-node-update ()                \\[latexinfo-every-node-update]
    latexinfo-sequential-node-update (&optional region-p)

    latexinfo-make-menu (&optional region-p)      \\[latexinfo-make-menu]
    latexinfo-all-menus-update ()                 \\[latexinfo-all-menus-update]
    latexinfo-master-menu ()

    latexinfo-indent-menu-description (column &optional region-p)

The `latexinfo-column-for-description' variable specifies the column to
which menu descriptions are indented. Its default value is 24."
          t nil)

(autoload 'latexinfo-every-node-update
          "latexnfo-upd"
  "Update every node in a Latexinfo file."
          t nil)

(autoload 'latexinfo-all-menus-update
          "latexnfo-upd"
  "Update every regular menu in a Latexinfo file.
Remove pre-existing master menu, if there is one.

If called with a non-nil argument, this function first updates all the
nodes in the buffer before updating the menus."
          t nil)

(autoload 'latexinfo-mode "latexnfo-mde"
	  "An editing for LaTeXinfo files" t)

(autoload 'tex-to-latexinfo "t2latexinfo"
	  "Convert a buffer from TeXinfo to LaTeXinfo" t)

(autoload 'scribe-to-latexinfo "s2latexinfo"
	  "Convert a buffer from Scribe to LaTeXinfo" t)

(autoload 'latex-to-latexinfo "l2latexinfo"
	  "Convert a buffer from LaTeX to LaTeXinfo" t)

(defvar latexinfo-section-types-regexp
  "^\\\\\\(chapter\\|section\\|sub\\|unnum\\)"
  "Regexp matching chapter, section, other headings (but not the top node).")

;;(autoload 'get-latexinfo-node "get-node"
;;	  "Get help on a LaTeXinfo topic" t)

;;(define-key help-map "g" 'get-latexinfo-node)

