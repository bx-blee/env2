;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-
;;;
;;;

(require 'easymenu)

;;;; NOTYET BEGIN To be Caprtured in blee-lib package in blee-lib-menu.el

;;
;; [[elisp:(popup-menu (symbol-value (modes:menu:help|define)))][Help Me]]
;; (popup-menu (symbol-value (bx:menu:panelAndHelp|define "/bisos/panels/bisos-dev/_nodeBase_"  "bx:menu:panelAndHelp|define" (intern (symbol-name (gensym))))))
;;
(defun bx:menu:panelAndHelp|define  (<panelName <funcName <menuName)
  "Creates a menu item for visiting <panelName and <funcName."
  (let (
	($thisFuncName (compile-time-function-name))
        )
    (easy-menu-define
      <menuName
      nil
      (s-lex-format "Help Menu Defined In ${$thisFuncName}")
      `(
        "Blee Panels And Help Menu:"
	[,(format "Go To Panel: %s" <panelName)
	 (blee:bnsm:panel-goto ,<panelName)
	 t
	 ]
        "---"
	[,(format "Visit %s" <funcName)
	 (find-function (intern ,<funcName))
	 t
	 ]
	)
      )
    '<menuName
    ))

;;;; NOTYET END To be Caprtured in blee-lib package in blee-lib-menu.el



;; (apps:magit:menu:plugin|install modes:menu:global (s-- 6))
(defun apps:magit:menu:plugin|install%% (<menuLabel <menuDelimiter)
  "Adds this as a submenu to menu labeled <menuLabel at specified delimited <menuDelimiter."

  (easy-menu-add-item
   <menuLabel
   nil
   (apps:magit:menu|define :active t)
   <menuDelimiter
   )

  (add-hook 'menu-bar-update-hook 'apps:magit:menu|update-hook)
  )

;; (apps:magit:menu:plugin|install modes:menu:global (s-- 6))
(defun apps:magit:generalMenu:plugin|install (<menuLabel <menuDelimiter)
  "Adds this as a submenu to menu labeled <menuLabel at specified delimited <menuDelimiter."

  (easy-menu-add-item
   <menuLabel
   nil
   (apps:magit:generalMenu|define :active t)
   <menuDelimiter
   )

  (add-hook 'menu-bar-update-hook 'apps:magit:menu|update-hook)
  )

;; (apps:magit:menu:plugin|install modes:menu:global (s-- 6))
(defun apps:magit:bposMenu:plugin|install (<menuLabel <menuDelimiter)
  "Adds this as a submenu to menu labeled <menuLabel at specified delimited <menuDelimiter."

  (easy-menu-add-item
   <menuLabel
   nil
   (apps:magit:bposMenu|define :active t)
   <menuDelimiter
   )

  (add-hook 'menu-bar-update-hook 'apps:magit:menu|update-hook)
  )

;; (apps:magit:menu:plugin|install modes:menu:global (s-- 6))
(defun apps:magit:githubMenu:plugin|install (<menuLabel <menuDelimiter)
  "Adds this as a submenu to menu labeled <menuLabel at specified delimited <menuDelimiter."

  (easy-menu-add-item
   <menuLabel
   nil
   (apps:magit:githubMenu|define :active t)
   <menuDelimiter
   )

  (add-hook 'menu-bar-update-hook 'apps:magit:menu|update-hook)
  )

(defun apps:magit:menu|update-hook ()
  "This is to be added to menu-bar-update-hook.
It runs everytime any menu is invoked.
As such what happens below should be exactly what is necessary and no more."
  ;;(modes:menu:global|define)
  )

;;
;; (apps:magit:generalMenu|define :active nil)
;; (popup-menu (symbol-value (apps:magit:generalMenu|define)))
;;
(defun apps:magit:generalMenu|define (&rest <namedArgs)
  "Returns apps:magit:generalMenu.
:active can be specified as <namedArgs.
"
  (let (
	(<active (get-arg <namedArgs :active t))
	($thisFuncName (compile-time-function-name))
	)

    (easy-menu-define
      apps:magit:generalMenu
      nil
      (format "General MAGIT Menu")
      `(
	,(format "General MAGIT Menu")
	:help "General MAGIT Menu"
	:active ,<active
	:visible t
	,(s-- 3)
	,(s-- 4)
	,(s-- 5)
	,(s-- 6)
	,(s-- 7)
	,(s-- 8)
	))

    (easy-menu-add-item
     apps:magit:generalMenu nil
     (apps:magit:menuItem:status|define)
     (s-- 3))

    (easy-menu-add-item
     apps:magit:generalMenu nil
     (apps:magit:menuItem:repolist-status|define)
     (s-- 3))

    (easy-menu-add-item
     apps:magit:generalMenu nil
     (bx:menu:panelAndHelp|define
      "/bisos/git/auth/bxRepos/blee-binders/bisos-core/sync/_nodeBase_"
      $thisFuncName
      (intern (symbol-name (gensym))))
     (s-- 8))

    'apps:magit:generalMenu
    ))
;;
;; (apps:magit:bposMenu|define :active nil)
;; (popup-menu (symbol-value (apps:magit:bposMenu|define)))
;;
(defun apps:magit:bposMenu|define (&rest <namedArgs)
  "Returns apps:magit:bposMenu.
:active can be specified as <namedArgs.
"
  (let (
	(<active (get-arg <namedArgs :active t))
	($thisFuncName (compile-time-function-name))
	)

    (easy-menu-define
      apps:magit:bposMenu
      nil
      (format "BPOs MAGIT Menu")
      `(
	,(format "BPOs MAGIT Menu")
	:help "BPOs MAGIT Menu"
	:active ,<active
	:visible t
	,(s-- 3)
	,(s-- 4)
	,(s-- 5)
	,(s-- 6)
	,(s-- 7)
	,(s-- 8)
	))

    (easy-menu-add-item
     apps:magit:bposMenu nil
     (apps:magit:menuItem:bisos:current:bpo-repos|define)
     (s-- 4))

    (easy-menu-add-item
     apps:magit:bposMenu nil
     (apps:magit:menuItem:bisos:all:bpo-repos|define)
     (s-- 4))

    (easy-menu-add-item
     apps:magit:bposMenu nil
     (bx:menu:panelAndHelp|define
      "/bisos/git/auth/bxRepos/blee-binders/bisos-core/sync/privBposSync/_nodeBase_"
      $thisFuncName
      (intern (symbol-name (gensym))))
     (s-- 8))

    'apps:magit:bposMenu
    ))
;;
;; (apps:magit:githubMenu|define :active nil)
;; (popup-menu (symbol-value (apps:magit:githubMenu|define)))
;;
(defun apps:magit:githubMenu|define (&rest <namedArgs)
  "Return apps:magit:githubMenu.
:active can be specified as <namedArgs.
"
  (let (
	(<active (get-arg <namedArgs :active t))
	($thisFuncName (compile-time-function-name))
	)

    (easy-menu-define
      apps:magit:githubMenu
      nil
      (format "Github MAGIT Menu")
      `(
	,(format "Github MAGIT Menu")
	:help "Github MAGIT Menu"
	:active ,<active
	:visible t
	,(s-- 3)
	,(s-- 4)
	,(s-- 5)
	,(s-- 6)
	,(s-- 7)
	,(s-- 8)
	))

    (easy-menu-add-item
     apps:magit:githubMenu nil
     (apps:magit:menuItem:bisos:current:baseDir-repos|define)
     (s-- 5))

    (easy-menu-add-item
     apps:magit:githubMenu nil
     (apps:magit:menuItem:bisos:all:baseDir-repos|define)
     (s-- 5))

    (easy-menu-add-item
     apps:magit:githubMenu nil
     (apps:magit:menuItem:bisos:all:baseDir-atoms-repos|define)
     (s-- 5))

    (easy-menu-add-item
     apps:magit:githubMenu nil
     (bx:menu:panelAndHelp|define
      "/bisos/git/auth/bxRepos/blee-binders/bisos-core/sync/githubSync/_nodeBase_"
      $thisFuncName
      (intern (symbol-name (gensym))))
     (s-- 8))

    'apps:magit:githubMenu
    ))


(defun apps:magit:menuItem:status|define ()
  "Return a menuItem vector."
  (car
   `(
     [,(format "Magit Status")
      (magit-status)
      :help "Magit Status"
      :active t
      :visible t
      ]
     )))

(defun apps:magit:menuItem:repolist-status|define ()
  "Return a menuItem vector."
  (car
   `(
     [,(format "Magit Repo List Status")
      (magit-repolist-status)
      :help "Magit Repo List Status -- To be invoked from the repos-list buffer"
      :active t
      :visible t
      ]
     )))


(defun apps:magit:menuItem:bisos:current:bpo-repos|define ()
  "Return a menuItem vector."
  (car
   `(
     [,(format "BISOS-Magit Current BPO Repos")
      (bap:magit:bisos:current-baseDir-repos/visit)
      :help "BISOS-Magit BPO Repos: create a repos list for the current BPO"
      :active t
      :visible t
      ]
     )))

(defun apps:magit:menuItem:bisos:all:bpo-repos|define ()
  "Return a menuItem vector."
  (car
   `(
     [,(format "BISOS-Magit All BPO Repos")
      (bap:magit:bisos:all-bpo-repos/visit)
      :help "BISOS-Magit BPO Repos: create a repos list for all BPO"
      :active t
      :visible t
      ]
     )))


(defun apps:magit:menuItem:bisos:current:baseDir-repos|define ()
  "Return a menuItem vector."
  (car
   `(
     [,(format "BISOS-Magit Current BaseDir Repos")
      (bap:magit:bisos:current-baseDir-repos/visit)
      :help "BISOS-Magit Current BaseDir Repos: create a repos list for the current BaseDir"
      :active t
      :visible t
      ]
     )))

(defun apps:magit:menuItem:bisos:all:baseDir-repos|define ()
  "Return a menuItem vector."
  (car
   `(
     [,(format "BISOS-Magit All BaseDir Repos")
      (bap:magit:bisos:all-baseDir-repos/visit)
      :help "BISOS-Magit BPO Repos: create a repos list for all BaseDirs"
      :active t
      :visible t
      ]
     )))

(defun apps:magit:menuItem:bisos:all:baseDir-atoms-repos|define ()
  "Return a menuItem vector."
  (car
   `(
     [,(format "BISOS-Magit All BaseDir Atoms Repos")
      (bap:magit:bisos:all-baseDir-atoms-repos/visit)
      :help "BISOS-Magit BPO Repos: create a repos list for all Atoms BaseDirs"
      :active t
      :visible t
      ]
     )))



(defun apps:magit:menuItem:describe|define ()
  "Return a menuItem vector."
  (car
   `(
     [
      "On-Line Help"
      (find-file-at-point "https://www.gnu.org/software/emacs/manual/html_node/calc/index.html")
      :help "On-Line Help -- (visit web info)"
      :active t
      :visible t
      ]
     )))

(provide 'apps-magit-menu)
