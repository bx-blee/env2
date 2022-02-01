;;; bap-guess-language.el --- Blee Adopted Package: Guess-Language  -*- lexical-binding: t; -*-
;;
;;; Commentary:
;; Not Used Yet -- Farsi needs to be added
;;
;;
;;; Code:

(require 'compile-time-function-name)
(require 'guess-language)

(defvar bap:guess-language:usage:enabled-p t "Guess-language package adoption control.")

;;; (bap:guess-language:full/update)
(defun bap:guess-language:full/update ()
  "Guess-language package adoption full/update template."
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (when bap:guess-language:usage:enabled-p
    (bap:guess-language:install/update)
    (bap:guess-language:config/main)
    )
  )


(defun bap:guess-language:install/update ()
  "Guess-language package adoption install/update template."
  (interactive)
  (blee:ann|this-func (compile-time-function-name))

  ;; (use-package guess-language
  ;;   :ensure t
  ;;   ;;; :pin melpa-stable
  ;;   )
  )


(defun bap:guess-language:config/main ()
  "Guess-language package adoption config/mail template."
  (interactive)
  (blee:ann|this-func (compile-time-function-name))

  ;;
  ;; Persian fa
  ;; ISO 639.2
  ;;
  (setq guess-language-langcodes
  '((en . ("en_GB" "English"))
    (ar . ("ar" "Arabic")))
  )

  (setq guess-language-languages '(en ar))
  ;;;(setq guess-language-min-paragraph-length 35)

  ;;; For a list of all dictionaries available for spell-checking, use the following:
  ;;; (mapcar 'car ispell-dictionary-alist)
  )


(provide 'bap-guess-language)
;;; bap-guess-language.el ends here
