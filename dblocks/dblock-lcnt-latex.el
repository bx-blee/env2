;;; -*- Mode: Emacs-Lisp; -*-
;; (setq debug-on-error t)

;;;#+BEGIN: bx:dblock:global:org-controls :disabledP "false" :mode "auto"
(lambda () "
* [[elisp:(show-all)][(>]] [[elisp:(describe-function 'org-dblock-write:bx:dblock:global:org-controls)][dbf]]
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][|O]]  [[elisp:(progn (org-shifttab) (org-content))][|C]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][|N]] | [[elisp:(delete-other-windows)][|1]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
*  /Maintain/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-This]] [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-This]] | [[elisp:(bx:org:agenda:these-files-otherWin)][Agenda-These]] [[elisp:(bx:org:todo:these-files-otherWin)][ToDo-These]]

* [[elisp:(org-shifttab)][<)]] [[elisp:(describe-function 'org-dblock-write:bx:dblock:global:org-controls)][dbFunc)]]  E|

")
;;;#+END:

;;;#+BEGIN: bx:dblock:global:org-contents-list :disabledP "false" :mode "auto"
(lambda () "
*      ################ CONTENTS-LIST   ###############
*  [[elisp:(org-cycle)][| ]]  *Document Status, TODOs and Notes*          ::  [[elisp:(org-cycle)][| ]]
*  /OBSOLETED by  org-dblock-write:bx:global:org-contents-list/

")
;;;#+END:

(lambda () "
**  [[elisp:(org-cycle)][| ]]  Idea      ::  Description   [[elisp:(org-cycle)][| ]]
")


(lambda () "
* TODO [[elisp:(org-cycle)][| ]]  Description   :: *Info and Xrefs* -- /dblock:lcnt:latex:/ --  <<Xref-Here->> [[elisp:(org-cycle)][| ]]
")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires      :: Requires [[elisp:(org-cycle)][| ]]
")


(require 'bx-lcnt-lib)


(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]    *=====================================================*
")




(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *Document Class and Comment Package*
")



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex:doc-class params) [[elisp:(org-cycle)][| ]]
  ")



(defun org-dblock-write:bx:dblock:lcnt:latex:doc-class (params)
  "Comes at very top. Specifies class/lcnt-class, sides, texClass, langs.

Each of these become buffer local variables that can be used by other dblocks in same buffer.
inserts:
documentclass[$effectiveTexOptions]{$effectiveTexClass}
usepackage{comment}
"

  (let ((bx:class (or (plist-get params :class) ""))
	(bx:langs (or (plist-get params :langs) ""))
	(@texClass (or (plist-get params :texClass) nil))
	(@sides (or (plist-get params :sides) "two"))	
	)
    (bx:lcnt:info:base-read)

    (setq-local ~lcnt:texClass @texClass)
    (setq-local ~lcnt:class bx:class)    

    (blee:dblock:params:desc
     'latex-mode
     ":class \"pres+art|art+pres|art|memo|book\" :langs \"en+fa|fa+en|en\" :texClass \"book|article\"")
    

    (when (equal bx:class "memo")
      (when (or (equal bx:langs "en")
		(equal bx:langs "en+fa"))
	(insert "\
\\documentclass{article}
\\usepackage{comment}")
	)
      (when (equal bx:langs "fa+en")
	(insert "\
\\documentclass{article}
\\usepackage{comment}")
	)
      )

    (when (equal bx:class "book")
      (when (or (equal bx:langs "en")
		(equal bx:langs "en+fa"))
	(insert "\
\\documentclass[twoside]{book}
\\usepackage{comment}")
	)
      (when (equal bx:langs "fa+en")
	(insert "\
\\documentclass[twoside]{book}
\\usepackage{comment}")
	)
      )
    

    (when (or (equal bx:class "art+pres")
	      (equal bx:class "art"))

      (when (or (equal bx:langs "en")
		(equal bx:langs "en+fa"))
	(insert "\
\\documentclass{article}
\\usepackage{comment}")
	)
      (when (equal bx:langs "fa+en")
	(insert "\
\\documentclass{article}
\\usepackage{comment}")
	)
      )

    ;;;
    ;;; PRESENTATION BEGIN
    (when (or (equal bx:class "pres+art")
	      (equal bx:class "pres"))
      ;;; ENGLISH
      (when 
	  (or
	   (equal bx:langs "en")
	   (equal bx:langs "en+fa")
	   )
	(insert "\
%\\nonstopmode

\\documentclass[ignorenonframetext]{beamer}
\\usepackage{comment}")	
	)
      
      ;;; FARSI
      (when (equal bx:langs "fa+en")
	(insert "\
\\documentclass[ignorenonframetext]{bidibeamer}
\\usepackage{comment}")	

	)
      )
    ))

(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *Main Document Org Controls*
*  With LaTeX Mode  =bx:dblock:global:org-controls=  =bx:dblock:global:this-file= =bx:dblock:global:org-contents-list=
")




(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex:inputed:title params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:latex:inputed-title (params)  
  (let (
	(bx:disabledP (or (plist-get params :disabledP) "UnSpecified"))
	(bx:mode (or (plist-get params :mode) "auto"))       
	)
    
    (if (not
	 (or (equal "TRUE" bx:disabledP)
	     (equal "true" bx:disabledP)))
	(progn
	  (if (string-equal "auto" bx:mode)
	      (progn
		(setq bx:mode major-mode)
		))
	  
	  ;;; Processing Body
	  (bx:lcnt:info:base-read)
	  
	  (bx:dblock:global:moded:insert-begin bx:mode)
	  
	  (bx:dblock:org-mode:func-open 1 (compile-time-function-name))
	  
	  (insert (format "\
*  [[elisp:(beginning-of-buffer)][Top]] ################  [[elisp:(delete-other-windows)][(1)]]   /*%s-%s -- LCNT Panel -- lcntProc.sh, presProc.sh and Mailings*/
*  [[elisp:(beginning-of-buffer)][Top]] ################  [[elisp:(delete-other-windows)][(1)]]   *%s*
*  [[elisp:(beginning-of-buffer)][Top]] ################  [[elisp:(delete-other-windows)][(1)]]   %s
*  [[elisp:(beginning-of-buffer)][Top]] ################  [[elisp:(delete-other-windows)][(1)]]   \
"
			  (get 'bx:lcnt:info:base  'type)
			  (get 'bx:lcnt:info:base  'lcntNu)
			  (get 'bx:lcnt:info:base  'shortTitle)
			  (get 'bx:lcnt:info:base  'url)
			  ))

	  
	  (mapcar '(lambda (arg)
		     (progn
		       (insert
			(format "\
[[elisp:(find-file \"%s.ttytex\")][Visit ./%s.ttytex]] || "		  
			  arg arg))))
	       (split-string (get 'bx:lcnt:info:base  'docSrcList))
	       )
	  ;;;(insert (format "\n*      ================\n" ))
          (insert (format "\n"))

	  (bx:dblock:org-mode:func-close 1 (compile-time-function-name))
	  
	  (bx:dblock:global:moded:insert-end bx:mode)

	  )
      (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
      )))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex:commands params) [[elisp:(org-cycle)][| ]]
  ")


 [[elisp:(bx:iimBash:cmndLineExec :wrapper "" :name "lcntProc.sh" :iif "buildResultsRelease" :iifArgs "")][lcntProc.sh -i buildResultsRelease]]

(defun org-dblock-write:bx:dblock:lcnt:latex:commands (params)  
  (let (
	(bx:types (or (plist-get params :types) ""))
	(docsList)
	(bufferFileName (file-name-nondirectory buffer-file-name))
	(bx:mode (or (plist-get params :mode) "auto"))       
	)
    (progn
      (if (string-equal "auto" bx:mode)
	  (progn
	    (setq bx:mode major-mode)
	    )))
    
    (bx:lcnt:info:base-read)

    (bx:dblock:global:moded:insert-begin bx:mode)

    (bx:dblock:org-mode:func-open 1 (compile-time-function-name))
    

    (insert (format "\
\\begin{comment}
*      IIM Parameters    ::  [[elisp:(bx:iimBash:resultsShow:cmndLineElems)][Show Cmnd Line Elems]]\
 || [[elisp:(setq bx:iimBash:iimParamsArgs \"-p extent=build+view\")][-p extent=build+view]]\
 || [[elisp:(setq bx:iimBash:iimParamsArgs \"-p extent=build\")][-p extent=build]]\
 || [[elisp:(setq bx:iimBash:iimParamsArgs \"-p extent=view\")][-p extent=view]]\

*      Related           ::  [[elisp:(find-file \"./Panel.org\")][Visit ./Panel.org]] | [[elisp:(find-file \"./mailing/content.mail\")][Visit ./mailing/content.mail]]| [[elisp:(find-file \"./mailing/Panel.org\")][Visit ./mailing/Panel.org]]\

*      Build+Release     ::  [[elisp:(bx:iimBash:cmndLineExec :wrapper \"\" :name \"lcntProc.sh\" :iif \"buildResultsRelease\" :iifArgs \"\")][lcntProc.sh -i buildResultsRelease]]\
 || [[elisp:(lsip-local-run-command-here \"lcntProc.sh -i fullClean\")][lcntProc.sh -i fullClean]]\
 || [[elisp:(cvs-update \".\" t)][Version Control]]\

*      Build & Preview   ::  [[elisp:(bx:iimBash:cmndLineExec :wrapper \"\" :name \"lcntProc.sh\" :iif \"buildPdfPreview\" :iifArgs \"%s\")][lcntProc.sh -i buildPdfPreview %s]]\
 || [[elisp:(bx:iimBash:cmndLineExec :wrapper \"\" :name \"lcntProc.sh\" :iif \"buildHtmlPreview\" :iifArgs \"%s\")][lcntProc.sh -i buildHtmlPreview %s]]
"
		    bufferFileName bufferFileName bufferFileName bufferFileName
		    ))
    
    (bx:dblock:org-mode:func-close 1 (compile-time-function-name))
	  
    (bx:dblock:global:moded:insert-end bx:mode)
    
    ))

(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *Early Common Packages*
")



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:lcnt:latex:heveaUse params) [[elisp:(org-cycle)][| ]]
  ")

;;;
;;; Example Usage:
;;; %%%#+BEGIN: bx:lcnt:latex:heveaUse :class "art+pres" :langs "en+fa" :htmlHead "auto" :htmlFoot "auto"
;;;
;;;
(defun org-dblock-write:bx:lcnt:latex:heveaUse (params)
  (let (
	($class (or (plist-get params :class) ""))
	($langs (or (plist-get params :langs) ""))
	($htmlHead (or (plist-get params :htmlHead) ""))
	($htmlFoot (or (plist-get params :htmlFoot) ""))
	($htmlHeadStr "")
	($htmlFootStr "")
	)
    (bx:lcnt:info:base-read)

    (insert (format "\
\\begin{comment}\n*\
  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || /DBLOCK: HeVeA Use/  ::  [[elisp:(org-cycle)][| ]]
\\end{comment}\n"))
    
    (insert "
\\usepackage{hevea} 
%HEVEA\\usepackage[utf8]{inputenc}
")

    (when (not (equal $htmlHead "none"))
      (setq $htmlHeadStr "\\vspace{0.4in}")
      )

    (when (not (equal $htmlFoot "none"))
      (setq $htmlFootStr "\\bigskip")
      )

    ;;;
    ;;; Left To Right
    ;;; 
    (when (or (equal $langs "en")
	      (equal $langs "en+fa"))
      (insert (format "
\\htmlhead{
%s
}

\\htmlfoot{
%s
}
"
		      $htmlHeadStr
		      $htmlFootStr
		      ))
      )
		      
    ;;;
    ;;; Right To Left
    ;;; 
    (when (or (equal $langs "fa")
	      (equal $langs "fa+en"))
      (insert (format "
\\htmlhead{
\\begin{rawhtml}
<DIV dir=\"rtl\">
\\end{rawhtml}
%s
}

\\htmlfoot{
%s
\\begin{rawhtml}
</DIV>
\\end{rawhtml}
}
"    
    		      $htmlHeadStr
		      $htmlFootStr
		      ))
      )
    ))

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex:early-common-packages params) [[elisp:(org-cycle)][| ]]
")


(defun org-dblock-write:bx:dblock:lcnt:latex:early-common-packages (params)
  (let (
	(bx:class (or (plist-get params :class) ""))
	(bx:langs (or (plist-get params :langs) ""))
	($modern (or (plist-get params :modern) ""))
	($modernStr "")	
	)
    (bx:lcnt:info:base-read)
    ;;;(insert "%{{{ DBLOCK-header-begin\n")

    (when (equal $modern "true")
      (setq $modernStr " -- MODERNIZED")
      )
    
    (blee:dblock:params:desc
     'latex-mode
     ":class \"pres+art\" :langs \"en+fa\" :toggle \"enabled|disabled|hide\" :curBuild nil|t :paperSize \"8.5x11|6x9\" :spacing nil|t :curBuild nil|t :paperSize \"8.5x11|6x9\" :when \"main|mailing\""
     )

    (org-latex-node-insert-note
     :label "DBLOCK:"
     :name (format
	    "early-common-packages%s"
	    $modernStr
	    )
     :level 1
     :comment (format "")
     )
    
    
    (lambda () "
**  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || memo  [[elisp:(org-cycle)][| ]]
")

    
    (when (equal bx:class "memo")
      (when (or (equal bx:langs "en")
		(equal bx:langs "en+fa"))
	
	(when (not (equal $modern "true"))
	  (insert "
\\usepackage{hevea} 
%HEVEA\\usepackage[utf8]{inputenc}

\\htmlhead{
\\vspace{0.4in}
}

\\htmlfoot{
\\bigskip
}

")
	  )
	)
      (when (equal bx:langs "fa+en")
	(when (not (equal $modern "true"))
	  (insert "
\\usepackage{hevea} 
%HEVEA\\usepackage[utf8]{inputenc}

\\htmlhead{
\\begin{rawhtml}
<DIV dir=\"rtl\">
\\end{rawhtml}
\\vspace{0.4in}
}

\\htmlfoot{
\\bigskip
\\begin{rawhtml}
</DIV>
\\end{rawhtml}
}
"))
	
	(insert "

\\usepackage{rcs}
\\usepackage{color}

\\usepackage{hyperref}
\\usepackage{url}

\\usepackage{fancyhdr}

\\usepackage{graphicx}

\\usepackage{xepersian}

\\settextfont[Scale=1]{XB Zar}
%\\newfontfamily\\arabicfontsf[Script=Arabic,Scale=1]{B Nazanin}%

% for in-line Arabic we need R-L control
\\newenvironment{fa}{\\beginR\\persian}{\\endR}

\\setlatintextfont{Times New Roman}
\\setdigitfont[Scale=1]{XB Zar}

")
	)

     (when (equal bx:langs "en+fa")
       (insert "
\\usepackage{fontspec}
\\setmainfont[Mapping=tex-text]{Linux Libertine O}

\\usepackage{morefloats}

\\usepackage{rcs}
\\usepackage{makeidx}
\\usepackage{supertabular}
\\usepackage{lscape}
\\usepackage{array} 
\\usepackage{framed}
\\usepackage{listings}

\\usepackage{color}

\\usepackage{hyperref}
\\usepackage{url}

\\usepackage{fancyhdr}

\\usepackage{caption}

\\usepackage{bystarsub3section}
\\usepackage{bystarlisting}


\\usepackage{fontspec}
% \\usepackage{xltxtra}  % OBSOLETED In Ubuntu 16.04 and 18.04
\\usepackage{xunicode}

\\usepackage{paracol}

\\usepackage{qrcode}
")

       (if (not (equal bx:class "art+pres"))
	 (insert "\\usepackage{bidi}\n"))

       (insert "
\\makeatletter
\\@ifpackageloaded{caption}{\\input{caption-xetex-bidi.def}}{}
\\makeatother

\\newfontfamily{\\persian}[Script=Arabic]{XB Zar}
%\\newfontfamily\\arabicfont[Script=Arabic,Scale=1]{B Nazanin}%
%\\newfontfamily\\arabicfontsf[Script=Arabic,Scale=1]{B Nazanin}%
%\\newfontinstance{\\persian}[Script=Arabic]{B Nazanin}

% for in-line Arabic we need R-L control
\\newenvironment{fa}{\\beginR\\persian}{\\endR}

% simple environment for R-L paragraphs
\\newenvironment{faPar}
{\\everypar={\\setbox0\\lastbox \\beginR
\\box0 \\persian}}{}

")
       )
     )

    (lambda () "
**  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || art+pres OR art  [[elisp:(org-cycle)][| ]]
")
    

    (when (or (equal bx:class "art+pres")
	      (equal bx:class "art"))

      (when (or (equal bx:langs "en")
		(equal bx:langs "en+fa"))
	(when (not (equal $modern "true"))
	  (insert "
\\usepackage{hevea} 
%HEVEA\\usepackage[utf8]{inputenc}

\\htmlhead{
\\vspace{0.4in}
}

\\htmlfoot{
\\bigskip
}
")
	  )
	)
      (when (equal bx:langs "fa+en")
	(when (not (equal $modern "true"))	
	  (insert "
\\usepackage{hevea} 
%HEVEA\\usepackage[utf8]{inputenc}

\\htmlhead{
\\begin{rawhtml}
<DIV dir=\"rtl\">
\\end{rawhtml}
\\vspace{0.4in}
}

\\htmlfoot{
\\bigskip
\\begin{rawhtml}
</DIV>
\\end{rawhtml}
}
")
	  )
	)

      (when  (or (equal bx:langs "en")
		 (equal bx:langs "en+fa"))
	(insert "
\\usepackage{amssymb}
\\usepackage{fontspec}
\\setmainfont[Mapping=tex-text]{Linux Libertine O}

\\usepackage{float}
\\usepackage{morefloats}

\\usepackage{rcs}
\\usepackage{makeidx}
\\usepackage{supertabular}
\\usepackage{lscape}
\\usepackage{array} 
\\usepackage{framed}
\\usepackage{listings}

\\usepackage{color}

\\usepackage{hyperref}
\\usepackage{url}

\\usepackage{fancyhdr}

\\usepackage{caption}

\\usepackage{bystarsub3section}
\\usepackage{bystarlisting}

\\usepackage{fontspec}
% \\usepackage{xltxtra}  % OBSOLETED In Ubuntu 16.04 and 18.04
\\usepackage{xunicode}
")
       (if (not (equal bx:class "art+pres"))
	   (insert "\\usepackage{bidi}\n"))

       (insert "


\\usepackage{beamerarticle}

\\usepackage{paracol}

\\usepackage{qrcode}  %%% Must come after beamerarticle

\\usepackage{tikz}
")
       )
     )

    (lambda () "
**  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || art+pres [[elisp:(org-cycle)][| ]]
")
    

;;     (when (equal bx:class "art+pres")
;;       (insert "
;; \\usepackage{beamerarticle}
;; \\usepackage{bidi}

;; "))

    (lambda () "
**  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || art+pres OR art [[elisp:(org-cycle)][| ]]
")
    

    ;;; This RCS Stuff needs to be cleaned up or eliminated
    (when (or (equal bx:class "art+pres")
	      (equal bx:class "art"))

      ;;; ENGLISH
      (when (equal bx:langs "en")
	(insert "
\\begin{latexonly}
\\def\\RcsEmptyValue{$\\rm \\langle Unknown \\rangle$}
\\RCSdef $Revision: 1.36 $
\\RCSdef $Date: 2019-03-28 05:00:14 $
\\RCSdef $Source: /cvsd/rep1/profile/intra/employee/lisp/dblock/dblock-lcnt-latex.el,v $
\\RCSdef $Name:  $
\\RCSdef $Author: lsipusr $
\\end{latexonly}\n")
	)

      ;;; FARSI
      (when (equal bx:langs "fa+en")
	(insert "
\\usepackage{rcs}
\\usepackage{color}

%\\usepackage{html}
\\usepackage{hyperref}
\\usepackage{url}

\\usepackage{graphicx}
\\usepackage{beamerarticle}

\\usepackage{xepersian}

\\settextfont[Scale=1]{XB Zar}
\\setlatintextfont{Times New Roman}
\\setdigitfont[Scale=1]{XB Zar}

\\newfontfamily{\\persian}[Script=Arabic]{XB Zar
%\\newfontfamily\\arabicfont[Script=Arabic,Scale=1]{B Nazanin}%
%\\newfontfamily\\arabicfontsf[Script=Arabic,Scale=1]{B Nazanin}%
%\\newfontinstance{\\persian}[Script=Arabic]{B Nazanin}

% for in-line Arabic we need R-L control
\\newenvironment{fa}{\\beginR\\persian}{\\endR}
")
	)
      )


    (lambda () "
**  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || pres+art OR pres [[elisp:(org-cycle)][| ]]
")
     

    ;;;
    ;;; PRESENTATION BEGIN
    (when (or (equal bx:class "pres+art")
	      (equal bx:class "pres"))
      ;;; ENGLISH
      (when 
	  (or
	   (equal bx:langs "en")
	   (equal bx:langs "en+fa")
	   )
	(insert "
%%%\\nonstopmode

%%%\\documentclass[ignorenonframetext]{beamer}

%%%\\documentclass[notes=only]{beamer}
%%%\\setbeameroption{show notes}
%%%\\documentclass[aspectratio=169,ignorenonframetext]{beamer}

\\usepackage{hevea} 
%HEVEA\\usepackage[utf8]{inputenc}

\\htmlhead{
\\vspace{0.4in}
}

\\htmlfoot{
\\bigskip
}

\\usepackage{pdfpcnotes}

\\usepackage{beamerthemesplit}
\\usepackage[orientation=landscape,size=custom,width=16,height=9,scale=0.5,debug]{beamerposter}
"
		)

	)
      
      ;;; FARSI
      (when (equal bx:langs "fa+en")
	(insert "
%%%\\documentclass[ignorenonframetext]{bidibeamer}

% \\usepackage{fontspec}
% \\setmainfont[Script=Arabic,Mapping=farsidigits]{XB Zar}
% \\def\\familydefault{\\rmdefault}
% \\newfontfamily\\rmfamily[Mapping=tex-text]{Times New Roman}
% \\usepackage{bidi}
% \\newenvironment{latin}{\\begin{LTR}\\rmfamily}{\\end{LTR}}


\\usepackage{xepersian}

\\settextfont[Scale=1]{XB Zar}
\\setlatintextfont{Times New Roman}
\\setdigitfont[Scale=1]{XB Zar}

\\def\\biditheoremname{قضیه}
\\def\\bidicorollaryname{نتیجه}
\\def\\bidifactname{حقیقت}
\\def\\bidilemmaname{لم}
\\def\\bidiproblemname{مسئله}
\\def\\bidisolutionname{پاسخ}
\\def\\bididefinitionname{تعریف}
\\def\\bididefinitionsname{تعریف‌ها}
\\def\\bidiexamplename{مثال}
\\def\\bidiexamplesname{مثال‌ها}
\\def\\bidiproofname{اثبات}
")
	)
      )

    ;;;(insert "%}}} DBLOCK-header-begin")
    ))




(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *Optional Packages And Style Settings*
")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex:optional-packages-and-styles params) [[elisp:(org-cycle)][| ]]
")

(defun org-dblock-write:bx:dblock:lcnt:latex:optional-packages-and-styles (params)
  (let ((bx:class (or (plist-get params :class) ""))
	(bx:langs (or (plist-get params :langs) "")))
    (bx:lcnt:info:base-read)
    ;;;(insert "%{{{ DBLOCK-header-begin\n")
    (org-latex-section-insert-dblock-name "optional-packages-and-styles")
    ))
 
(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *Custom Specialized Packages*
")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex:custom-specialized-packages params) [[elisp:(org-cycle)][| ]]
")

(defun org-dblock-write:bx:dblock:lcnt:latex:custom-specialized-packages (params)
  (let ((bx:class (or (plist-get params :class) ""))
	(bx:langs (or (plist-get params :langs) "")))
    (bx:lcnt:info:base-read)
    ;;;(insert "%{{{ DBLOCK-header-begin\n")
    (org-latex-section-insert-dblock-name "custom-specialized-packages")
    ))


(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *Late Common Packages*
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex:late-common-packages params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:latex:late-common-packages (params)
  (let ((bx:class (or (plist-get params :class) ""))
	(bx:langs (or (plist-get params :langs) "")))
    (bx:lcnt:info:base-read)
    ;;;(insert "%{{{ DBLOCK-header-end\n")

    (org-latex-section-insert-dblock-name "late-common-packages")

    (when (equal bx:class "memo")
      (insert "
%%%\\begin{document}\n"))


    (when (or (equal bx:class "art+pres")
	      (equal bx:class "art"))
      ;;; ENGLISH
      (when (equal bx:langs "en")
	(insert "
%%%\\begin{document}\\ifpdf\\DeclareGraphicsExtensions{.pdf,.jpg,.png}\\else\\DeclareGraphicsExtensions{.eps,.epsi,.ps,.pdf}\\fi\n")
	)

      (when (equal bx:langs "en+fa")
	(insert "
%%%\\begin{document}
")
	)

      (when (equal bx:langs "fa+en")
	(insert "
%%%\\begin{document}
")
	)


      )      

    (when (or (equal bx:class "pres+art")
	      (equal bx:class "pres"))

      ;;; JUST ENGLISH
      (when (equal bx:langs "en")
	(insert "
\\usepackage{morefloats}
\\usepackage[english]{babel}

\\usepackage[latin1]{inputenc}

\\usepackage{times}
\\usepackage[T1]{fontenc}
")
	)

      (when (equal bx:langs "en+fa")
	(insert "
\\usepackage{color}

\\usepackage{hyperref}
\\usepackage{url}

\\usepackage{multicol}

\\usepackage{fontspec}")

	;;;
	;;; NOTYET test on 1604 perhaps xltxtra is not needed all together
	;;; 
	(when (not (ubuntu-1804-P))
	  (insert "
% \\usepackage{xltxtra}  % OBSOLETED In Ubuntu 16.04 and 18.04"))

	
	(insert "
\\usepackage{xunicode}

\\newenvironment{bidiSepBeforeHevea}{}{}
\\usepackage{bidi}
\\newenvironment{bidiSepAfterHevea}{}{}

\\usepackage{bystarpersian}   % Defines: \\newfontfamily{\\persian}, \\newcommand{\\farsi}, \\newenvironment{faPar},{fa}
\\usepackage{bystarpresentation}   % Defines: \\excludecomment{presentationMode} \\newcommand{\\pnote}
")
	)
      ;;;(insert "\\begin{document}\n")
      )
    ;;;(insert "%}}} DBLOCK-header-end")
    ))

(defun org-dblock-write:bx:lcnt:latex:feature-late-common-packages (@params)
  (let (
	(<class (or (plist-get @params :class) ""))
	(<langs (or (plist-get @params :langs) ""))
	(<toggle (or (plist-get @params :toggle) ""))
	(<curBuild (or (plist-get @params :curBuild) ""))
	;;;
	)
    
    (blee:dblock:params:desc
     'latex-mode
     ":class \"book|pres+art\" :langs \"en+fa\" :toggle \"enabled|disabled|hide\" :curBuild \"t|path\""
     )

    (when (not (equal <toggle "hide"))
      (org-latex-node-insert-note
       :label (format "DBLOCK:")
       :name "late-common-packages"
       :level 1
       :comment (format "Place Holder For Now")
       ))

    (insert "
%%% Place Holder For Now\
"
	    )
    
    ))



(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *Common Packages Style Settings*
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex:common-packages-style-settings params) [[elisp:(org-cycle)][| ]]
")

  
(defun org-dblock-write:bx:dblock:lcnt:latex:common-packages-style-settings (params)
  (bx:lcnt:info:base-read)  
  (let ((bx:class (or (plist-get params :class) ""))
	(bx:langs (or (plist-get params :langs) ""))
	($pageNu (or (plist-get params :pageNu) t))
	(<style (or (plist-get params :style) t))	
	;;; Below was copy-pasted -- some are likely unused.
	(coverPage (or (plist-get params :coverPage) "UnSpecified"))
	(bx:form (or (plist-get params :form) ""))		
	(lcnt-shortTitle (get 'bx:lcnt:info:base 'shortTitle))
	(lcnt-mainTitle (get 'bx:lcnt:info:base 'mainTitle))
	(lcnt-subTitle (get 'bx:lcnt:info:base 'subTitle))
	(lcnt-subSubTitle (get 'bx:lcnt:info:base 'subSubTitle))
	(lcnt-date (get 'bx:lcnt:info:base 'date))
	(lcnt-type (get 'bx:lcnt:info:base 'type))
	(lcnt-lcntNu (get 'bx:lcnt:info:base 'lcntNu))
	(lcnt-version (get 'bx:lcnt:info:base 'version))
	(lcnt-url (get 'bx:lcnt:info:base 'url))
	(lcnt-author1 (get 'bx:lcnt:info:base 'author1))
	(lcnt-authorName1 (get 'bx:lcnt:info:base 'authorName1))
	(lcnt-authorUrl1 (get 'bx:lcnt:info:base 'authorUrl1))
	(lcnt-presArtSrcFile (get 'bx:lcnt:info:base 'presArtSrcFile))	
	(bufferFileName (file-name-nondirectory buffer-file-name))	
	)

    (blee:dblock:params:desc 'latex-mode ":class \"pres+art\" :langs \"en+fa\" :pageNu nil|t :style \"bystar\"")
    
    ;; (org-latex-section-insert-dblock-name "common-packages-style-settings")

    (org-latex-node-insert-note
     :label (format "DBLOCK: common-packages-style-settings")
     :name ""
     :level 1
     :comment (format "")
     )    

    (lambda () "
**  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || art+pres OR art OR memo [[elisp:(org-cycle)][| ]]
")
     
    
    (when (or 
	   (equal bx:class "art+pres")
	   (equal bx:class "art")
	   (equal bx:class "memo")
	   )
      (insert "
\\usepackage{bystarcolors}

\\parindent 0 true pc

\\addtolength{\\parskip}{5pt}
")
      )


    (lambda () "
**  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || pres+art OR pres [[elisp:(org-cycle)][| ]]
")
    

    (when (or (equal bx:class "pres+art")
	      (equal bx:class "pres"))
      (when (or (equal bx:langs "en")
		(equal bx:langs "en+fa"))
	(insert "
\\mode<presentation>
{
  \\usetheme{Warsaw}

  \\setbeamercovered{transparent}
  % or whatever (possibly just delete it)
}
")

	(insert (format "
\\title[%s]
{%s}\n" lcnt-shortTitle lcnt-mainTitle))

      (if (not (string-equal lcnt-subTitle ""))
	  (insert (format "
\\subtitle[%s]
{%s}\n" lcnt-subTitle lcnt-subTitle)))

      ;;;(if (not (string-equal lcnt-subSubTitle ""))
	;;;  (insert (format "%s\\\\\n" lcnt-subSubTitle)))

      (insert (format "
\\author[%s] 
{%s\\\\
Email: \\href{%s}{%s}\\\\
}
" lcnt-authorName1 lcnt-authorName1 lcnt-authorUrl1 lcnt-authorUrl1))

      (insert (format "
\\institute[%s-%s] 
{\\href{%s}{%s}}
"   lcnt-type lcnt-lcntNu lcnt-url lcnt-url))

      (insert (format "
\\date[%s]
{%s}
" lcnt-date lcnt-date))
;;;{%s\\\\Varbatim Copying Permitted}      

      (insert (format "
\\subject{%s}
" lcnt-shortTitle))

      (when $pageNu
	(insert "
\\defbeamertemplate*{footline}{shadow theme}
{%
  \\leavevmode%
  \\hbox{\\begin{beamercolorbox}[wd=.5\\paperwidth,ht=2.5ex,dp=1.125ex,leftskip=.3cm plus1fil,rightskip=.3cm]{author in head/foot}%
    \\usebeamerfont{author in head/foot}\\insertframenumber\\,/\\,\\inserttotalframenumber\\hfill\\insertshortauthor
  \\end{beamercolorbox}%
  \\begin{beamercolorbox}[wd=.5\\paperwidth,ht=2.5ex,dp=1.125ex,leftskip=.3cm,rightskip=.3cm plus1fil]{title in head/foot}%
    \\usebeamerfont{title in head/foot}\\insertshorttitle%
  \\end{beamercolorbox}}%
  \\vskip0pt%
}
")
	)

	
      (insert "
	
% ===== STYLE PARAMETERS =====

\\definecolor{darkred}{rgb}{0.5,0,0}
\\definecolor{darkgreen}{rgb}{0,0.5,0}
\\definecolor{darkblue}{rgb}{0,0,0.5}

\\hypersetup{
    colorlinks=true        % false: boxed links; true: colored links
}

")
	)

      (when (equal bx:langs "fa+en")
	(insert "
\\mode<presentation>
{
  \\usetheme{Warsaw}
}


% ===== STYLE PARAMETERS =====

\\definecolor{darkred}{rgb}{0.5,0,0}
\\definecolor{darkgreen}{rgb}{0,0.5,0}
\\definecolor{darkblue}{rgb}{0,0,0.5}

\\hypersetup{
    bookmarks=true,         % show bookmarks bar?
    unicode=false,          % non-Latin characters in Acrobat’s bookmarks
    pdftoolbar=true,        % show Acrobat’s toolbar?
    pdfmenubar=true,        % show Acrobat’s menu?
    pdffitwindow=false,     % window fit to page when opened
    pdfstartview={FitH},    % fits the width of the page to the window
    pdftitle={My title},    % title
    pdfauthor={Author},     % author
    pdfsubject={Subject},   % subject of the document
    pdfcreator={Creator},   % creator of the document
    pdfproducer={Producer}, % producer of the document
    pdfkeywords={keyword1} {key2} {key3}, % list of keywords
    pdfnewwindow=true,      % links in new window
    colorlinks=true ,       % false: boxed links; true: colored links
    linkcolor=darkblue,     % color of internal links
    citecolor=red,          % color of links to bibliography
    filecolor=darkgreen,    % color of file links
    urlcolor=darkred        % color of external links
}

")
	)
      )
    ;;;(insert "%}}} DBLOCK-style-params")
    ))





(defun org-dblock-write:bx:dblock:lcnt:latex:common-packages-style-settings-OBSOLETED (params)
  (let ((bx:class (or (plist-get params :class) ""))
	(bx:langs (or (plist-get params :langs) ""))
	($pageNu (or (plist-get params :pageNu) t))
	;;; Below was copy-pasted -- some are likely unused.
	(coverPage (or (plist-get params :coverPage) "UnSpecified"))
	(bx:form (or (plist-get params :form) ""))		
	(lcnt-shortTitle (get 'bx:lcnt:info:base 'shortTitle))
	(lcnt-mainTitle (get 'bx:lcnt:info:base 'mainTitle))
	(lcnt-subTitle (get 'bx:lcnt:info:base 'subTitle))
	(lcnt-subSubTitle (get 'bx:lcnt:info:base 'subSubTitle))
	(lcnt-date (get 'bx:lcnt:info:base 'date))
	(lcnt-type (get 'bx:lcnt:info:base 'type))
	(lcnt-lcntNu (get 'bx:lcnt:info:base 'lcntNu))
	(lcnt-version (get 'bx:lcnt:info:base 'version))
	(lcnt-url (get 'bx:lcnt:info:base 'url))
	(lcnt-author1 (get 'bx:lcnt:info:base 'author1))
	(lcnt-authorName1 (get 'bx:lcnt:info:base 'authorName1))
	(lcnt-authorUrl1 (get 'bx:lcnt:info:base 'authorUrl1))
	(lcnt-presArtSrcFile (get 'bx:lcnt:info:base 'presArtSrcFile))	
	(bufferFileName (file-name-nondirectory buffer-file-name))	
	)
    (bx:lcnt:info:base-read)

    (blee:dblock:params:desc 'latex-mode ":class \"pres+art\" :langs \"en+fa\" :pageNu nil")
    
    (org-latex-section-insert-dblock-name "DBLOCK: common-packages-style-settings")

    (lambda () "
**  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || art+pres OR art OR memo [[elisp:(org-cycle)][| ]]
")
     
    

    (when (or 
	   (equal bx:class "art+pres")
	   (equal bx:class "art")
	   (equal bx:class "memo")
	   )
      (insert "
% ===== STYLE PARAMETERS =====

\\definecolor{darkred}{rgb}{0.5,0,0}
\\definecolor{darkgreen}{rgb}{0,0.5,0}
\\definecolor{darkblue}{rgb}{0,0,0.5}

\\hypersetup{
    bookmarks=true,         % show bookmarks bar?
    unicode=false,          % non-Latin characters in Acrobat’s bookmarks
    pdftoolbar=true,        % show Acrobat’s toolbar?
    pdfmenubar=true,        % show Acrobat’s menu?
    pdffitwindow=false,     % window fit to page when opened
    pdfstartview={FitH},    % fits the width of the page to the window
    pdftitle={My title},    % title
    pdfauthor={Author},     % author
    pdfsubject={Subject},   % subject of the document
    pdfcreator={Creator},   % creator of the document
    pdfproducer={Producer}, % producer of the document
    pdfkeywords={keyword1} {key2} {key3}, % list of keywords
    pdfnewwindow=true,      % links in new window
    colorlinks=true ,       % false: boxed links; true: colored links
    linkcolor=darkblue,     % color of internal links
    citecolor=red,          % color of links to bibliography
    filecolor=darkgreen,    % color of file links
    urlcolor=darkred        % color of external links
}


\\setlength{\\textwidth}{6.0in}
\\addtolength{\\oddsidemargin}{-0.75in}
\\addtolength{\\evensidemargin}{-0.75in}

\\topmargin      0.00 in
\\textheight     8.50 in

\\setlength{\\textwidth}{16.5cm}
\\setlength{\\topmargin}{-0.3in}
\\setlength{\\textheight}{8.5in}
\\setlength{\\oddsidemargin}{0.0cm}
\\setlength{\\evensidemargin}{0.0cm}


%% \\pagestyle{fancy}
%% \\fancyhead{} % clear all header fields  
%% \\fancyhead[C]{{\\small  {\\tt Work In Progress}}}
%% \\renewcommand{\\headrulewidth}{0pt} % no line in header area
%% \\fancyfoot{} % clear all footer fields
%% \\fancyfoot[LE,RO]{\\thepage}           % page number in \"outer\" position of footer line
%% \\fancyfoot[RE,LO]{{\\tt --EARLY DRAFT DOCUMENT--\\hspace{20 mm} --Reflects Work In Progress-- }}
%% \\fancyfoot[RE,LO]{}


\\parindent 0 true pc

\\addtolength{\\parskip}{5pt}

")
      )


    (lambda () "
**  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || pres+art OR pres [[elisp:(org-cycle)][| ]]
")
    

    (when (or (equal bx:class "pres+art")
	      (equal bx:class "pres"))
      (when (or (equal bx:langs "en")
		(equal bx:langs "en+fa"))
	(insert "
\\mode<presentation>
{
  \\usetheme{Warsaw}

  \\setbeamercovered{transparent}
  % or whatever (possibly just delete it)
}
")

	(insert (format "
\\title[%s]
{%s}\n" lcnt-shortTitle lcnt-mainTitle))

      (if (not (string-equal lcnt-subTitle ""))
	  (insert (format "
\\subtitle[%s]
{%s}\n" lcnt-subTitle lcnt-subTitle)))

      ;;;(if (not (string-equal lcnt-subSubTitle ""))
	;;;  (insert (format "%s\\\\\n" lcnt-subSubTitle)))

      (insert (format "
\\author[%s] 
{%s\\\\
Email: \\href{%s}{%s}\\\\
}
" lcnt-authorName1 lcnt-authorName1 lcnt-authorUrl1 lcnt-authorUrl1))

      (insert (format "
\\institute[%s-%s] 
{\\href{%s}{%s}}
"   lcnt-type lcnt-lcntNu lcnt-url lcnt-url))

      (insert (format "
\\date[%s]
{%s}
" lcnt-date lcnt-date))
;;;{%s\\\\Varbatim Copying Permitted}      

      (insert (format "
\\subject{%s}
" lcnt-shortTitle))

      (when $pageNu
	(insert "
\\defbeamertemplate*{footline}{shadow theme}
{%
  \\leavevmode%
  \\hbox{\\begin{beamercolorbox}[wd=.5\\paperwidth,ht=2.5ex,dp=1.125ex,leftskip=.3cm plus1fil,rightskip=.3cm]{author in head/foot}%
    \\usebeamerfont{author in head/foot}\\insertframenumber\\,/\\,\\inserttotalframenumber\\hfill\\insertshortauthor
  \\end{beamercolorbox}%
  \\begin{beamercolorbox}[wd=.5\\paperwidth,ht=2.5ex,dp=1.125ex,leftskip=.3cm,rightskip=.3cm plus1fil]{title in head/foot}%
    \\usebeamerfont{title in head/foot}\\insertshorttitle%
  \\end{beamercolorbox}}%
  \\vskip0pt%
}
")
	)

	
      (insert "
	
% ===== STYLE PARAMETERS =====

\\definecolor{darkred}{rgb}{0.5,0,0}
\\definecolor{darkgreen}{rgb}{0,0.5,0}
\\definecolor{darkblue}{rgb}{0,0,0.5}

\\hypersetup{
    colorlinks=true        % false: boxed links; true: colored links
}

")
	)

      (when (equal bx:langs "fa+en")
	(insert "
\\mode<presentation>
{
  \\usetheme{Warsaw}
}


% ===== STYLE PARAMETERS =====

\\definecolor{darkred}{rgb}{0.5,0,0}
\\definecolor{darkgreen}{rgb}{0,0.5,0}
\\definecolor{darkblue}{rgb}{0,0,0.5}

\\hypersetup{
    bookmarks=true,         % show bookmarks bar?
    unicode=false,          % non-Latin characters in Acrobat’s bookmarks
    pdftoolbar=true,        % show Acrobat’s toolbar?
    pdfmenubar=true,        % show Acrobat’s menu?
    pdffitwindow=false,     % window fit to page when opened
    pdfstartview={FitH},    % fits the width of the page to the window
    pdftitle={My title},    % title
    pdfauthor={Author},     % author
    pdfsubject={Subject},   % subject of the document
    pdfcreator={Creator},   % creator of the document
    pdfproducer={Producer}, % producer of the document
    pdfkeywords={keyword1} {key2} {key3}, % list of keywords
    pdfnewwindow=true,      % links in new window
    colorlinks=true ,       % false: boxed links; true: colored links
    linkcolor=darkblue,     % color of internal links
    citecolor=red,          % color of links to bibliography
    filecolor=darkgreen,    % color of file links
    urlcolor=darkred        % color of external links
}

")
	)
      )
    ;;;(insert "%}}} DBLOCK-style-params")
    ))


(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *Begin Document*
")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex:begin-document params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:latex:begin-document (params)
  (bx:lcnt:info:base-read)  
  (let ((bx:class (or (plist-get params :class) ""))
	(bx:langs (or (plist-get params :langs) ""))
	(lcnt-shortTitle (get 'bx:lcnt:info:base 'shortTitle))
	(lcnt-mainTitle (get 'bx:lcnt:info:base 'mainTitle))
	(lcnt-subTitle (get 'bx:lcnt:info:base 'subTitle))
	(lcnt-subSubTitle (get 'bx:lcnt:info:base 'subSubTitle))
	(lcnt-date (get 'bx:lcnt:info:base 'date))
	(lcnt-type (get 'bx:lcnt:info:base 'type))
	(lcnt-lcntNu (get 'bx:lcnt:info:base 'lcntNu))
	(lcnt-version (get 'bx:lcnt:info:base 'version))
	(lcnt-url (get 'bx:lcnt:info:base 'url))
	(lcnt-author1 (get 'bx:lcnt:info:base 'author1))
	(lcnt-authorName1 (get 'bx:lcnt:info:base 'authorName1))
	(lcnt-authorUrl1 (get 'bx:lcnt:info:base 'authorUrl1))
	)
    

    ;;;(insert "%{{{ DBLOCK-main-begin\n")

    ;;(org-latex-section-insert-dblock-name "begin-document")

    (org-latex-node-insert-note
       :label (format "DBLOCK: begin-document")
       :name ""
       :level 1
       :comment (format "Delineator")
       )


    (when (equal bx:class "memo")
      (insert "
\\begin{document}\n")

      (when (equal bx:langs "en+fa")
	(insert (format "
\\title{%s}\n" lcnt-shortTitle))
      )
 
     (when (equal bx:langs "en")
	(insert "
\\thispagestyle{empty}

\\vspace*{-0.5in}

\\begin{flushleft}
{\\Huge {\\bf Mohsen Banan}}
\\end{flushleft}

\\vspace*{-.15in}

\\makebox[6.5in]{\\hrulefill}

\\vspace*{-.15in}


\\begin{flushright}
{\\small 3610 164th Place SE}\\\\
{\\small Bellevue, WA 98008}\\\\
{\\small Phone: +1 (425) 644-8026}\\\\
{\\small E-mail: desk@mohsen.1.banan.byname.net}
\\end{flushright}

\\noindent\\begin{tabular}{ll}
Date:      & October 17, 2011\\\\
To:        & Recipient\\\\
From:      & Mohsen BANAN\\\\
Subject:   & This Matter\\\\
\\\\
\\end{tabular}

%\\bigskip
")
      )
 
     (when (equal bx:langs "fa+en")
	(insert "
\\thispagestyle{empty}

\\vspace*{-0.5in}

\\begin{latin}
\\begin{flushleft}
{\\Huge {\\bf Mohsen Banan}}
\\end{flushleft}
\\end{latin}

\\vspace*{-.5in}

\\begin{flushright}
{\\Huge {\\bf محسن بنان}}
\\end{flushright}

\\vspace*{-.15in}

\\makebox[6.5in]{\\hrulefill}

\\vspace*{-.15in}

\\begin{latin}
\\begin{flushleft}
{\\small 3610 164th Place SE}\\\\
{\\small Bellevue, WA 98008}\\\\
{\\small Phone: +1 (425) 644-8026}\\\\
{\\small E-mail: desk@mohsen.1.banan.byname.net}
\\end{flushleft}
\\end{latin}

\\noindent\\begin{tabular}{ll}
تاريخ:      & ۱۰ مرداد ۱۳۹۰\\\\
به:        &  شما\\\\
از طرف:      & محسن بنان\\\\
مطلب:   & انچه که بايد گُفته شود.\\\\
\\\\
\\end{tabular}

%\\bigskip
")
      )
     )

    (when (or (equal bx:class "art+pres")
	      (equal bx:class "art"))
      (insert "
\\begin{document}

\\clearpage

\\pagenumbering{arabic}
")
      )

    (when (or (equal bx:class "pres+art")
	      (equal bx:class "pres"))
      (insert "
\\begin{document}\n")      
      %%%(insert "% dblock for pres is empty\n"))

    ;;;(insert "%}}} DBLOCK-main-begin")
    ))



(defun org-dblock-write:bx:dblock:lcnt:latex:geometry (@params)
  "Specifying paperSize overwrites curBuild values"
  (let (
	(@class (or (plist-get @params :class) ""))
	(@langs (or (plist-get @params :langs) ""))
	(@curBuild (or (plist-get @params :curBuild) nil))			
	(@paperSize (or (plist-get @params :paperSize) nil))
	;;;
	($curBuild:paperSize nil)
	;;;
	($atLeastOnceWhen nil)
	)

    ;;; when unspecified, @curBuild is t
    (unless (plist-member @params :curBuild)
      (setq @curBuild t))

    (blee:dblock:params:desc
     'latex-mode
     ":class \"pres+art\" :langs \"en+fa\" :curBuild nil|t :paperSize \"8.5x11|6x9\""
     )

    (org-latex-node-insert-note
     :label "DBLOCK:"
    :name (format
	   "Geometry --- curBuild=%s paperSize=%s"
	   @curBuild
	   @paperSize
	   )
     :level 1
     :comment (format "")
     )

    (when (not @paperSize)
      (when (not @curBuild)
	(insert
	 "\n%%% ERROR:: Either paperSize or curBuild should be specified."
	 )
	)
      (when @curBuild
	(when (bx:lcnt:curBuild:base-read)
	  (setq $curBuild:paperSize  (get 'bx:lcnt:curBuild:base 'paperSize))
	  ;;; NOTYET, verify that $curBuild:paperSize is valid
	  (setq @paperSize $curBuild:paperSize)
	  )
     
	(when (not @paperSize)
	  (insert
	   "\n%%% ERROR:: curBuild paperSize not is not valid."
	   )
	  )
	)
      )

    ;;;
    ;;; $paperSize is available now.
    ;;;

    (when @paperSize
      
      (insert (format "\n
\\usepackage{geometry}\n"))

      (when (equal @paperSize "8.5x11")
	(setq $atLeastOnceWhen t)
	(insert
	 (format "
\\geometry{paperwidth=8.5in,paperheight=11in,bindingoffset=0.2in,left=1.0in,right=1.0in,top=1in,bottom=0.75in,footskip=.25in}
"
		 )
	 )
	)
      (when (equal @paperSize "a4")
	(setq $atLeastOnceWhen t)
	(insert
	 (format "
\\geometry{a4paper,bindingoffset=0.2in,left=1.0in,right=1.0in,top=1in,bottom=0.75in,footskip=.25in}
"
		 )
	 )
	)
      (when (equal @paperSize "6x9")
	(setq $atLeastOnceWhen t)
	(insert
	 (format "
\\geometry{paperwidth=6in,paperheight=9in,bindingoffset=0.15in,left=0.75in,right=0.75in,top=0.75in,bottom=0.75in,footskip=.25in}
"
		 )
	 )
	)
      (when (equal @paperSize "17.5x23.5")
	(setq $atLeastOnceWhen t)
	(insert
	 (format "
\\geometry{paperwidth=17.5cm,paperheight=23.5cm,bindingoffset=0.15in,left=0.75in,right=0.75in,top=0.75in,bottom=0.75in,footskip=.25in}
"
		 )
	 )
	)
      (bx:eh:assert:atLeastOnceWhen
       $atLeastOnceWhen
       :context "latex"
       :info (format "Unknown Geometry %s\n"
		     @paperSize)
       )
      )
    )
  )



(defun org-dblock-write:bx:dblock:lcnt:latex:title-page-newgeometry (@params)
  "Specifying paperSize overwrites curBuild values"
  (let (
	(@class (or (plist-get @params :class) ""))
	(@langs (or (plist-get @params :langs) ""))
	(@curBuild (or (plist-get @params :curBuild) nil))			
	(@paperSize (or (plist-get @params :paperSize) nil))
	;;;
	($curBuild:paperSize nil)
	;;;
	($atLeastOnceWhen nil)
	)

    (blee:dblock:params:desc
     'latex-mode
     ":class \"pres+art\" :langs \"en+fa\" :curBuild nil|t :paperSize \"8.5x11|6x9\""
     )

    (org-latex-node-insert-note
     :label "DBLOCK:"
     :name (format
	    "Title Page New Geometry --- curBuild=%s paperSize=%s"
	    @curBuild
	    @paperSize
	    )
     :level 2
     :comment (format "")
     )

    (when (not @paperSize)
      (when (not @curBuild)
	(insert
	 "\n%%% ERROR:: Either paperSize or curBuild should be specified."
	 )
	)
      (when @curBuild
	(when (bx:lcnt:curBuild:base-read)
	  (setq $curBuild:paperSize  (get 'bx:lcnt:curBuild:base 'paperSize))
	  ;;; NOTYET, verify that $curBuild:paperSize is valid
	  (setq @paperSize $curBuild:paperSize)
	  )
     
	(when (not @paperSize)
	  (insert
	   "\n%%% ERROR:: curBuild paperSize not is not valid."
	   )
	  )
	)
      )

    ;;;
    ;;; $paperSize is available now.
    ;;;

    (when @paperSize

      (insert "
\\begin{latexonly}"
	      )      
      
      (insert 
       (format "\n
%s newgeometry paperSize=%s
"
	       "%%%"
	       @paperSize
	       )
       )

      (when (equal @paperSize "8.5x11")
	(setq $atLeastOnceWhen t)
	(insert
	 (format "
\\newgeometry{bindingoffset=0in,left=0.5in,right=0.5in,top=1.2in,bottom=0.4in,footskip=0in}
"
		 )
	 )
	)
      (when (equal @paperSize "a4")
	(setq $atLeastOnceWhen t)
	(insert
	 (format "
\\newgeometry{bindingoffset=0in,left=0.5in,right=0.5in,top=1.2in,bottom=0.4in,footskip=0in}
"
		 )
	 )
	)
      (when (equal @paperSize "6x9")
	(setq $atLeastOnceWhen t)
	(insert
	 (format "
\\newgeometry{bindingoffset=0in,left=0.25in,right=0.25in,top=0.5in,bottom=0.2in,footskip=0in}
"
		 )
	 )
	)
      (when (equal @paperSize "17.5x23.5")
	(setq $atLeastOnceWhen t)
	(insert
	 (format "
\\newgeometry{bindingoffset=0in,left=0.15in,right=0.15in,top=0.7in,bottom=0.30in,footskip=0in}
"
		 )
	 )
	)
      (when (equal @paperSize "html")
	(setq $atLeastOnceWhen t)
	(insert "
%%% newgeometry does not apply to html
"
		)
	)
      (bx:eh:assert:atLeastOnceWhen
       $atLeastOnceWhen
       :context "latex"
       :info (format "Unknown Title New NewGeometry %s\n"
		     @paperSize)
       )

      (insert "\\end{latexonly}")
      
      )
    )
  )


(defun org-dblock-write:bx:lcnt:latex:restoregeometry (@params)
  (let (
	(@class (or (plist-get @params :class) ""))
	(@langs (or (plist-get @params :langs) ""))
	(@curBuild (or (plist-get @params :curBuild) nil))			
	(@paperSize (or (plist-get @params :paperSize) nil))
	;;;
	($curBuild:paperSize nil)
	;;;
	($atLeastOnceWhen nil)
	)

    ;;; when unspecified, @curBuild is t
    (unless (plist-member @params :curBuild)
      (setq @curBuild t))
    
    (blee:dblock:params:desc
     'latex-mode
     ":class \"pres+art\" :langs \"en+fa\" :curBuild nil|t :paperSize \"8.5x11|6x9\""
     )

    (org-latex-node-insert-note
     :label "DBLOCK:"
     :name (format
	    "Restore Geometry --- curBuild=%s paperSize=%s"
	    @curBuild
	    @paperSize
	    )
     :level 2
     :comment (format "")
     )


    (when (not @paperSize)
      (when (not @curBuild)
	(insert
	 "\n%%% ERROR:: Either paperSize or curBuild should be specified."
	 )
	)
      (when @curBuild
	(when (bx:lcnt:curBuild:base-read)
	  (setq $curBuild:paperSize  (get 'bx:lcnt:curBuild:base 'paperSize))
	  ;;; NOTYET, verify that $curBuild:paperSize is valid
	  (setq @paperSize $curBuild:paperSize)
	  )
     
	(when (not @paperSize)
	  (insert
	   "\n%%% ERROR:: curBuild paperSize not is not valid."
	   )
	  )
	)
      )

    ;;;
    ;;; $paperSize is available now.
    ;;;

    (when @paperSize
      (insert 
       (format "\n
%s Titles paperSize=%s
"	       
	       "%%%"
	       @paperSize
	       )
       )
      (when (or
	     (equal @paperSize "8.5x11")
	     (equal @paperSize "a4")
	     (equal @paperSize "6x9")
	     (equal @paperSize "17.5x23.5")
	     )
	(setq $atLeastOnceWhenPaperSize t)
	(insert (format "
\\restoregeometry

\\thispagestyle{empty}
"
			)
		)
	)
      (when (equal @paperSize "html")
	(setq $atLeastOnceWhenPaperSize t)
	(insert "
%%% restoregeometry does not apply to html/hevea
"
		)
	)
      
      (bx:eh:assert:atLeastOnceWhen
       $atLeastOnceWhenPaperSize
       :context "latex"
       :info (format "Unknown PaperSize  %s\n"
		     @paperSize)
       )
      )
    )
  )


(defun org-dblock-write:bx:lcnt:latex:title-page-header (@params)
  (let (
	(@class (or (plist-get @params :class) ""))
	(@langs (or (plist-get @params :langs) ""))
	(@titleHeaderType (or (plist-get @params :titleHeaderType) ""))	
	;;;
	($atLeastOnceWhen nil)	
	)
    
    (blee:dblock:params:desc 'latex-mode ":class \"pres+art\" :langs \"en+fa\" :titleHeaderType \"none|bystar|custom\"")

    (org-latex-node-insert-note
     :label "DBLOCK:"
     :name (format
	    "Title Page Header --- titleHeaderType=%s"
	    @titleHeaderType
	    )
     :level 2
     :comment (format "")
     )

    (when (equal @titleHeaderType "custom")
      (setq $atLeastOnceWhen t)
      (insert "

%%% Custom Title Page Header Follows -- Separately
"
	      )
      )

    (when (equal @titleHeaderType "none")
      (setq $atLeastOnceWhen t)
      (insert "

%%% No Title Page Header Desired
"
	      )
      )

    (when (equal @titleHeaderType "bystar")
      (setq $atLeastOnceWhen t)
      (insert "

%%% NOTYET -- Bystar Title Header Page Comes Here
"
	      )
      )
    
    (bx:eh:assert:atLeastOnceWhen
       $atLeastOnceWhen
       :context "latex"
       :info (format "Unknown titleHeader %s\n" @titleHeaderType)
       )

    ))


(defun org-dblock-write:bx:dblock:lcnt:latex:bx-bidi  (@params)
  (let (
	(<class (or (plist-get @params :class) ""))
	(<langs (or (plist-get @params :langs) ""))
	;;;
	($lcnt-shortTitle nil)
	;;;
	($atLeastOnce nil)
	)

    (bx:lcnt:info:base-read)
    (setq $lcnt-shortTitle (get 'bx:lcnt:info:base 'shortTitle))
	
    
    (blee:dblock:params:desc 'latex-mode ":class \"pres+art\" :langs \"en+fa\"")
    
    ;; (org-latex-section-insert-dblock-name
    ;;  (format "BX-BIDI ==="))

    (org-latex-node-insert-note
     :label (format "DBLOCK: BX-BIDI")
     :name ""
     :level 1
     :comment (format "With HeVeA Support")
     )

    (insert "
\\newenvironment{bidiSepBeforeHevea}{}{}
\\usepackage{bidi}
\\newenvironment{bidiSepAfterHevea}{}{}

\\usepackage{bystarpersian}   % Defines: \\newfontfamily{\\persian}, \\newcommand{\\farsi}, \\newenvironment{faPar},{fa}
\\usepackage{bystararticle}   % Defines: \\excludecomment{presentationMode} \\newcommand{\\pnote}
"
	    )
    ))



(defun org-dblock-write:bx:lcnt:latex:begin-document  (@params)
  (let (
	(<class (or (plist-get @params :class) ""))
	(<langs (or (plist-get @params :langs) ""))
	)
    
    (blee:dblock:params:desc 'latex-mode ":class \"pres+art\" :langs \"en+fa\"")
   
    
    ;; (org-latex-section-insert-dblock-name (format "Pure Begin Document ==="))

    (org-latex-node-insert-note
     :label (format "Dblock: Pure Begin Document ===")
     :name ""
     :level 1
     :comment (format "")
     )
    

    (insert "\n
\\begin{document}
"
	    )
    ))


(defun org-dblock-write:bx:lcnt:latex:appendices-begin  (@params)
  (let (
	(<class (or (plist-get @params :class) ""))
	(<langs (or (plist-get @params :langs) ""))
	(<toggle (or (plist-get @params :toggle) ""))	
	;;;
	)
    
    (blee:dblock:params:desc 'latex-mode ":class \"pres+art\" :langs \"en+fa\" :toggle \"enabled|disabled|hide\" ")

    (when (not (equal <toggle "hide"))
      ;;(org-latex-section-insert-dblock-name (format "appendices-begin --- toggle=%s" <toggle))
      (org-latex-node-insert-note
       :label (format "Dblock: appendices-begin --- toggle=%s" <toggle)
       :name ""
       :level 1
       :comment (format "")
       )
      )
    
    (when (equal <toggle "hide")
      (setq <toggle "disabled")
      )

    (when (equal <toggle "enabled")
      (insert "
\\begin{appendices}\
"
	      ))
    ))

(defun org-dblock-write:bx:lcnt:latex:appendices-end  (@params)
  (let (
	(<class (or (plist-get @params :class) ""))
	(<langs (or (plist-get @params :langs) ""))
	(<toggle (or (plist-get @params :toggle) ""))	
	;;;
	)
    
    (blee:dblock:params:desc 'latex-mode ":class \"pres+art\" :langs \"en+fa\" :toggle \"enabled|disabled|hide\" ")

    (when (not (equal <toggle "hide"))
      ;;(org-latex-section-insert-dblock-name (format "appendices-end --- toggle=%s" <toggle))
      (org-latex-node-insert-note
       :label (format "Dblock: appendices-end --- toggle=%s" <toggle)
       :name ""
       :level 1
       :comment (format "")
       )
      )
    
    (when (equal <toggle "hide")
      (setq <toggle "disabled")
      )

    (when (equal <toggle "enabled")
      (insert "
\\end{appendices}\
"
	      ))
    ))

(defun org-dblock-write:bx:lcnt:latex:print-bibliography  (@params)
  (let (
	(@class (or (plist-get @params :class) ""))
	(@langs (or (plist-get @params :langs) ""))
	(@toggle (or (plist-get @params :toggle) "enabled"))
	(@curBuild (or (plist-get @params :curBuild) ""))
	(@bibProvider (or (plist-get @params :bibProvider) "biblatex"))
	(@bibSrcPaths (or (plist-get
			   @params
			   :bibSrcPaths)
			  "/lcnt/BIB/plpcUrl,/lcnt/BIB/rfcs,/lcnt/BIB/bxsup"
			  ))
	
	;;;
	($atLeastOnceWhen nil)
	)

    ;;; when unspecified, @curBuild is t
    (unless (plist-member @params :curBuild)
      (setq @curBuild t))
    
    (blee:dblock:params:desc
     'latex-mode
     ":class \"book|pres+art\" :langs \"en+fa\" :toggle \"enabled|disabled|hide\"  :bibProvider \"biblatex|bibtex\" :style \"plain\""
     )

    (when (not (equal @toggle "hide"))
      (org-latex-node-insert-note
       :label (format "DBLOCK:")
       :name (format
	      "print-bibliography --- toggle=%s bibProvider=%s bibSrcPaths=%s"
	      @toggle
	      @bibProvider
	      @bibSrcPaths	      
	      )
       :level 1
       :comment (format "")
       )
      )
    
    (when (equal @toggle "hide")
      (setq @toggle "disabled")
      )

    (when (equal @toggle "enabled")
      
      (when (string-equal ~lcnt:texClass "article")
	(insert "

\\phantomsection 
\\addcontentsline{toc}{section}{Bibliography} 
"
		)
	)
      
      (when (string-equal ~lcnt:texClass "book")
	(insert "

\\phantomsection 
\\addcontentsline{toc}{chapter}{Bibliography} 
"
		)
	)

      
      (when (equal @bibProvider "biblatex")
	(setq $atLeastOnceWhen t)
	(insert "

\\printbibliography
"
		)
	)

      (when (equal @bibProvider "bibtex")
	(setq $atLeastOnceWhen t)
        ;;; % NOTYET \bibliographystyle{amsalpha} should come here.

	(when (not (equal @bibSrcPaths ""))
	  (insert
	   (format "
\\bibliography{%s}
"
		 @bibSrcPaths
		 ))
	  )
	)
      (bx:eh:assert:atLeastOnceWhen
       $atLeastOnceWhen
       :context "latex"
       :info (format "Unknon bibProvider %s" @bibProvider)
       )
      )
    )
  )
      

(defun org-dblock-write:bx:lcnt:latex:features-appendix-index-glossary (@params)
  (let (
	(@class (or (plist-get @params :class) ""))
	(@langs (or (plist-get @params :langs) ""))
	(@toggle (or (plist-get @params :toggle) "enabled"))
	(@curBuild (or (plist-get @params :curBuild) ""))
	;;;
	)

    ;;; when unspecified, @curBuild is t
    (unless (plist-member @params :curBuild)
      (setq @curBuild t))
    
    (blee:dblock:params:desc
     'latex-mode
     ":class \"book|pres+art\" :langs \"en+fa\" :toggle \"enabled|disabled|hide\" "
     )

    (when (not (equal @toggle "hide"))
      (org-latex-node-insert-note
       :label (format "DBLOCK:")
       :name (format "Features: Appendix, Index, Glossaries --- toggle=%s" @toggle)
       :level 2
       :comment (format "")
       )
      )
    
    (when (equal @toggle "hide")
      (setq @toggle "disabled")
      )

    (when (equal @toggle "enabled")
      (insert "

\\usepackage[toc,page]{appendix}

\\usepackage{imakeidx}
\\makeindex

\\usepackage[toc]{glossaries}    % Should come after hyperref
\\makeglossaries
"
	      )
      )
    ))

(defun org-dblock-write:bx:lcnt:latex:features-bibliography (@params)
  (let (
	(@class (or (plist-get @params :class) ""))
	(@langs (or (plist-get @params :langs) ""))
	(@toggle (or (plist-get @params :toggle) "enabled"))
	(@curBuild (or (plist-get @params :curBuild) ""))
	(@bibProvider (or (plist-get @params :bibProvider) nil))
	(@style (or (plist-get @params :style) "plain"))		
	;;;
	($atLeastOnceWhen nil)
	)

    (when @bibProvider 
      (setq-local ~lcnt:bibProvider @bibProvider))
    (unless  @bibProvider 
      (setq @bibProvider ~lcnt:bibProvider ))
    
    
    (blee:dblock:params:desc
     'latex-mode
     ":class \"book|pres+art\" :langs \"en+fa\" :toggle \"enabled|disabled|hide\" :bibProvider \"biblatex|bibtex\""
     )

    (when (not (equal @toggle "hide"))
      (org-latex-node-insert-note
       :label (format "DBLOCK:")
       :name (format
	      "Features: Bibliography --- toggle=%s bibProvider=%s"
	      @toggle
	      @bibProvider
	      )
       :level 2
       :comment (format "")
       )
      )
    
    (when (equal @toggle "hide")
      (setq @toggle "disabled")
      )

    (when (equal @toggle "enabled")
      (when (equal @bibProvider "biblatex")
	(setq $atLeastOnceWhen t)
	(when (equal @style "plain")
	  (setq @style "numeric")
	  )
	(insert
	 (format "

\\usepackage[style=%s]{biblatex}

%%%% \\addbibresource{/lcnt/outputs/all/plpcUrl.bib}
"
		@style
		))
	)
      (when (equal @bibProvider "bibtex")
	(setq $atLeastOnceWhen t)
	(insert
	 (format "

\\bibliographystyle{%s}
"
		@style
		))
	)

      (when (equal @bibProvider "none")
	(setq $atLeastOnceWhen t)
	(insert
	 (format "

%%%%%% No bibProvider has been selected
"
		))
	)

      (bx:eh:assert:atLeastOnceWhen
       $atLeastOnceWhen
       :context "latex"
       :info (format "Unknon bibProvider %s" @bibProvider)
       )
      )
    )
  )

;;;
;;; (bx:eh:assert:atLeastOnceWhen t :context "latex" :info "I")
;;; (bx:eh:assert:atLeastOnceWhen nil :context "latex" :info "I")
;;;
(defun bx:eh:assert:atLeastOnceWhen (@atLeastOnceWhen &rest @args)
  "General purpose missing when catcher -- NOTYET, move it to the right place"
  (when (not @atLeastOnceWhen)
    (let (
	  (@context (or (plist-get @args :context) ""))
	  (@info (or (plist-get @args :info) ""))
	  ;;;
	  ($atLeastOnceWhen nil)
	  )
      (when (equal @context "latex")
	(setq $atLeastOnceWhen t)
	(insert
	 (format "\n
%%%%%%  %s\n"
		 @info))
	)
      
      (when (equal @context "any")
	(setq $atLeastOnceWhen t)
	(insert
	 (format "\n
atLeastOnceWhen=ANY  %s\n"
		 @info))
	)
      
      (bx:eh:assert:atLeastOnceWhen
       $atLeastOnceWhen
       :context "any"
       :info (format "Unknon context %s" @context)
       )
      )))


(defun org-dblock-write:bx:lcnt:latex:print-glossaries  (@params)
  (let (
	(<class (or (plist-get @params :class) ""))
	(<langs (or (plist-get @params :langs) ""))
	(<toggle (or (plist-get @params :toggle) ""))
	(<curBuild (or (plist-get @params :curBuild) ""))
	;;;
	)
    
    (blee:dblock:params:desc
     'latex-mode
     ":class \"book|pres+art\" :langs \"en+fa\" :toggle \"enabled|disabled|hide\" "
     )

    (when (not (equal <toggle "hide"))
      (org-latex-node-insert-note      
       :label (format "DBLOCK:")
       :name (format
	      "print-glossaries --- toggle=%s"
	      <toggle
	      )
       :level 1
       :comment (format "")
       )
      )
    
    (when (equal <toggle "hide")
      (setq <toggle "disabled")
      )

    (when (equal <toggle "enabled")
      (when (equal <class "book")
	(insert "
\\cleardoublepage\	
"
		)
	)
      (insert "
\\glossarystyle{listgroup}
\\printglossaries\
"
	      )
      )
    ))

(defun org-dblock-write:bx:lcnt:latex:print-index (@params)
  (let (
	(<class (or (plist-get @params :class) ""))
	(<langs (or (plist-get @params :langs) ""))
	(<toggle (or (plist-get @params :toggle) ""))
	(<curBuild (or (plist-get @params :curBuild) ""))
	;;;
	)
    
    (blee:dblock:params:desc
     'latex-mode
     ":class \"book|pres+art\" :langs \"en+fa\" :toggle \"enabled|disabled|hide\" "
     )

    (when (not (equal <toggle "hide"))
      ;;(org-latex-section-insert-dblock-name (format "print-index --- toggle=%s" <toggle))
      (org-latex-node-insert-note      
       :label (format "DBLOCK:")
       :name (format
	      "print-index --- toggle=%s"
	      <toggle
	      )
       :level 1
       :comment (format "")
       )
      )
    
    (when (equal <toggle "hide")
      (setq <toggle "disabled")
      )

    (when (equal <toggle "enabled")
      (when (equal <class "book")
	(insert "
\\cleardoublepage\	
"
		)
	)
      (insert "
\\addcontentsline{toc}{chapter}{Index}
\\printindex
"
	      )
      )
    ))

(defun org-dblock-write:bx:lcnt:latex:orgParentNode:title-page (@params)
  (let (
	(<class (or (plist-get @params :class) ""))
	(<langs (or (plist-get @params :langs) ""))
	(<toggle (or (plist-get @params :toggle) ""))
	(<curBuild (or (plist-get @params :curBuild) ""))
	;;;
	)
    
    (blee:dblock:params:desc
     'latex-mode
     ":class \"book|pres+art\" :langs \"en+fa\" :toggle \"enabled|disabled|hide\" :curBuild \"t|path\""
     )

    (when (not (equal <toggle "hide"))
      (org-latex-node-insert-note
       :label (format "OrgParentNode:")
       :level 1
       :comment (format "Title Page")
       ))
    ))

(defun org-dblock-write:bx:lcnt:latex:note:features-front-matter (@params)
  (let (
	(@class (or (plist-get @params :class) ""))
	(@langs (or (plist-get @params :langs) ""))
	(@toggle (or (plist-get @params :toggle) ""))
	(@curBuild (or (plist-get @params :curBuild) ""))
	;;;
	)
    ;;; when unspecified, @curBuild is t
    (unless (plist-member @params :curBuild)
      (setq @curBuild t))

    
    (blee:dblock:params:desc
     'latex-mode
     ":class \"book|pres+art\" :langs \"en+fa\" :toggle \"enabled|disabled|hide\" :curBuild \"t|path\""
     )

    (when (not (equal @toggle "hide"))
      (org-latex-node-insert-note
       :label (format "OrgParentNode:")
       :name ""
       :level 1
       :comment (format "Features Front-Matter")
       ))
    ))

(defun org-dblock-write:bx:lcnt:latex:note:features-body-matter (@params)
  (let (
	(@class (or (plist-get @params :class) ""))
	(@langs (or (plist-get @params :langs) ""))
	(@toggle (or (plist-get @params :toggle) ""))
	(@curBuild (or (plist-get @params :curBuild) ""))
	;;;
	)
    
    ;; when unspecified, @curBuild is t
    (unless (plist-member @params :curBuild)
      (setq @curBuild t))

    (blee:dblock:params:desc
     'latex-mode
     ":class \"book|pres+art\" :langs \"en+fa\" :toggle \"enabled|disabled|hide\" :curBuild \"t|path\""
     )

    (when (not (equal @toggle "hide"))
      (org-latex-node-insert-note
       :label (format "OrgParentNode:")
       :name ""
       :level 1
       :comment (format "Features Body-Matter")
       ))
    ))


(defun org-dblock-write:bx:lcnt:latex:note:features-back-matter (@params)
  (let (
	(@class (or (plist-get @params :class) ""))
	(@langs (or (plist-get @params :langs) ""))
	(@toggle (or (plist-get @params :toggle) ""))
	(@curBuild (or (plist-get @params :curBuild) ""))
	;;;
	)
    ;; when unspecified, @curBuild is t
    (unless (plist-member @params :curBuild)
      (setq @curBuild t))
    
    (blee:dblock:params:desc
     'latex-mode
     ":class \"book|pres+art\" :langs \"en+fa\" :toggle \"enabled|disabled|hide\" :curBuild \"t|path\""
     )

    (when (not (equal @toggle "hide"))
      (org-latex-node-insert-note
       :label (format "OrgParentNode:")
       :name ""
       :level 1
       :comment (format "Features Back-Matter")
       ))
    ))


(defun org-dblock-write:bx:lcnt:latex:note:feature-late-uncommon-packages (@params)
  (let (
	(@class (or (plist-get @params :class) ""))
	(@langs (or (plist-get @params :langs) ""))
	(@toggle (or (plist-get @params :toggle) ""))
	(@curBuild (or (plist-get @params :curBuild) ""))
	;;;
	)

    ;; when unspecified, @curBuild is t
    (unless (plist-member @params :curBuild)
      (setq @curBuild t))
    
    (blee:dblock:params:desc
     'latex-mode
     ":class \"book|pres+art\" :langs \"en+fa\" :toggle \"enabled|disabled|hide\" :curBuild \"t|path\""
     )

    (when (not (equal @toggle "hide"))
      (org-latex-node-insert-note
       :label (format "Note:")
       :name ""
       :level 1
       :comment (format "Your Late Un-Common Packages")
       ))
    ))


(defun org-dblock-write:bx:lcnt:latex:feature-back-matter (@params)
  (let (
	(<class (or (plist-get @params :class) ""))
	(<langs (or (plist-get @params :langs) ""))
	(<toggle (or (plist-get @params :toggle) ""))
	(<curBuild (or (plist-get @params :curBuild) ""))
	;;;
	)

    (blee:dblock:params:desc
     'latex-mode
     ":class \"book|pres+art\" :langs \"en+fa\" :toggle \"enabled|disabled|hide\" :curBuild \"t|path\""
     )

    (when (not (equal <toggle "hide"))
      (org-latex-section-insert-note-name
       (format "print-index --- toggle=%s" <toggle))
      )
    
    (when (equal <toggle "hide")
      (setq <toggle "disabled")
      )

    (when (equal <toggle "enabled")
      ;;; %\usepackage[backend=biber,style=alphabetic,sorting=ynt]{biblatex}
      
      (insert "
\\usepackage[toc,page]{appendix}

\\usepackage{imakeidx}
\\makeindex

\\usepackage[toc]{glossaries}    % Should come after hyperref
\\makeglossaries

"
	      )
      )
    ))



(defun org-dblock-write:bx:dblock:lcnt:latex:title-insert (@params)
  (bx:lcnt:info:base-read)
  (let (
	(bx:class (or (plist-get @params :class) ""))
	(bx:langs (or (plist-get @params :langs) ""))
	($title (or (plist-get @params :title) ""))	
	(lcnt-shortTitle (get 'bx:lcnt:info:base 'shortTitle))
	(lcnt-mainTitle (get 'bx:lcnt:info:base 'mainTitle))
	(lcnt-subTitle (get 'bx:lcnt:info:base 'subTitle))
	(lcnt-subSubTitle (get 'bx:lcnt:info:base 'subSubTitle))
	)

    (when (equal $title "lcnt")
      (setq $title lcnt-shortTitle)
      )

    (org-latex-section-insert-dblock-name
     (format "TITLE:: *%s* " $title))

    (insert (format "\n
\\title{%s}\n" $title))

    ))


(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *Copyright Choices*
")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex:copyright params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:latex:copyright (params)
  (let ((bx:class (or (plist-get params :class) ""))
	(bx:langs (or (plist-get params :langs) ""))
	(bx:form (or (plist-get params :form) ""))    ;; none, std, or std-en-fa NOTYET
	(bx:years (or (plist-get params :years) ""))    ;; example: "2014-2018"
	(bx:copyright-holders (or (plist-get params :copyright-holders) ""))    ;; example: "Neda Communications, Inc."	
	(lcnt-authorName1 (get 'bx:lcnt:info:base 'authorName1))
	)

    (blee:dblock:params:desc
     'latex-mode
     ":class \"book|pres+art\" :langs \"en+fa\" :toggle \"enabled|disabled|hide\" :form \"none|std\" :years \"\" :copyright-holders nil|\"Name\""
     )

    (if (equal bx:years "")
	(progn
	  (setq bx:years "2018")
	  )
      )

    (if (equal bx:copyright-holders "")
	(progn
	  (setq bx:copyright-holders lcnt-authorName1)
	  )
      )
    
    (if (equal bx:form "none")
	(progn
	  (org-latex-node-insert-note
	   :label (format "DBLOCK:")
	   :name (format
		  "Copyright Settings --- bx-years=None"
		  )
	   :level 2
	   :comment (format "")
	   )
	  (insert "\n% dblock copyright notice says none")
	  )
      (progn 
    
    (bx:lcnt:info:base-read)
    ;;;(insert "%{{{ DBLOCK-copyright\n")

    (org-latex-node-insert-note
     :label (format "DBLOCK:")
     :name (format
	    "Copyright Settings --- bx-years=%s"
	    @bx-years)
     :level 2
     :comment (format "")
     )
    

    (when (or (equal bx:class "art+pres")
	      (equal bx:class "art"))
      (when (or (equal bx:langs "en")
		(equal bx:langs "en+fa"))
	(insert (format "
\\vspace{0.4in}

{\\bf Copyright} \\copyright \\space  {\\bf  %s %s}
" bx:years bx:copyright-holders))

	(insert "\\vspace{0.1in}

Permission is granted to make and distribute complete (not partial)\\\\
verbatim copies of this document provided that the copyright notice\\\\
and this permission notice are preserved on all copies.
")
	)
      (when (equal bx:langs "fa+en")
	(insert (format "
\\vspace{0.4in}
\\begin{latin}
{\\bf Copyright} \\copyright \\space  {\\bf  2011 %s}
\\end{latin}
" bx:copyright-holders))

	(insert "\\vspace{0.1in}

اجازِه چاپ مجدد وجود  دارد تا   هنگامى  که اين  اعلام اجازه روى همه 
کپيها مجود باشد.
")

	(insert "\\vspace{0.1in}
\\begin{latin}
Permission is granted to make and distribute complete (not partial)\\\\
verbatim copies of this document provided that the copyright notice\\\\
and this permission notice are preserved on all copies.
\\end{latin}
")

	)
      )

    (when (or (equal bx:class "pres+art")
	      (equal bx:class "pres"))
      (insert "\n% dblock copyright notice just says verbatim copying permitted\n"))

))
    
    ;;;(insert "%}}} DBLOCK-copyright")
    ))


(defun org-dblock-write:bx:lcnt:latex:copyright (@params)
  (bx:lcnt:info:base-read)
  (let (
	(@class (or (plist-get @params :class) ""))
	(@langs (or (plist-get @params :langs) ""))
	(@toggle (or (plist-get @params :toggle) "enabled"))
	(@curBuild (or (plist-get @params :curBuild) nil))
	(@paperSize (or (plist-get @params :paperSize) nil))
	(@spacing (or (plist-get @params :spacing) nil))		
	(@form (or (plist-get params :form) ""))    ;; std, or std+fa NOTYET
	(@years (or (plist-get params :years) nil))    ;; example: "2014-2018"
	(@copyright-holders (or (plist-get params :copyright-holders) nil))    ;; example: "Neda Communications, Inc."
	(@copyright-holders-url (or (plist-get params :copyright-holders-url) nil))
	(@farsi (or (plist-get params :farsi) nil))
	;;;
	($lcnt-authorName1 (get 'bx:lcnt:info:base 'authorName1))
	;;;
	)
    
    (blee:dblock:params:desc
     'latex-mode
     ":class \"book|pres+art\" :langs \"en+fa\" :toggle \"enabled|disabled|hide\" :form \"none|std\" :years \"\" :copyright-holders nil|\"Name\""
     )

    (when (not @years)
      (setq @years "2019")
      )

    (when (not @copyright-holders)
      (setq @copyright-holders $lcnt-authorName1)
      )

    (when @copyright-holders-url
      (setq @copyright-holders
	    (format "\\href{%s}{%s}"
		    @copyright-holders-url
		    @copyright-holders
		    )
	    )
      )
    
    (when (not (equal @toggle "hide"))
      (org-latex-node-insert-note
       :label (format "DBLOCK:")
       :name (format
	      "Title Page Copyright --- toggle=%s form=%s curBuild=%s paperSize=%s spacing=%s"	      
	      @toggle
	      @form
	      @curBuild
	      @paperSize
	      @spacing
	      )
       :level 2
       :comment (format "")
       )
      )
    
    (when (equal @toggle "hide")
      (setq @toggle "disabled")
      )

    (when (equal @toggle "enabled")

      (when (not @paperSize)
	(when (not @curBuild)
	  (insert
	   "\n%%% ERROR:: Either paperSize or curBuild should be specified."
	   )
	  )
	(when @curBuild
	  (when (bx:lcnt:curBuild:base-read)
	    (setq $curBuild:paperSize  (get 'bx:lcnt:curBuild:base 'paperSize))
	  ;;; NOTYET, verify that $curBuild:paperSize is valid
	    (setq @paperSize $curBuild:paperSize)
	    )
	  
	  (when (not @paperSize)
	    (insert
	     "\n%%% ERROR:: curBuild paperSize not is not valid."
	     )
	    )
	  )
	)

        ;;;
        ;;; $paperSize is available now.
        ;;;
      
      (when @paperSize
	(insert 
	 (format "\n
%s Copyright paperSize=%s\n"
		 "%%%"
		 @paperSize
		 )
	 )
	
	(when @spacing
	  (insert (format "
\\vspace{0.4in}
"
			  )))
	
      

	(when (or (equal @class "art+pres")
		  (equal @class "art"))
	  (when (or (equal @langs "en")
		    (equal @langs "en+fa"))
	    (when (equal @form "std+fa")
	      (when (or
		     (equal @paperSize "8.5x11")
		     (equal @paperSize "a4")
		     (equal @paperSize "6x9")
		     (equal @paperSize "17.5x23.5")
		     )
		(setq $atLeastOnceWhenPaperSize t)

		
	      (insert
	       (format "

\\begin{center}
  \\begin{tabular*}{\\textwidth}{ l p{.7\\textwidth} r }
      \\includegraphics[width=0.1\\textwidth]{figures/GreenCopyleft-120px.png}
    &
      \\vspace{-0.9in}
      \\begin{minipage}[t]{.7\\textwidth}
Within the jurisdiction of legal systems that recognize copyright law:
      
{\\bf Copyright} \\copyright \\space  {\\bf  %s %s}
\\vspace{0.1in}
"
		       @years
		       @copyright-holders
		       )
	       )

	      (insert
	       (format "
Permission is granted to make and distribute complete verbatim copies of this document
provided that the copyright notice and this permission notice are preserved on all copies.
This is a Libre-Halaal poly-existential.
"
		       ))
	      (when @farsi
		(insert
		 (format "
\\begin{faPar}
چاپ کامل مجدد با ذکر ماخذ مجاز است تا هنگامى  که اين  اعلام اجازه محفوظ بماند. 
\\end{faPar}
"
			 ))
		)
	      (insert
	       (format "
     \\end{minipage}
    &
      \\includegraphics[width=0.1\\textwidth]{figures/Anti-copyright-220px.png}
  \\end{tabular*}
\\end{center}
"
		       )
	       )
	      )
	      (when (equal @paperSize "html")
		(setq $atLeastOnceWhenPaperSize t)

		(insert
		 (format "
\\begin{center}
  \\begin{tabular*}{\\textwidth}{ l p{.7\\textwidth} r }
%%BEGIN IMAGE  
    \\includegraphics[width=0.1\\textwidth]{figures/GreenCopyleft-120px.png}  
%%END IMAGE
%%HEVEA\\imageflush
    &
      \\vspace{-0.7in}
      \\begin{minipage}[t]{.7\\textwidth}
Within the jurisdiction of legal systems that recognize copyright law:
      
{\\bf Copyright} \\copyright \\space  {\\bf  %s %s}
\\vspace{0.1in}

Permission is granted to make and distribute complete verbatim copies of this document
provided that the copyright notice and this permission notice are preserved on all copies.
This is a Libre-Halaal poly-existential.
"
		       @years
		       @copyright-holders
		       )
		 )
		(when @farsi
		  (insert
		   (format "
\\begin{faPar}
چاپ کامل مجدد با ذکر ماخذ مجاز است تا هنگامى  که اين  اعلام اجازه محفوظ بماند. 
\\end{faPar}
"
			   ))
		  )
		(insert
		 (format "
     \\end{minipage}
      
    &
%%BEGIN IMAGE      
    \\includegraphics[width=0.1\\textwidth]{figures/Anti-copyright-220px.png}
%%END IMAGE
%%HEVEA\\imageflush
  \\end{tabular*}
\\end{center}
"
			 )
	       
		 )
		)
	      )
	    ;;; Form std comes here
	    )
	  )
	(when (or (equal @class "pres+art")
		  (equal @class "pres"))
	  (insert "\n% dblock copyright notice just says verbatim copying permitted\n"))
        )
      )
    )
  )



(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *Mention LCNT (PLPC-NU)*
")


(defun org-dblock-write:bx:dblock:lcnt:latex:mention-lcnt (params)
  " Produces a full description citation if lcnt-nu. Typical usage:
%%%#+BEGIN: bx:dblock:lcnt:latex:mention-lcnt :class \"art\" :lcnt-nu \"plpc-120038\"

%%%#+END:
"
  (let (
	(in:lcntNu (or (plist-get params :lcnt-nu) ""))
	(in:cite (or (plist-get params :cite) ""))
	(lcntBase)
	)
    (set 'lcntBase
	 (shell-command-to-string 
	  (format "echo -n $( lcnLcntSelect.sh  %s 2> /dev/null | head -1 )" in:lcntNu))
	 )
    
    (bx:lcnt:info:base-read-dir lcntBase)
    
    (let (
	  (lcnt-shortTitle (get 'bx:lcnt:info:base 'shortTitle))
	  (lcnt-mainTitle (get 'bx:lcnt:info:base 'mainTitle))
	  (lcnt-subTitle (get 'bx:lcnt:info:base 'subTitle))
	  (lcnt-subSubTitle (get 'bx:lcnt:info:base 'subSubTitle))
	  (lcnt-lcntNu (get 'bx:lcnt:info:base 'lcntNu))
	  (lcnt-version (get 'bx:lcnt:info:base 'version))
	  (lcnt-url (get 'bx:lcnt:info:base 'url))
	  )


      (insert (format "
\\begin{comment}
***** DBLOCK -- mention-lcnt %s
\\end{comment}

\\begin{quote}
  \\textbf{%s}\\newline"
		      in:lcntNu
		      lcnt-mainTitle
		      ))

      (when (not (string-equal (format "%s" lcnt-subTitle) ""))
	(insert (format "
  \\textbf{%s}\\newline"
			lcnt-subTitle
			)))

      (when (not (string-equal (format "%s" lcnt-subSubTitle) ""))
	(insert (format "
  \\textbf{%s}\\newline"
			lcnt-subSubTitle
			)))

      (insert (format "
  \\href{%s}{%s}
"
		      lcnt-url lcnt-url
		      ))

      (when (not (string-equal (format "%s" in:cite) "disabled"))
	(insert (format "  --- \\cite{%s}\\newline
"
			in:lcntNu
			))
	)

      (insert "\\end{quote}")
      
      )))


(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *Title Page And Title Settings*
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:lcnt:latex:titleSet params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:lcnt:latex:titleSet (params)
  (let (
	(bx:class (or (plist-get params :class) ""))
	(bx:langs (or (plist-get params :langs) ""))
	($processors (or (plist-get params :processors) ""))	
	(lcnt-shortTitle nil)
	)
    (bx:lcnt:info:base-read)

    (setq lcnt-shortTitle (get 'bx:lcnt:info:base 'shortTitle))    

    (org-latex-section-insert-dblock-name "LaTeX titleSet")

    (when (equal $processors "html")
      (insert (format "

\\begin{htmlonly}
  \\title{%s}
\\end{htmlonly}
"
		      lcnt-shortTitle))
      )
    
    (when (not (equal $processors "html"))
      (insert (format "

\\title{%s}
"
		      lcnt-shortTitle))
      )
    ))

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex:title-page params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:latex:title-page (params)
  (let ((bx:class (or (plist-get params :class) ""))
	(bx:langs (or (plist-get params :langs) ""))
	(coverPage (or (plist-get params :coverPage) "UnSpecified"))
	(bx:form (or (plist-get params :form) ""))		
	(lcnt-shortTitle (get 'bx:lcnt:info:base 'shortTitle))
	(lcnt-mainTitle (get 'bx:lcnt:info:base 'mainTitle))
	(lcnt-subTitle (get 'bx:lcnt:info:base 'subTitle))
	(lcnt-subSubTitle (get 'bx:lcnt:info:base 'subSubTitle))
	(lcnt-date (get 'bx:lcnt:info:base 'date))
	(lcnt-type (get 'bx:lcnt:info:base 'type))
	(lcnt-lcntNu (get 'bx:lcnt:info:base 'lcntNu))
	(lcnt-version (get 'bx:lcnt:info:base 'version))
	(lcnt-url (get 'bx:lcnt:info:base 'url))
	(lcnt-author1 (get 'bx:lcnt:info:base 'author1))
	(lcnt-authorName1 (get 'bx:lcnt:info:base 'authorName1))
	(lcnt-authorUrl1 (get 'bx:lcnt:info:base 'authorUrl1))
	(lcnt-presArtSrcFile (get 'bx:lcnt:info:base 'presArtSrcFile))	
	(bufferFileName (file-name-nondirectory buffer-file-name))	
	)
    (bx:lcnt:info:base-read)

    ;;;(insert "%{{{ DBLOCK-front-begin\n")
    (insert "%%%% Args:  :form \"priv|std\" :coverPage \"blank|std\"\n")

    (org-latex-section-insert-dblock-name "title-page")

    (when (or (equal bx:class "art+pres")
	      (equal bx:class "art"))
      (insert (format "
\\thispagestyle{empty}

%%%%\\vfill

\\title{%s}\n" lcnt-shortTitle))

      (insert (format "
\\begin{center}
  {\\huge {\\bf %s\\\\
"  lcnt-mainTitle))

      (if (not (string-equal lcnt-subTitle ""))
	  (insert (format "\
\\vspace{0.3in}
%s\\\\\n" lcnt-subTitle)))

      (if (not (string-equal lcnt-subSubTitle ""))
	  (progn
	    (insert "\\vspace{0.2in}\n")	    
	    (insert (format "%s\\\\\n" lcnt-subSubTitle))))

      (insert "\
}}
\\end{center}

\\vspace{0.2in}
")

      (if (string-equal
	   bufferFileName
	   lcnt-presArtSrcFile)
    
	  (insert "
\\begin{center}
  {\\Large {\\bf Article Format Of Presentation\\\\
\\vspace{0.2in}
}}
\\end{center}
"))

     (insert "
\\vspace{0.7in}
")
      

     (when (or (equal bx:langs "en")
	       (equal bx:langs "en+fa"))
       (insert "\\begin{center}\n")
       (insert "{\\large Document \\#")
       (insert (format "%s-%s\\\\\n" lcnt-type lcnt-lcntNu))
       (insert (format "Version %s\\\\\n"  lcnt-version))
       (insert (format "%s}\n" lcnt-date))
       (insert "\\end{center}")

       (insert "
\\vspace{0.05in}")

       (when (not (equal bx:form "priv"))
	 (insert "

\\begin{center}
{\\large This Document is Available on-line at:\\\\
")

	 (insert (format "\\href{%s}{%s}}\n" lcnt-url lcnt-url))

	 (insert "\\end{center}
")
	 )

       (insert "
\\vspace{0.3in}

\\begin{center}
")

   (insert (format "{\\large {\\bf %s}\\\\
  Email: \\href{%s}{%s}\\\\
}" lcnt-authorName1 lcnt-authorUrl1 lcnt-authorUrl1))

   (insert "\\end{center}

\\vspace{0.1in}

\\bibliographystyle{plain}
")
   )
      (when (equal bx:langs "fa+en")
	(insert "\\begin{center}\n")
	(insert "{\\large مقاله شماره: ")
	(insert (format "%s-%s\\\\\n" lcnt-type lcnt-lcntNu))
	(insert (format "تاريخ: %s}\n" lcnt-date))
	(insert "\\end{center}")

	(insert "
\\vspace{0.05in}

\\begin{center}
{\\large مقاله و اسلايد روى وب در :}
")

	(insert "\\begin{latin}\n")
	(insert (format "\\href{%s}{%s}\n" lcnt-url lcnt-url))
	(insert "\\end{latin}\n")

	(insert "\\end{center}

\\vspace{0.3in}

\\begin{center}
")

   (insert (format "{\\large {\\bf %s}\\\\
  تماس: \\lr{\\href{%s}{%s}}\\\\
}" lcnt-authorName1 lcnt-authorUrl1 lcnt-authorUrl1))

   (insert "\\end{center}

\\vspace{0.1in}

\\bibliographystyle{plain}
")

	)
      )  

    (when (or (equal bx:class "pres+art")
	      (equal bx:class "pres"))
      (insert "

\\mode<all>  % Important -- Must Be Here\n")

      (insert (format "
\\begin{latexonly}
"))

;; \\title[%s]
      ;; {%s}\n" lcnt-shortTitle lcnt-mainTitle)
      )

;;       (if (not (string-equal lcnt-subTitle ""))
;; 	  (insert (format "
;; \\subtitle[%s]
;; {%s}\n" lcnt-subTitle lcnt-subTitle)))

;;       ;;;(if (not (string-equal lcnt-subSubTitle ""))
;; 	;;;  (insert (format "%s\\\\\n" lcnt-subSubTitle)))

;;       (insert (format "
;; \\author[%s] 
;; {%s\\\\
;; Email: \\href{%s}{%s}\\\\
;; }
;; " lcnt-authorName1 lcnt-authorName1 lcnt-authorUrl1 lcnt-authorUrl1))

;;       (insert (format "
;; \\institute[%s-%s] 
;; {\\href{%s}{%s}}
;; "   lcnt-type lcnt-lcntNu lcnt-url lcnt-url))

;;       (insert (format "
;; \\date[%s]
;; {%s}
;; " lcnt-date lcnt-date))
;; ;;;{%s\\\\Varbatim Copying Permitted}      

;;       (insert (format "
;; \\subject{%s}
;; " lcnt-shortTitle))

      (when (string-equal coverPage "blank")
	(insert "
% Blank Cover Page
\\bgroup
\\setbeamercolor{background canvas}{bg=black}
\\begin{frame}[plain]{}
\\end{frame}
\\egroup
"))

      (when (not (string-equal coverPage "blank"))
	(insert "
% No Blank Cover Page -- Select dblock :coverPage blank if desired
"))
      
      (insert "

  \\begin{frame}[label=titlePage]
    \\titlepage
    \\frameaudio{\"audio/titlePage.mp3\"}
%BxPy: impressiveFrameParSet('titlePage', 'always', 'True')
%BxPy: impressiveFrameParSet('titlePage', 'transition', 'UnSpecified')
%BxPy: impressiveFrameParSet('titlePage', 'onLeave', 'UnSpecified')
  \\end{frame}
\\end{latexonly}

\\begin{htmlonly}
  \\begin{frame}[label=titlePage]
  \\frameaudio{\"audio/titlePage.mp3\"}
")
      (insert (format "
  \\frametitle{%s}
"  lcnt-mainTitle))

      (if (not (string-equal lcnt-subTitle ""))
	  (insert (format "%s\\\\\n" lcnt-subTitle)))

      (if (not (string-equal lcnt-subSubTitle ""))
	  (insert (format "%s\\\\\n" lcnt-subSubTitle)))


      (when (or (equal bx:langs "en")
		(equal bx:langs "en+fa"))
    (insert "\\begin{center}\n")
    (insert "{\\large Document \\#")
    (insert (format "%s-%s\\\\\n" lcnt-type lcnt-lcntNu))
    (insert (format "Version %s\\\\\n"  lcnt-version))
    (insert (format "%s}\n" lcnt-date))
    (insert "\\end{center}")

   (insert "
\\vspace{0.05in}

\\begin{center}
{\\large This Document is Available on-line at:\\\\
")

   (insert (format "\\href{%s}{%s}}\n" lcnt-url lcnt-url))

   (insert "\\end{center}

\\begin{center}
")

   (insert (format "{\\large {\\bf %s}\\\\
  Email: \\href{%s}{%s}\\\\
}" lcnt-authorName1 lcnt-authorUrl1 lcnt-authorUrl1))

   (insert "\\end{center}")

   (insert "
  \\end{frame}
\\end{htmlonly}

")
      )

    ;;;(insert "%}}} DBLOCK-front-begin")
      )
    )
  



(defun org-dblock-write:bx:lcnt:latex:title-page-titles-OBSOLETED (@params)
  "Inserts Titles (mainTitle, subTitle, subSubStitle) part of the title page.
Font size and spacing can be based on paper size.
"
  (bx:lcnt:info:base-read)
  
  (let ((@class (or (plist-get @params :class) ""))
	(@langs (or (plist-get @params :langs) ""))
	(@curBuild (or (plist-get @params :curBuild) nil))
	(@style (or (plist-get @params :style) nil))
	(@paperSize (or (plist-get @params :paperSize) nil))
	(@spacing (or (plist-get @params :spacing) nil))	
	;;;
	($curBuild:paperSize nil)
	;;;
	($atLeastOnceWhen nil)
	;;;
	(lcnt-shortTitle (get 'bx:lcnt:info:base 'shortTitle))
	(lcnt-mainTitle (get 'bx:lcnt:info:base 'mainTitle))
	(lcnt-subTitle (get 'bx:lcnt:info:base 'subTitle))
	(lcnt-subSubTitle (get 'bx:lcnt:info:base 'subSubTitle))
	(lcnt-date (get 'bx:lcnt:info:base 'date))
	(lcnt-type (get 'bx:lcnt:info:base 'type))
	(lcnt-lcntNu (get 'bx:lcnt:info:base 'lcntNu))
	(lcnt-version (get 'bx:lcnt:info:base 'version))
	(lcnt-url (get 'bx:lcnt:info:base 'url))
	(lcnt-author1 (get 'bx:lcnt:info:base 'author1))
	(lcnt-authorName1 (get 'bx:lcnt:info:base 'authorName1))
	(lcnt-authorUrl1 (get 'bx:lcnt:info:base 'authorUrl1))
	(lcnt-presArtSrcFile (get 'bx:lcnt:info:base 'presArtSrcFile))
	;;;
	($bufferFileName (file-name-nondirectory buffer-file-name))
	($hugeString "Huge")
	($mainTitleSize nil)
	($subTitleSize nil)
	($subSubTitleSize nil)	
	)

    (blee:dblock:params:desc
     'latex-mode
     ":class \"book|pres+art\" :langs \"en+fa\" :curBuild nil|t :paperSize \"8.5x11|6x9\" :style \"HUGE|Huge|huge\" :spacing nil|t"
     )

    (org-latex-node-insert-note
     :label "DBLOCK:"
     :name (format
	    "Title Page Titles --- curBuild=%s paperSize=%s style=%s spacing=%s"
	    @curBuild
	    @paperSize
	    @style
	    @spacing
	    )
     :level 2
     :comment (format "")
     )

    (when (not @paperSize)
      (when (not @curBuild)
	(insert
	 "\n%%% ERROR:: Either paperSize or curBuild should be specified."
	 )
	)
      (when @curBuild
	(when (bx:lcnt:curBuild:base-read)
	  (setq $curBuild:paperSize  (get 'bx:lcnt:curBuild:base 'paperSize))
	  ;;; NOTYET, verify that $curBuild:paperSize is valid
	  (setq @paperSize $curBuild:paperSize)
	  )
     
	(when (not @paperSize)
	  (insert
	   "\n%%% ERROR:: curBuild:paperSize is not valid -- Likely curBuild is missing."
	   )
	  )
	)
      )

    ;;;
    ;;; $paperSize is available now.
    ;;;

    (when @style
      (setq $hugeString @style)
      )
    
    (when @paperSize
      (insert 
       (format "\n
%s Titles paperSize=%s\n"
	       "%%%"
	       @paperSize
	       )
       )
      (insert
       (format "

\\thispagestyle{empty}

\\title{%s}\n"
	       lcnt-shortTitle)
       )

      (when (or (equal @paperSize "8.5x11")
		(equal @paperSize "a4")
		)
	(setq $atLeastOnceWhen t)
	(when (or (equal @class "art+pres")
		  (equal @class "art")
		  )
	  (insert
	   (format "
\\begin{center}
{\\%s {\\bf %s}}\\\\
"
		   $hugeString
		   lcnt-mainTitle
		   )
	   )
	  
	  (when (not (string-equal lcnt-subTitle ""))
	    (insert
	     (format "\
\\vspace{0.2in}
{\\huge {\\bf %s}}\\\\\n"
		     lcnt-subTitle
		     )
	     )
	    )

	  (when (not (string-equal lcnt-subSubTitle ""))
	    (insert
	     (format "
\\vspace{0.2in}
{\\huge {\\bf %s}}\\\\\n"
		     lcnt-subSubTitle
		     )
	     )
	    )
	  (insert "\

\\end{center}\n"
		  )
	  )
	)
      
      (when (or (equal @paperSize "6x9")
		(equal @paperSize "17.5x23.5")
		)
	(setq $atLeastOnceWhen t)
	(when (or (equal @class "art+pres")
		  (equal @class "art")
		  )

	  (when (equal $hugeString "HUGE")
	    (setq $hugeString "Huge")
	    )
	  
	  (insert
	   (format "
\\begin{center}
{\\%s {\\bf %s}}\\\\
"
		   $hugeString
		   lcnt-mainTitle
		   )
	   )
	  
	  (when (not (string-equal lcnt-subTitle ""))
	    (insert
	     (format "\
\\vspace{0.3in}
{\\huge {\\bf %s}}\\\\\n"
		     lcnt-subTitle
		     )
	     )
	    )

	  (when (not (string-equal lcnt-subSubTitle ""))
	    (insert
	     (format "
\\vspace{0.2in}
{\\huge {\\bf %s}}\\\\\n"
		     lcnt-subSubTitle
		     )
	     )
	    )
	  (insert "\

\\end{center}\n"
		  )
	  )
	)
      (bx:eh:assert:atLeastOnceWhen
       $atLeastOnceWhen
       :context "latex"
       :info (format "Unknown Title  %s\n"
		     @paperSize)
       )
      
      (when (string-equal $bufferFileName lcnt-presArtSrcFile)
	(insert "
\\begin{center}
  {\\Large {\\bf Article Format Of Presentation\\\\
\\vspace{0.2in}
}}
\\end{center}
"
		)
	)
      (when @spacing
	(insert "\n
\\vspace{0.35in}\n"
		)
	)
      )
    )
  )
    


(defun org-dblock-write:bx:lcnt:latex:title-page-titles (@params)
  "Inserts Titles (mainTitle, subTitle, subSubStitle) part of the title page.
Font size and spacing can be based on paper size.
"
  (bx:lcnt:info:base-read)
  
  (let ((@class (or (plist-get @params :class) ""))
	(@langs (or (plist-get @params :langs) ""))
	(@toggle (or (plist-get @params :toggle) "enabled"))	
	(@curBuild (or (plist-get @params :curBuild) nil))
	(@style (or (plist-get @params :style) nil))
	(@paperSize (or (plist-get @params :paperSize) nil))
	(@spacing (or (plist-get @params :spacing) nil))	
	;;;
	($curBuild:paperSize nil)
	;;;
	($atLeastOnceWhenPaperSize nil)
	($atLeastOnceWhenStyle nil)	
	;;;
	(lcnt-shortTitle (get 'bx:lcnt:info:base 'shortTitle))
	(lcnt-mainTitle (get 'bx:lcnt:info:base 'mainTitle))
	(lcnt-subTitle (get 'bx:lcnt:info:base 'subTitle))
	(lcnt-subSubTitle (get 'bx:lcnt:info:base 'subSubTitle))
	(lcnt-presArtSrcFile (get 'bx:lcnt:info:base 'presArtSrcFile))
	;;;
	($bufferFileName (file-name-nondirectory buffer-file-name))
	($hugeString "Huge")
	($mainTitleSize nil)
	($belowMainTitleSpace nil)	
	($subTitleSize nil)
	($subSubTitleSize nil)	
	)

    ;;; when unspecified, @curBuild is t
    (unless (plist-member @params :curBuild)
      (setq @curBuild t))
    
    (blee:dblock:params:desc
     'latex-mode
     ":class \"book|pres+art\" :langs \"en+fa\" :curBuild nil|t :paperSize \"8.5x11|6x9\" :style \"HUGE|Huge|huge\" :spacing nil|t"
     )

    (org-latex-node-insert-note
     :label "DBLOCK:"
     :name (format
	    "Title Page Titles --- curBuild=%s paperSize=%s style=%s spacing=%s"
	    @curBuild
	    @paperSize
	    @style
	    @spacing
	    )
     :level 2
     :comment (format "")
     )

    
    (when (equal @toggle "hide")  ;;; else
      (setq @toggle "disabled")
      )
   
    (when (equal @toggle "enabled")
    

    (when (not @paperSize)
      (when (not @curBuild)
	(insert
	 "\n%%% ERROR:: Either paperSize or curBuild should be specified."
	 )
	)
      (when @curBuild
	(when (bx:lcnt:curBuild:base-read)
	  (setq $curBuild:paperSize  (get 'bx:lcnt:curBuild:base 'paperSize))
	  ;;; NOTYET, verify that $curBuild:paperSize is valid
	  (setq @paperSize $curBuild:paperSize)
	  )
     
	(when (not @paperSize)
	  (insert
	   "\n%%% ERROR:: curBuild:paperSize is not valid -- Likely curBuild is missing."
	   )
	  )
	)
      )

    ;;;
    ;;; $paperSize is available now.
    ;;;

    
    (when @paperSize
      (insert 
       (format "\n
%s Titles paperSize=%s
"	       
	       "%%%"
	       @paperSize
	       )
       )
      (insert
       (format "

\\title{%s}\n"
	       lcnt-shortTitle)
       )

    (when @style
      (setq $hugeString @style)
      )

      
      (when (or (equal @paperSize "8.5x11")
		(equal @paperSize "a4")
		)
	(setq $atLeastOnceWhenPaperSize t)

	(setq $belowMainTitleSpace "0.5in")
	
	(when (equal @style "HUGE")
	  (setq $atLeastOnceWhenStyle t)

	  (setq $mainTitleSize "HUGE")
	  (setq $subTitleSize "huge")
	  (setq $subSubTitleSize "huge")
	  )

	(when (equal @style "Huge")
	  (setq $atLeastOnceWhenStyle t)

	  (setq $mainTitleSize "Huge")
	  (setq $subTitleSize "huge")
	  (setq $subSubTitleSize "LARGE")
	  )
	(bx:eh:assert:atLeastOnceWhen
	 $atLeastOnceWhenStyle
	 :context "latex"
	 :info (format "Unknown Style  %s\n"
		       @style)
	 )
	)
      
      (when (or (equal @paperSize "6x9")
		(equal @paperSize "17.5x23.5")
		)
	(setq $atLeastOnceWhenPaperSize t)

	(setq $belowMainTitleSpace "0.2in")	
	
	(when (equal @style "HUGE")
	  (setq $atLeastOnceWhenStyle t)

	  (setq $mainTitleSize "Huge")
	  (setq $subTitleSize "LARGE")
	  (setq $subSubTitleSize "LARGE")
	  )

	(when (equal @style "Huge")
	  (setq $atLeastOnceWhenStyle t)

	  (setq $mainTitleSize "huge")
	  (setq $subTitleSize "Large")
	  (setq $subSubTitleSize "Large")
	  )
	(bx:eh:assert:atLeastOnceWhen
	 $atLeastOnceWhenStyle
	 :context "latex"
	 :info (format "Unknown Style  %s\n"
		       @style)
	 )
	)

      (when (equal @paperSize "html")
	(setq $atLeastOnceWhenPaperSize t)

	(setq $belowMainTitleSpace "0.2in")	
	
	(when (equal @style "HUGE")
	  (setq $atLeastOnceWhenStyle t)

	  (setq $mainTitleSize "Huge")
	  (setq $subTitleSize "LARGE")
	  (setq $subSubTitleSize "LARGE")
	  )

	(when (equal @style "Huge")
	  (setq $atLeastOnceWhenStyle t)

	  (setq $mainTitleSize "huge")
	  (setq $subTitleSize "Large")
	  (setq $subSubTitleSize "Large")
	  )
	
	(bx:eh:assert:atLeastOnceWhen
	 $atLeastOnceWhenStyle
	 :context "latex"
	 :info (format "Unknown Style  %s\n"
		       @style)
	 )
	)

      (bx:eh:assert:atLeastOnceWhen
       $atLeastOnceWhenPaperSize
       :context "latex"
       :info (format "Unknown PaperSize  %s\n"
		     @paperSize)
       )

      (when (not (equal @paperSize "html"))
	(when $mainTitleSize
	  (when (or (equal @class "art+pres")
		    (equal @class "art")
		    )
	    (insert
	     (format "
\\thispagestyle{empty}

\\begin{center}
{\\%s {\\bf %s}}\\\\
"
		     $mainTitleSize
		     lcnt-mainTitle
		     )
	     )
	  
	    (when (not (string-equal lcnt-subTitle ""))
	      (insert
	       (format "\
\\vspace{%s}
{\\%s {\\bf %s}}\\\\\n"
		       $belowMainTitleSpace		     
		       $subTitleSize
		       lcnt-subTitle
		       )
	       )
	      )

	    (when (not (string-equal lcnt-subSubTitle ""))
	      (insert
	       (format "
\\vspace{0.2in}
{\\%s {\\bf %s}}\\\\\n"
		       $subSubTitleSize		     
		       lcnt-subSubTitle
		       )
	       )
	      )
	    (insert "\

\\end{center}\n"
		    )
	    )
	  )
	
	(when (string-equal $bufferFileName lcnt-presArtSrcFile)
	  (insert "
\\begin{center}
  {\\Large {\\bf Article Format Of Presentation\\\\
\\vspace{0.2in}
}}
\\end{center}
"
		  )
	  )
	(when @spacing
	  (insert "\n
\\vspace{0.35in}\n"
		  )
	  )
	)

      (when (equal @paperSize "html")      
	(insert
	   (format "

\\begin{center}
{\\%s {\\bf %s}}\\\\
\\bigskip
"
		   "huge"
		   lcnt-mainTitle
		   )
	   )
	  
	(when (not (string-equal lcnt-subTitle ""))
	  (insert
	   (format "\
\\vspace{%s}
{\\%s {\\bf %s}}\\\\\n"
		   $belowMainTitleSpace		     
		   "Large"
		   lcnt-subTitle
		   )
	   )
	  )

	(when (not (string-equal lcnt-subSubTitle ""))
	  (insert
	   (format "
\\vspace{0.2in}
{\\%s {\\bf %s}}\\\\\n"
		   "Large"
		   lcnt-subSubTitle
		   )
	   )
	  )
	(insert "\

\\end{center}
"
		)
	)
      ))))


    

(defun org-dblock-write:bx:lcnt:latex:title-page-authors (@params)
  "Inserts Titles part of the title page.
"
  (let ((@class (or (plist-get @params :class) ""))
	(@langs (or (plist-get @params :langs) ""))
	(@toggle (or (plist-get @params :toggle) "enabled"))
	(@curBuild (or (plist-get @params :curBuild) nil))			
	(@paperSize (or (plist-get @params :paperSize) nil))
	(@spacing (or (plist-get @params :spacing) nil))	
	;;;
	($curBuild:paperSize nil)
	;;;
	($atLeastOnceWhen nil)
	;;;
	(lcnt-authorName1)
	(lcnt-authorUrl1)
	(lcnt-presArtSrcFile)
	;;;
	($bufferFileName (file-name-nondirectory buffer-file-name))	
	)

    ;;; when unspecified, @curBuild is t
    (unless (plist-member @params :curBuild)
      (setq @curBuild t))

    (bx:lcnt:info:base-read)

    (setq lcnt-author1 (get 'bx:lcnt:info:base 'author1))
    (setq lcnt-authorName1 (get 'bx:lcnt:info:base 'authorName1))
    (setq lcnt-authorUrl1 (get 'bx:lcnt:info:base 'authorUrl1))
    
    (blee:dblock:params:desc
     'latex-mode
     ":class \"pres+art\" :langs \"en+fa\" :curBuild nil|t :paperSize \"8.5x11|6x9\" :spacing nil|t"     
     )

    (org-latex-node-insert-note
     :label (format "DBLOCK:")
     :name (format
	    "Title Page Authors --- curBuild=%s paperSize=%s spacing=%s"
	    @curBuild
	    @paperSize
	    @spacing
	    )
     :level 2
     :comment (format "")
     )

    (when (equal @toggle "hide")  ;;; else
      (setq @toggle "disabled")
      )
   
    (when (equal @toggle "enabled")
    
    (when (not @paperSize)
      (when (not @curBuild)
	(insert
	 "\n%%% ERROR:: Either paperSize or curBuild should be specified."
	 )
	)
      (when @curBuild
	(when (bx:lcnt:curBuild:base-read)
	  (setq $curBuild:paperSize  (get 'bx:lcnt:curBuild:base 'paperSize))
	  ;;; NOTYET, verify that $curBuild:paperSize is valid
	  (setq @paperSize $curBuild:paperSize)
	  )
     
	(when (not @paperSize)
	  (insert
	   "\n%%% ERROR:: curBuild paperSize not is not valid."
	   )
	  )
	)
      )

    ;;;
    ;;; $paperSize is available now.
    ;;;


    
    (when @paperSize
      (insert 
       (format "\n
%s Authors paperSize=%s
"	       
	       "%%%"
	       @paperSize
	       )
       )

      (when (or (equal @paperSize "8.5x11")
		(equal @paperSize "a4")
		)
	(setq $atLeastOnceWhen t)
	(when (or (equal @class "art+pres")
		  (equal @class "art")
		  )
	  (insert
	   (format "
\\begin{center}
{\\LARGE {\\bf %s}}\\\\
\\vspace{0.15in}
{\\Large  Email: \\href{%s}{%s}}\\\\
\\end{center}
"
		     lcnt-authorName1
		     lcnt-authorUrl1
		     lcnt-authorUrl1
		     )
	    )
	  )
	)
      
      (when (or (equal @paperSize "6x9")
		(equal @paperSize "17.5x23.5")
		)
	(setq $atLeastOnceWhen t)
	(when (or (equal @class "art+pres")
		  (equal @class "art")
		  )
	  (insert
	   (format "
\\begin{center}
{\\Large {\\bf %s}}\\\\
\\vspace{0.1in}
{\\bf  Email: \\href{%s}{%s}}\\\\
\\end{center}
"
		     lcnt-authorName1
		     lcnt-authorUrl1
		     lcnt-authorUrl1
		     )
	    )
	  )
	)
      (when (equal @paperSize "html")
	(setq $atLeastOnceWhen t)

	(insert
	 (format "
\\begin{htmlonly}
\\begin{center}
{\\Large {\\bf %s}}\\\\
{\\bf  Email: \\href{%s}{%s}}\\\\
\\end{center}
\\bigskip
\\end{htmlonly}
"
		 lcnt-authorName1
		 lcnt-authorUrl1
		 lcnt-authorUrl1
		 )
	 )
	)
	
      (bx:eh:assert:atLeastOnceWhen
       $atLeastOnceWhen
       :context "latex"
       :info (format "Unknown PaperSize %s\n"
		     @paperSize)
       )
      (when @spacing
	(insert "\n
\\vspace{0.35in}\n"
		)
	)
      )
    ))
  )

(defun org-dblock-write:bx:lcnt:latex:title-page-lcnt-nu (@params)
  "Inserts Titles part of the title page.
"
  (bx:lcnt:info:base-read)
  (let ((@class (or (plist-get @params :class) ""))
	(@langs (or (plist-get @params :langs) ""))
	(@toggle (or (plist-get @params :toggle) "enabled"))	
	(@curBuild (or (plist-get @params :curBuild) nil))			
	(@paperSize (or (plist-get @params :paperSize) nil))
	(@spacing (or (plist-get @params :spacing) nil))	
	;;;
	($curBuild:paperSize nil)
	;;;
	($atLeastOnceWhen nil)
	;;;
	(lcnt-date (get 'bx:lcnt:info:base 'date))
	(lcnt-type (get 'bx:lcnt:info:base 'type))
	(lcnt-lcntNu (get 'bx:lcnt:info:base 'lcntNu))
	(lcnt-version (get 'bx:lcnt:info:base 'version))
	(lcnt-presArtSrcFile (get 'bx:lcnt:info:base 'presArtSrcFile))
	;;;
	($bufferFileName (file-name-nondirectory buffer-file-name))	
	)

    ;;; when unspecified, @curBuild is t
    (unless (plist-member @params :curBuild)
      (setq @curBuild t))
    
    (blee:dblock:params:desc
     'latex-mode
     ":class \"pres+art\" :langs \"en+fa\" :curBuild nil|t :paperSize \"8.5x11|6x9\" :spacing nil|t"
     )

    (org-latex-node-insert-note
     :label "DBLOCK:"
     :name (format
	    "Title Page LCNT-NU --- curBuild=%s paperSize=%s spacing=%s"
	    @curBuild
	    @paperSize
	    @spacing
	    )
     :level 2
     :comment (format "")
     )

    (when (equal @toggle "hide")  ;;; else
      (setq @toggle "disabled")
      )
   
    (when (equal @toggle "enabled")

    
    (when (or (equal @class "art+pres")
	      (equal @class "art"))

      (when (or (equal @langs "en")
		(equal @langs "en+fa"))
	
	(insert
	 (format "

\\begin{center}
	
{\\LARGE {\\bf %s-%s}}\\\\
\\vspace{0.20in}
{\\Large %s}\\\\
\\vspace{0.05in}
{\\Large Version %s}\\\\

\\end{center}
"
		 lcnt-type
		 lcnt-lcntNu
		 lcnt-date
		 lcnt-version
		 )
	 )
	)

      (when @spacing
	(insert "
\\vspace{0.05in}
"
		)
	)
	

      (when (equal @langs "fa+en")
	
	(insert "\\begin{center}\n")
	(insert "{\\large مقاله شماره: ")
	(insert (format "%s-%s\\\\\n" lcnt-type lcnt-lcntNu))
	(insert (format "تاريخ: %s}\n" lcnt-date))
	(insert "\\end{center}")
	)
      )
    ))
  )



(defun org-dblock-write:bx:lcnt:latex:dblock-params (@params)
  "In addition to lcnt:info, common dblock parameters are specified once at the top to be used by subsequent dblocks.

Each of these dblock-params match a buffer-local variables.
"
  (bx:lcnt:info:base-read)
  
  (let (
	(@curBuild (or (plist-get @params :curBuild) nil))	
	(@bibProvider (or (plist-get @params :bibProvider) nil))
	(@paperSize (or (plist-get @params :paperSize) nil))	
	;;;
	($bufferFileName (file-name-nondirectory buffer-file-name))	
	)

    ;;; when unspecified, @curBuild is t
    (unless (plist-member @params :curBuild)
      (setq @curBuild t))

    (blee:dblock:params:desc
     'latex-mode
     ":class \"pres+art\" :langs \"en+fa\" :toggle \"enabled|disabled|hide\" :curBuild nil|t :paperSize \"8.5x11|6x9\" :spacing nil|t :curBuild nil|t :paperSize \"8.5x11|6x9\" :when \"main|mailing\""
     )

    (org-latex-node-insert-note
     :label "DBLOCK:"
     :name (format
	    "Buffer Local dblock params --- curBuild=%s bibProvider=%s paperSize=%s"
	    @curBuild
	    @bibProvider
	    @paperSize
	    )
     :level 1
     :comment (format "")
     )

    (when @bibProvider
      (setq-local ~lcnt:bibProvider @bibProvider))
    (unless @bibProvider
      (setq-local ~lcnt:bibProvider "bibtex"))
	  
    (when @paperSize
      (setq-local ~lcnt:paperSize @paperSize))
    (unless @paperSize
      (unless @curBuild    
	(setq-local ~lcnt:paperSize "8.5x11"))
      (when @curBuild
	(when (bx:lcnt:curBuild:base-read)
	  (setq-local ~lcnt:paperSize (get 'bx:lcnt:curBuild:base 'paperSize)))
	(unless ~lcnt:paperSize
	  (insert "\n%%% ERROR:: curBuild paperSize not is not valid."))))
    
    (insert
     (format "
%%%%%% bibProvider = %s
%%%%%% paperSize = %s
"
	     ~lcnt:bibProvider
	     ~lcnt:paperSize
	     ))
    ))


(defun org-dblock-write:bx:lcnt:latex:when-conditionals (@params)
  "Deterinable common when include and excludes.
"
  (bx:lcnt:info:base-read)
  (let ((@class (or (plist-get @params :class) ""))
	(@langs (or (plist-get @params :langs) ""))
	(@toggle (or (plist-get @params :toggle) "enabled"))
	(@curBuild (or (plist-get @params :curBuild) nil))			
	(@paperSize (or (plist-get @params :paperSize) nil))
	(@when (or (plist-get @params :when) nil))	
	;;;
	($curBuild:paperSize nil)
	;;;
	($atLeastOnceWhenConditionals nil)
	;;;
	(lcnt-lcntNu (get 'bx:lcnt:info:base 'lcntNu))
	(lcnt-type (get 'bx:lcnt:info:base 'type))
	(lcnt-presArtSrcFile (get 'bx:lcnt:info:base 'presArtSrcFile))
	;;;
	($bufferFileName (file-name-nondirectory buffer-file-name))	
	)

    ;;; when unspecified, @curBuild is t
    (unless (plist-member @params :curBuild)
      (setq @curBuild t))

    (blee:dblock:params:desc
     'latex-mode
     ":class \"pres+art\" :langs \"en+fa\" :toggle \"enabled|disabled|hide\" :curBuild nil|t :paperSize \"8.5x11|6x9\" :spacing nil|t :curBuild nil|t :paperSize \"8.5x11|6x9\" :when \"main|mailing\""
     )

    (org-latex-node-insert-note
     :label "DBLOCK:"
     :name (format
	    "When Conditionals (Includes and Excludes) --- when=%s curBuild=%s paperSize=%s"
	    @when
	    @curBuild
	    @paperSize
	    )
     :level 1
     :comment (format "")
     )
    
    (when (equal @toggle "hide")  ;;; else
      (setq @toggle "disabled")
      )
   
    (when (equal @toggle "enabled")

      (when (not @paperSize)
	(when (not @curBuild)
	  (insert
	   "\n%%% ERROR:: Either paperSize or curBuild should be specified."
	   )
	  )
	(when @curBuild
	  (when (bx:lcnt:curBuild:base-read)
	    (setq $curBuild:paperSize  (get 'bx:lcnt:curBuild:base 'paperSize))
	  ;;; NOTYET, verify that $curBuild:paperSize is valid
	    (setq @paperSize $curBuild:paperSize)
	    )
	  
	  (when (not @paperSize)
	    (insert
	     "\n%%% ERROR:: curBuild paperSize not is not valid."
	     )
	    )
	  )
	)
      
      ;;
      ;; @paperSize is available now.
      ;;

      ;; But, @paperSize is not being used.
      
      (when (equal @when "main")
	(setq $atLeastOnceWhenConditionals t)

	(insert
	 (format "

\\includecomment{%s-%s}

\\includecomment{whenDocIsComplete}
\\excludecomment{whenMailing}
\\excludecomment{whenDocIsPartial}

\\excludecomment{ignore}
"
		 lcnt-type
		 lcnt-lcntNu
		 )
	 )
	)
      
      (when (string= ~lcnt:bibProvider "bibtex")
	(insert (format "
\\includecomment{whenBibProviderIsBibtex}
\\excludecomment{whenBibProviderIsBiblatex}
"
			)))

      (when (string= ~lcnt:bibProvider "biblatex")
	(insert (format "
\\includecomment{whenBibProviderIsBiblatex}
\\excludecomment{whenBibProviderIsBibtex}
"
			)))
      
      (bx:eh:assert:atLeastOnceWhen
       $atLeastOnceWhenConditionals
       :context "latex"
       :info (format "Unknown when  %s\n"
		     @when)
       
       )
      )
    )
  )


(defun org-dblock-write:bx:lcnt:latex:title-page-online-at (@params)
  "Inserts Titles part of the title page.
"
  (bx:lcnt:info:base-read)
  
  (let ((@class (or (plist-get @params :class) ""))
	(@langs (or (plist-get @params :langs) ""))
	(@toggle (or (plist-get @params :toggle) ""))
	(@form (or (plist-get @params :form) "std"))	
	(@curBuild (or (plist-get @params :curBuild) nil))			
	(@paperSize (or (plist-get @params :paperSize) nil))
	(@spacing (or (plist-get @params :spacing) nil))
	(@qrcode (or (plist-get @params :qrcode) nil))		
	;;;
	(lcnt-lcntNu (get 'bx:lcnt:info:base 'lcntNu))
	(lcnt-version (get 'bx:lcnt:info:base 'version))
	(lcnt-url (get 'bx:lcnt:info:base 'url))
	(lcnt-presArtSrcFile (get 'bx:lcnt:info:base 'presArtSrcFile))
	;;;
	($bufferFileName (file-name-nondirectory buffer-file-name))
	($atLeastOnceWhenPaperSize nil)
	)

    ;;; when unspecified, @curBuild is t
    (unless (plist-member @params :curBuild)
      (setq @curBuild t))

    (blee:dblock:params:desc
     'latex-mode
     ":class \"book|pres+art\" :langs \"en+fa\"  :form \"priv|std\"  :toggle \"enabled|disabled|hide\" :curBuild nil|t :paperSize \"8.5x11|6x9\" :spacing nil|t :qrcode nil|t"
     )

    (when (not (equal @toggle "hide"))    
      (org-latex-node-insert-note
       :label (format "DBLOCK:")
       :name (format
	      "Title Page On-Line At --- toggle=%s form=%s curBuild=%s paperSize=%s spacing=%s"
	      @toggle
	      @form
	      @curBuild
	      @paperSize
	      @spacing
	      )
       :level 2
       :comment (format "")
       )
      )
    
    (when (equal @toggle "hide")  ;;; else
      (setq @toggle "disabled")
      )
   
    (when (equal @toggle "enabled")

      (when (not @paperSize)
	(when (not @curBuild)
	  (insert
	   "\n%%% ERROR:: Either paperSize or curBuild should be specified."
	   )
	  )
	(when @curBuild
	  (when (bx:lcnt:curBuild:base-read)
	    (setq $curBuild:paperSize  (get 'bx:lcnt:curBuild:base 'paperSize))
	  ;;; NOTYET, verify that $curBuild:paperSize is valid
	    (setq @paperSize $curBuild:paperSize)
	    )
	  
	  (when (not @paperSize)
	    (insert
	     "\n%%% ERROR:: curBuild paperSize not is not valid."
	     )
	    )
	  )
	)

        ;;;
        ;;; $paperSize is available now.
        ;;;
      
      (when @paperSize
	(insert 
	 (format "\n
%s On-line At paperSize=%s\n"
		 "%%%"
		 @paperSize
		 )
	 )
      
	(when (not (equal @form "priv"))

	  (when (or
		 (equal @paperSize "8.5x11")
		 (equal @paperSize "a4")
		 (equal @paperSize "6x9")
		 (equal @paperSize "17.5x23.5")
		 )
	    (setq $atLeastOnceWhenPaperSize t)

	  
	    (when (or (equal @class "art+pres")
		      (equal @class "art"))

	      (when (or (equal @langs "en")
			(equal @langs "en+fa"))
		(insert
		 (format "
\\begin{center}
\\rule{0.7\\textwidth}{.02in}\\\\
\\vspace{-0.10in}
\\rule{0.7\\textwidth}{.01in}\\\\
\\vspace{0.15in}
{\\large Available on-line at:\\\\
\\href{%s}{%s}}
\\end{center}
"
			 lcnt-url
			 lcnt-url)
		 )
		)

	      (when @qrcode
		(insert
		 (format "
\\begin{center}
\\vspace{0.2in}
\\qrcode[height=1in]{%s}
\\end{center}
"
			 lcnt-url)
		 )
		)
	
	      (when (equal @langs "fa+en")
		(insert "\\begin{center}\n")

		(insert "
\\vspace{0.05in}

\\begin{center}
{\\large مقاله و اسلايد روى وب در :}
"
		    )

		(insert "\\begin{latin}\n")
		(insert (format "\\href{%s}{%s}\n" lcnt-url lcnt-url))
		(insert "\\end{latin}\n")

		(insert "\\end{center}

\\vspace{0.3in}
"
			)
		)
	      )
	    )

	  (when (equal @paperSize "html")
	    (setq $atLeastOnceWhenPaperSize t)
	    
	    (insert
	     (format "
\\begin{center}
\\vspace{0.15in}
{\\large Available on-line at:\\\\
\\href{%s}{%s}}
\\end{center}

\\bigskip
"
			 lcnt-url
			 lcnt-url)
		 )
	    )
	  (bx:eh:assert:atLeastOnceWhen
	   $atLeastOnceWhenPaperSize
	   :context "latex"
	   :info (format "Unknown PaperSize  %s\n"
			 @paperSize)
	   )
	  )
	)
      )
    )
  )



(defun org-dblock-write:bx:lcnt:latex:title-page-body (params)
  "Starting Point Replacement for bx:dblock:lcnt:latex:title-page
"
  (bx:lcnt:info:base-read)
  
  (let ((bx:class (or (plist-get params :class) ""))
	(bx:langs (or (plist-get params :langs) ""))
	(coverPage (or (plist-get params :coverPage) "UnSpecified"))
	(bx:form (or (plist-get params :form) ""))		
	(lcnt-shortTitle (get 'bx:lcnt:info:base 'shortTitle))
	(lcnt-mainTitle (get 'bx:lcnt:info:base 'mainTitle))
	(lcnt-subTitle (get 'bx:lcnt:info:base 'subTitle))
	(lcnt-subSubTitle (get 'bx:lcnt:info:base 'subSubTitle))
	(lcnt-date (get 'bx:lcnt:info:base 'date))
	(lcnt-type (get 'bx:lcnt:info:base 'type))
	(lcnt-lcntNu (get 'bx:lcnt:info:base 'lcntNu))
	(lcnt-version (get 'bx:lcnt:info:base 'version))
	(lcnt-url (get 'bx:lcnt:info:base 'url))
	(lcnt-author1 (get 'bx:lcnt:info:base 'author1))
	(lcnt-authorName1 (get 'bx:lcnt:info:base 'authorName1))
	(lcnt-authorUrl1 (get 'bx:lcnt:info:base 'authorUrl1))
	(lcnt-presArtSrcFile (get 'bx:lcnt:info:base 'presArtSrcFile))	
	(bufferFileName (file-name-nondirectory buffer-file-name))	
	)


    (blee:dblock:params:desc
     'latex-mode
     ":class \"book|pres+art\" :langs \"en+fa\"  :form \"priv|std\" :coverPage \"blank|std\""
     )

    (org-latex-node-insert-note
     :label (format "DBLOCK:")
     :name (format
	    "Title Page Body --- form=%s"
	    bx:form
	    )
     :level 2
     :comment (format "")
     )

    (when (or (equal bx:class "art+pres")
	      (equal bx:class "art"))
      (insert (format "
\\thispagestyle{empty}

%%%%\\vfill

\\title{%s}\n" lcnt-shortTitle))

      (insert (format "
\\begin{center}
  {\\huge {\\bf %s\\\\
"  lcnt-mainTitle))

      (if (not (string-equal lcnt-subTitle ""))
	  (insert (format "\
\\vspace{0.3in}
%s\\\\\n" lcnt-subTitle)))

      (if (not (string-equal lcnt-subSubTitle ""))
	  (progn
	    (insert "\\vspace{0.2in}\n")	    
	    (insert (format "%s\\\\\n" lcnt-subSubTitle))))

      (insert "\
}}
\\end{center}

\\vspace{0.2in}
")

      (if (string-equal
	   bufferFileName
	   lcnt-presArtSrcFile)
    
	  (insert "
\\begin{center}
  {\\Large {\\bf Article Format Of Presentation\\\\
\\vspace{0.2in}
}}
\\end{center}
"))

     (insert "
\\vspace{0.7in}
")
      

     (when (or (equal bx:langs "en")
	       (equal bx:langs "en+fa"))
       (insert "\\begin{center}\n")
       (insert "{\\large Document \\#")
       (insert (format "%s-%s\\\\\n" lcnt-type lcnt-lcntNu))
       (insert (format "Version %s\\\\\n"  lcnt-version))
       (insert (format "%s}\n" lcnt-date))
       (insert "\\end{center}")

       (insert "
\\vspace{0.05in}")

       (when (not (equal bx:form "priv"))
	 (insert "

\\begin{center}
{\\large This Document is Available on-line at:\\\\
")

	 (insert (format "\\href{%s}{%s}}\n" lcnt-url lcnt-url))

	 (insert "\\end{center}
")
	 )

       (insert "
\\vspace{0.3in}

\\begin{center}
")

   (insert (format "{\\large {\\bf %s}\\\\
  Email: \\href{%s}{%s}\\\\
}" lcnt-authorName1 lcnt-authorUrl1 lcnt-authorUrl1))

   (insert "
\\end{center}

\\vspace{0.1in}

")
   )
      (when (equal bx:langs "fa+en")
	(insert "\\begin{center}\n")
	(insert "{\\large مقاله شماره: ")
	(insert (format "%s-%s\\\\\n" lcnt-type lcnt-lcntNu))
	(insert (format "تاريخ: %s}\n" lcnt-date))
	(insert "\\end{center}")

	(insert "
\\vspace{0.05in}

\\begin{center}
{\\large مقاله و اسلايد روى وب در :}
")

	(insert "\\begin{latin}\n")
	(insert (format "\\href{%s}{%s}\n" lcnt-url lcnt-url))
	(insert "\\end{latin}\n")

	(insert "\\end{center}

\\vspace{0.3in}

\\begin{center}
")

   (insert (format "{\\large {\\bf %s}\\\\
  تماس: \\lr{\\href{%s}{%s}}\\\\
}" lcnt-authorName1 lcnt-authorUrl1 lcnt-authorUrl1))

   (insert "\\end{center}

\\vspace{0.1in}

\\bibliographystyle{plain}
")

	)
      )  

    (when (or (equal bx:class "pres+art")
	      (equal bx:class "pres"))
      (insert "

\\mode<all>  % Important -- Must Be Here\n")

      (insert (format "
\\begin{latexonly}
"))

;; \\title[%s]
;; {%s}\n" lcnt-shortTitle lcnt-mainTitle))

;;       (if (not (string-equal lcnt-subTitle ""))
;; 	  (insert (format "
;; \\subtitle[%s]
;; {%s}\n" lcnt-subTitle lcnt-subTitle)))

;;       ;;;(if (not (string-equal lcnt-subSubTitle ""))
;; 	;;;  (insert (format "%s\\\\\n" lcnt-subSubTitle)))

;;       (insert (format "
;; \\author[%s] 
;; {%s\\\\
;; Email: \\href{%s}{%s}\\\\
;; }
;; " lcnt-authorName1 lcnt-authorName1 lcnt-authorUrl1 lcnt-authorUrl1))

;;       (insert (format "
;; \\institute[%s-%s] 
;; {\\href{%s}{%s}}
;; "   lcnt-type lcnt-lcntNu lcnt-url lcnt-url))

;;       (insert (format "
;; \\date[%s]
;; {%s}
;; " lcnt-date lcnt-date))
;; ;;;{%s\\\\Varbatim Copying Permitted}      

;;       (insert (format "
;; \\subject{%s}
;; " lcnt-shortTitle))

      (when (string-equal coverPage "blank")
	(insert "
% Blank Cover Page
\\bgroup
\\setbeamercolor{background canvas}{bg=black}
\\begin{frame}[plain]{}
\\end{frame}
\\egroup
"))

      (when (not (string-equal coverPage "blank"))
	(insert "
% No Blank Cover Page -- Select dblock :coverPage blank if desired
"))
      
      (insert "

  \\begin{frame}[label=titlePage]
    \\titlepage
    \\frameaudio{\"audio/titlePage.mp3\"}
%BxPy: impressiveFrameParSet('titlePage', 'always', 'True')
%BxPy: impressiveFrameParSet('titlePage', 'transition', 'UnSpecified')
%BxPy: impressiveFrameParSet('titlePage', 'onLeave', 'UnSpecified')
  \\end{frame}
\\end{latexonly}

\\begin{htmlonly}
  \\begin{frame}[label=titlePage]
  \\frameaudio{\"audio/titlePage.mp3\"}
")
      (insert (format "
  \\frametitle{%s}
"  lcnt-mainTitle))

      (if (not (string-equal lcnt-subTitle ""))
	  (insert (format "%s\\\\\n" lcnt-subTitle)))

      (if (not (string-equal lcnt-subSubTitle ""))
	  (insert (format "%s\\\\\n" lcnt-subSubTitle)))


      (when (or (equal bx:langs "en")
		(equal bx:langs "en+fa"))
    (insert "\\begin{center}\n")
    (insert "{\\large Document \\#")
    (insert (format "%s-%s\\\\\n" lcnt-type lcnt-lcntNu))
    (insert (format "Version %s\\\\\n"  lcnt-version))
    (insert (format "%s}\n" lcnt-date))
    (insert "\\end{center}")

   (insert "
\\vspace{0.05in}

\\begin{center}
{\\large This Document is Available on-line at:\\\\
")

   (insert (format "\\href{%s}{%s}}\n" lcnt-url lcnt-url))

   (insert "\\end{center}

\\begin{center}
")

   (insert (format "{\\large {\\bf %s}\\\\
  Email: \\href{%s}{%s}\\\\
}" lcnt-authorName1 lcnt-authorUrl1 lcnt-authorUrl1))

   (insert "\\end{center}")

   (insert "
  \\end{frame}
\\end{htmlonly}

")
      )

    ;;;(insert "%}}} DBLOCK-front-begin")
      )
    )
  )



(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *Table Of Contents*
")


(defun org-dblock-write:bx:lcnt:latex:toc-insert (@params)
  "Newer Version -- Obsoletes org-dblock-write:bx:dblock:lcnt:latex:toc-insert
"
  (let (
	(@class (or (plist-get @params :class) ""))
	(@langs (or (plist-get @params :langs) ""))
	(@toggle (or (plist-get @params :toggle) "enabled"))
	(@pageBreak (or (plist-get @params :pageBreak) nil))	
	(@toc (or (plist-get @params :toc) nil))
	(@tables (or (plist-get @params :tables) nil))	
	(@figures (or (plist-get @params :figures) nil))		
	)

    (blee:dblock:params:desc
     'latex-mode
     ":class \"book|pres+art\" :langs \"en+fa\" :pageBreak nil|t :toc nil|t :tables nil|t :figures nil|t"
     )

    (org-latex-node-insert-note
     :label (format "DBLOCK:")
     :name (format
	    "Table Of Contents --- pageBreak=%s toc=%s tables=%s figures=%s"
	    @pageBreak
	    @toc
	    @tables
	    @figures
	    )
     :level 1
     :comment (format "")
     )

    (when (equal @toggle "hide")  ;;; else
      (setq @toggle "disabled")
      )
   
    (when (equal @toggle "enabled")
    
    (when @pageBreak
      (insert "

\\clearpage
"
	      )
      )

      (insert "
\\pagenumbering{roman}
\\setcounter{page}{2}

\\bigskip
"
	      )
    

    
    (when @toc
      (insert "
\\tableofcontents"))
   
    (when @tables
      (insert "
\\listoftables"))

    (when @figures
      (insert "
\\listoffigures"))

    (insert "\n\n\\pagenumbering{arabic}\n")
      )))



(defun org-dblock-write:bx:dblock:lcnt:latex:toc-insert (@params)
  "Being Obsoleted by the modern type
"
  (let (
	($class (or (plist-get @params :class) ""))
	($langs (or (plist-get @params :langs) ""))
	($pageBreak (or (plist-get @params :pageBreak) ""))	
	($toc (or (plist-get @params :toc) ""))
	($tables (or (plist-get @params :tables) ""))	
	($figures (or (plist-get @params :figures) ""))		
	)

    
    
    (if (not (equal $toc ""))
	(org-latex-section-insert-dblock-name "Table Of Contents")
      (org-latex-section-insert-dblock-name "*NO* Table Of Contents")
      )

    (when (not (equal $pageBreak ""))
      (insert "

\\clearpage"))
    

    (insert "\n")
    
    (when (not (equal $toc ""))
      (insert "
\\tableofcontents"))
   
    (when (not (equal $tables ""))
      (insert "
\\listoftables"))

    (when (not (equal $figures ""))
      (insert "
\\listoffigures"))

    (insert "\n")
      ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex:toc params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:latex:toc (params)
  (let ((bx:class (or (plist-get params :class) ""))
	(bx:langs (or (plist-get params :langs) "")))
    (bx:lcnt:info:base-read)

    (org-latex-section-insert-dblock-name "Table Of Contents")
    
    (when (or (equal bx:class "art+pres")
	      (equal bx:class "art"))
      (insert "

\\clearpage

\\pagenumbering{roman}
\\setcounter{page}{2}

\\bigskip

\\tableofcontents
%\\listoftables
\\listoffigures

\\pagenumbering{arabic}
")
      )

    (when (or (equal bx:class "pres+art")
	      (equal bx:class "pres"))
      (when (or (equal bx:langs "en")
		(equal bx:langs "en+fa"))
	(insert "
\\bibliographystyle{plain}

")
	)

      (when (equal bx:langs "fa+en")
	(insert "
\\bibliographystyle{plain}

\\begin{frame}
  \\titlepage
\\end{frame}
")
	)
      )

    ;;;(insert "%}}} DBLOCK-front-end")
    ))


(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *Document Body*
")


(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *Initial Default Body*
")




(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *LaTeX Input*
")


;;;
;;; LaTeX dblock segments
;;;

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex-input params) [[elisp:(org-cycle)][| ]]
  ")

(defalias 'org-dblock-write:bx:lcnt:latex:input-file 'org-dblock-write:bx:dblock:lcnt:latex-input)

(defun org-dblock-write:bx:dblock:lcnt:latex-input (params)
  (let ((bx:disabledP (or (plist-get params :disabledP) "UnSpecified"))
	(bx:input-file (or (plist-get params :input-file) "missing")))
    (message (format "disabledP = %s" bx:disabledP))
    (if (not
	 (or (equal "TRUE" bx:disabledP)
	     (equal "true" bx:disabledP)
	     ))
	(progn
	  ;;; Processing Body
	  (message (format "EXECUTING -- disabledP = %s" bx:disabledP))
	  (if (file-exists-p bx:input-file)
	      (progn
		(insert (format "\
\\begin{comment}
%s  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]]  /Input/  [[elisp:(blee:file-goto-contents \"%s\")][Goto %s]] ::  [[elisp:(org-cycle)][| ]]
\\end{comment}

\\input{%s}"
				"*"
				bx:input-file
				bx:input-file
				bx:input-file
				)))
	    (message (format "Missing File: %s" bx:input-file))
	    )
	  )
      (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
      )))




(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex-input params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:frame:latex-input (params)
  (let ((bx:disabledP (or (plist-get params :disabledP) "UnSpecified"))
	(bx:input-file (or (plist-get params :input-file) "missing")))
    (message (format "disabledP = %s" bx:disabledP))
    (if (not
	 (or (equal "TRUE" bx:disabledP)
	     (equal "true" bx:disabledP)))
	(progn
	  ;;; Processing Body
	  (message (format "EXECUTING -- disabledP = %s" bx:disabledP))
	  (if (file-exists-p bx:input-file)
	      (progn
		(insert (format "\
\\begin{comment}
*****  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || /In Frame Input/  [[elisp:(blee:file-goto-contents \"%s\")][Goto %s]] ::  [[elisp:(org-cycle)][| ]]
\\end{comment}

\\input{%s}"
				bx:input-file
				bx:input-file
				bx:input-file
				)))))
      (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
      )))


(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *Part, Appendix, Chapter, Section, SubSection, ...*
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (lcnt:latex:insertSegment orgDepth segType segTitle labelInfo) [[elisp:(org-cycle)][| ]]
  ")

(defun lcnt:latex:insertSegment (orgDepth segType segTitle @shortTitle labelInfo)
  "segType is one of chapter, section, subsection, etc.
When labelInfo is UnSpecified, no label is inserted.
When labelInfo is 'auto', the label is derived from segTitle --
otherwise labelInfo is inserted as label"
  
  (defun getTagForLabelFromSegType (segType)
    "Returns something like 'sec:' for use in a lable"
    (let ((tagForLabel "unknown:"))
      (when (member segType (list
			     "section"
			     "subsection"
			     "subsubsection"
			     ))
	(setq tagForLabel "sec:"))
      (when (member segType (list
			     "chapter"
			     ))
	(setq tagForLabel "chap:"))
      (when (member segType (list
			     "part"
			     ))
	(setq tagForLabel "part:"))
      tagForLabel))

  (let (
	(delimiterLinePerhaps "")
	(newPagePerhaps "")
	($shortTitleStr "")
	($labelTitleStr "")
	)

    (blee:dblock:params:desc
     'latex-mode
     ":class \"book|pres+art\" :langs \"en+fa\" :disabledP \"false\" :seg-title \"str\" :short-title \"str\" :label \"auto\""
     )

    (setq $labelTitleStr segTitle)
    (when @shortTitle
      (setq $labelTitleStr shortTitle))
    
    (when (member segType (list "part" "chapter"))
      (setq delimiterLinePerhaps "\n*      ================"))

    (when (string-equal segType "part")
      (setq newPagePerhaps "\n\\newpage")

      (insert
       (format "\
\\begin{comment}%s
%s  [[elisp:(blee:ppmm:org-mode-toggle)][|n]] [[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]  *%s*   /%s/ ::  [[elisp:(org-cycle)][| ]]
\\end{comment}"
	       delimiterLinePerhaps
	       (make-string orgDepth ?*)
	       (str:capitalize-first-char segType)
	       $labelTitleStr
	       )))
    
    (when (not (string-equal segType "part"))
      (insert
       (format "\
\\begin{comment}%s
%s  [[elisp:(blee:ppmm:org-mode-toggle)][|n]] [[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]  /%s/   [[elisp:(org-cycle)][| =%s= |]] :: |
\\end{comment}"
	       delimiterLinePerhaps
	       (make-string orgDepth ?*)
	       (str:capitalize-first-char segType)
	       $labelTitleStr
	       )))

    (when @shortTitle
      (setq $shortTitleStr
	    (format "[%s]\n" @shortTitle)))
    
    (insert
     (format "
%s
\\%s%s{%s}"
	     newPagePerhaps
	     segType
	     $shortTitleStr
	     segTitle
	     ))

    
    (when (string-equal labelInfo "auto")
      (setq labelInfo (str:spacesElim $labelTitleStr)))

    (when (not (or (string-equal labelInfo "UnSpecified") (string-equal labelInfo "")))
      (insert
       (format "
\\label{%s}"
	       (concat (getTagForLabelFromSegType segType) labelInfo)
	       )))
    )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (lcnt:latex:insertSegmentOld orgDepth segType segTitle labelInfo) [[elisp:(org-cycle)][| ]]
  ")

(defun lcnt:latex:insertSegmentOld (orgDepth segType segTitle @shortTitle labelInfo)
  "segType is one of chapter, section, subsection, etc.
When labelInfo is UnSpecified, no label is inserted.
When labelInfo is 'auto', the label is derived from segTitle --
otherwise labelInfo is inserted as label"
  
  (defun getTagForLabelFromSegType (segType)
    "Returns something like 'sec:' for use in a lable"
    (let ((tagForLabel "unknown:"))
      (when (member segType (list
			     "section"
			     "subsection"
			     "subsubsection"
			     ))
	(setq tagForLabel "sec:"))
      (when (member segType (list
			     "chapter"
			     ))
	(setq tagForLabel "chap:"))
      (when (member segType (list
			     "part"
			     ))
	(setq tagForLabel "part:"))
      tagForLabel))

  (let (
	(delimiterLinePerhaps "")
	(newPagePerhaps "")
	($shortTitleStr "")
	($labelTitleStr "")
	)

    (blee:dblock:params:desc
     'latex-mode
     ":class \"book|pres+art\" :langs \"en+fa\" :disabledP \"false\" :seg-title \"str\" :short-title \"str\" :label \"auto\""
     )

    (setq $labelTitleStr segTitle)
    (when @shortTitle
      (setq $labelTitleStr shortTitle))
    
    (when (member segType (list "part" "chapter"))
      (setq delimiterLinePerhaps "\n*      ================"))

    (when (string-equal segType "part")
      (setq newPagePerhaps "\n\\newpage")

      (insert
       (format "\
\\begin{comment}%s
%s  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]]  *%s*   /%s/ ::  [[elisp:(org-cycle)][| ]]
\\end{comment}"
	       delimiterLinePerhaps
	       (make-string orgDepth ?*)
	       (str:capitalize-first-char segType)
	       $labelTitleStr
	       )))
    
    (when (not (string-equal segType "part"))
      (insert
       (format "\
\\begin{comment}%s
%s  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]]  /%s/   %s ::  [[elisp:(org-cycle)][| ]]
\\end{comment}"
	       delimiterLinePerhaps
	       (make-string orgDepth ?*)
	       (str:capitalize-first-char segType)
	       $labelTitleStr
	       )))

    (when @shortTitle
      (setq $shortTitleStr
	    (format "[%s]\n" @shortTitle)))
    
    (insert
     (format "
%s
\\%s%s{%s}"
	     newPagePerhaps
	     segType
	     $shortTitleStr
	     segTitle
	     ))

    
    (when (string-equal labelInfo "auto")
      (setq labelInfo (str:spacesElim $labelTitleStr)))

    (when (not (or (string-equal labelInfo "UnSpecified") (string-equal labelInfo "")))
      (insert
       (format "
\\label{%s}"
	       (concat (getTagForLabelFromSegType segType) labelInfo)
	       )))
    )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (str:capitalize-first-char string) [[elisp:(org-cycle)][| ]]
  ")

;;;
;;; (str:capitalize-first-char "myName")
;;;
(defun str:capitalize-first-char (string)
  "Capitalize only the first character of the input STRING."
  (when (> (length string) 0)
    (let ((first-char (substring string 0 1))
          (rest-str   (substring string 1)))
      (concat (capitalize first-char) rest-str))))



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defmacro     :: (bx:lcnt:org-dblock-defun) [[elisp:(org-cycle)][| ]]
  ")

;;
;; (macroexpand-all (bx:lcnt:org-dblock-defun ":bx:dblock:lcnt:latex-section" "section" 1))
;; (org-dblock-write:bx:dblock:lcnt:latex-section "example")
;;
(defmacro bx:lcnt:org-dblock-defun (funcName segType orgDepth)
  "The macro defines a function to be invoked from a dblock"
  (let (
	(fullFuncName)
	(baseFuncName "org-dblock-write")
	)
    (setq fullFuncName (concat baseFuncName funcName))
    ;;;
    ;;; Equivalent of (defun ,fullFuncName (params)
    ;;;
    `(fset (intern ,fullFuncName)
	   (lambda (params)
	     (let (
		   (dblockMode (or (plist-get params :disabledP) "UnSpecified"))
		   (dblockMode (or (plist-get params :mode) "UnSpecified"))	
		   (segTitle (or (plist-get params :seg-title) "UnSpecified"))
		   (shortTitle (or (plist-get params :short-title) nil))		   
		   (labelInfo (or (plist-get params :label) "UnSpecified"))
		   )
	       (when (blee:dblock:mode:disabledP dblockMode)
		 (blee:dblock:mode:disabledIndicate))
		 
	       (when (not (blee:dblock:mode:disabledP dblockMode))
		 (lcnt:latex:insertSegment ,orgDepth ,segType segTitle shortTitle labelInfo)
		 )
	       ))
	   )
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex-part params) [[elisp:(org-cycle)][| ]]
  ")

;;; Not using macro to do the defun
;;;(bx:lcnt:org-dblock-defun ":bx:dblock:lcnt:latex-part" "part" 1)
;;;
;;; This explicit definition adds  toc
;;;

(defun org-dblock-write:bx:dblock:lcnt:latex-part (params)
  "With :toc NU, partNu is set and a toc is generated. With :part NU only partNu is set" 
  (let ((bx:disabledP (or (plist-get params :disabledP) "UnSpecified"))
	(bx:seg-title (or (plist-get params :seg-title) "missing"))
	(labelInfo (or (plist-get params :label) "UnSpecified"))	
	(bx:toc (or (plist-get params :toc) ""))
	($@tocDepth (or (plist-get params :tocDepth) 3))	
	(bx:part (or (plist-get params :part) ""))
	($partpage (or (plist-get params :partpage) nil))	
	($partDesc)
	)
    (message (format "disabledP = %s" bx:disabledP))
    (if (not
	 (or (equal "TRUE" bx:disabledP)
	     (equal "true" bx:disabledP)))
	(progn
	  ;;; Processing Body
	  (message (format "EXECUTING -- disabledP = %s" bx:disabledP))

	  (blee:dblock:params:desc
	   'latex-mode
	   ":toc \"NU\" :tocDepth 3 :part \"NU\" :label \"auto|spec\" :partpage t"
	   )

	  (when (string-equal bx:part "")
	    ;;(setq bx:part bx:toc)
	    (insert (format "\
\\begin{comment}
%s      ================
%s  [[elisp:(blee:ppmm:org-mode-toggle)][|n]] [[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]  *Part*   _%s_ ::  [[elisp:(org-cycle)][| ]]
\\end{comment}

\\newpage
\\part{%s}"
			  "*"
			  "*"
			  bx:seg-title
			  bx:seg-title
			  ))
	    

	    )
	     

	  (when (not (string-equal bx:part ""))
	    (insert (format "\
\\begin{comment}
%s      ================
%s  [[elisp:(blee:ppmm:org-mode-toggle)][|n]] [[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]  *Part %s*   _%s_ ::  [[elisp:(org-cycle)][| ]]
\\end{comment}

\\newpage
\\part{%s}"
			  "*"
			  "*"
			  bx:part
			  bx:seg-title
			  bx:seg-title
			  ))
	    )

	  (when (string-equal labelInfo "auto")
	    (setq labelInfo (str:spacesElim bx:seg-title)))

	  (when (not (string-equal labelInfo "UnSpecified"))
	    (insert
	     (format "
\\label{%s}"
		     (concat "part:" labelInfo)
		     )))

	  (if (or (equal bx:toc "0") (equal bx:toc 0))
	      (setq $partDesc "This Part")
	    (setq $partDesc (format "Part %s" bx:toc))
	    )
	  
	  (when $partpage
	    (insert "

\\begin{latexonly}
\\begin{presentationMode}
\\begin{frame}
\\partpage
\\end{frame}
\\end{presentationMode}
\\end{latexonly}"
		    )
	    )
	  
	  (when (not (equal bx:toc ""))
	    (insert (format "

\\begin{latexonly}
\\begin{presentationMode}
\\begin{frame}[fragile,plain,label=Part%s]
\\frametitle{Outline of %s -- %s}
"
			    bx:toc
			    $partDesc
			    bx:seg-title
			    ))
	    
	    (when (equal $@tocDepth 3)
	      (insert "\
\\tableofcontents[sectionstyle=show,subsectionstyle=show]
")
	      )
	    (when (equal $@tocDepth 2)
	      (insert "\
\\tableofcontents[sectionstyle=show,subsectionstyle=show,subsubsectionstyle=hide]
")
	      )
	    (when (equal $@tocDepth 1)
	      (insert "\
\\tableofcontents[sectionstyle=show,subsectionstyle=hide,subsubsectionstyle=hide]
")
	      )

	      (insert "\
\\end{frame}
\\end{presentationMode}
\\end{latexonly}"
		      )
	      )
	  
      (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
      ))))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex-chapter params) [[elisp:(org-cycle)][| ]]
  ")

(bx:lcnt:org-dblock-defun ":bx:dblock:lcnt:latex-chapter" "chapter" 1)

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex-chapter* params) [[elisp:(org-cycle)][| ]]
  ")

(bx:lcnt:org-dblock-defun ":bx:dblock:lcnt:latex-chapter*" "chapter*" 1)


(defun org-dblock-write:bx:lcnt:latex-orgSeparator (params)
  (let ((bx:disabledP (or (plist-get params :disabledP) "UnSpecified"))
	(bx:seg-title (or (plist-get params :seg-title) "missing")))
    (message (format "disabledP = %s" bx:disabledP))
    (if (not
	 (or (equal "TRUE" bx:disabledP)
	     (equal "true" bx:disabledP)))
	(progn
	  ;;; Processing Body
	  (message (format "EXECUTING -- disabledP = %s" bx:disabledP))
	  (insert (format "\
\\begin{comment}
*      ================
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || *Segment*   %s ::  [[elisp:(org-cycle)][| ]]
\\end{comment}"
			  bx:seg-title
			  )))
      (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
      )))



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex-appendix params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:latex-appendix (params)
  (let ((bx:disabledP (or (plist-get params :disabledP) "UnSpecified"))
	(bx:seg-title (or (plist-get params :seg-title) "missing")))
    (message (format "disabledP = %s" bx:disabledP))
    (if (not
	 (or (equal "TRUE" bx:disabledP)
	     (equal "true" bx:disabledP)))
	(progn
	  ;;; Processing Body
	  (message (format "EXECUTING -- disabledP = %s" bx:disabledP))
	  (insert (format "\
\\begin{comment}
*      ================
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || *Appendix*   %s ::  [[elisp:(org-cycle)][| ]]
\\end{comment}

\\newpage
\\appendix{%s}
\\label{%s}"
			  bx:seg-title
			  bx:seg-title
			  (concat "app:" (str:spacesElim bx:seg-title))			  
			  )))
      (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
      )))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex-section* params) [[elisp:(org-cycle)][| ]]
  ")


(bx:lcnt:org-dblock-defun ":bx:dblock:lcnt:latex-section*" "section*" 1)


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex-subsection* params) [[elisp:(org-cycle)][| ]]
  ")


(bx:lcnt:org-dblock-defun ":bx:dblock:lcnt:latex-subsection*" "subsection*" 2)



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex-subsubsection* params) [[elisp:(org-cycle)][| ]]
  ")

(bx:lcnt:org-dblock-defun ":bx:dblock:lcnt:latex-subsubsection*" "subsubsection*" 3)

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex-subsubsubsection* params) [[elisp:(org-cycle)][| ]]
  ")

(bx:lcnt:org-dblock-defun ":bx:dblock:lcnt:latex-subsubsubsection*" "subsubsubsection*" 4)



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex-section params) [[elisp:(org-cycle)][| ]]
  ")


(bx:lcnt:org-dblock-defun ":bx:dblock:lcnt:latex-section" "section" 1)



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex-subsection params) [[elisp:(org-cycle)][| ]]
  ")

(bx:lcnt:org-dblock-defun ":bx:dblock:lcnt:latex-subsection" "subsection" 2)

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex-subsubsection params) [[elisp:(org-cycle)][| ]]
  ")

(bx:lcnt:org-dblock-defun ":bx:dblock:lcnt:latex-subsubsection" "subsubsection" 3)

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex-subsubsubsection params) [[elisp:(org-cycle)][| ]]
  ")


(bx:lcnt:org-dblock-defun ":bx:dblock:lcnt:latex-subsubsubsection" "subsubsubsection" 4)


(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *Bibliography*
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex:bibliography params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:latex:bibliography (params)
  (let (
	(bx:disabledP (or (plist-get params :disabledP) "UnSpecified"))
	(bx:class (or (plist-get params :class) ""))
	(bx:langs (or (plist-get params :langs) ""))
	)
    (if (not
	 (or (equal "TRUE" bx:disabledP)
	     (equal "true" bx:disabledP)))
	(progn
	  ;;; Processing Body
	  (message (format "EXECUTING -- disabledP = %s" bx:disabledP))

          (org-latex-section-insert-dblock-name "Bibliography")

	  (when (equal bx:class "memo")
	    (insert "\
% No Bib For Memo"
		    )
	    )

	  (when (or (equal bx:class "art+pres")
		    (equal bx:class "art"))
	    (insert "
%\\bibliography{/usr/local/lib/bib/gnu,/usr/local/lib/bib/networking,/usr/local/lib/bib/nedadoc,/usr/local/lib/bib/rfcs,/lcnt/outputs/all/plpc}
\\bibliography{/lcnt/outputs/all/plpcUrl,/usr/local/lib/bib/rfcs}"
		    )
	    )

	  (when (or (equal bx:class "pres+art")
		    (equal bx:class "pres"))
	    (insert "
\\bibliography{/lcnt/outputs/all/plpcUrl,/usr/local/lib/bib/rfcs}"
		    )
	    )
	  )
      (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
      )))


(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *End Document*
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex-document-end params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:latex:document-end (params)
  (let (
	(bx:disabledP (or (plist-get params :disabledP) "UnSpecified"))
	(bx:class (or (plist-get params :class) ""))
	(bx:langs (or (plist-get params :langs) ""))
	)
    (if (not
	 (or (equal "TRUE" bx:disabledP)
	     (equal "true" bx:disabledP)))
	(progn
	  ;;; Processing Body
	  (message (format "EXECUTING -- disabledP = %s" bx:disabledP))

          ;;(org-latex-section-insert-dblock-name "End-Of-Document")
	  (org-latex-node-insert-note
	   :label "DBLOCK:"
	   :name (format "End-Of-Document")
	   :level 1
	   :comment (format "")
	   )
	  
	  
	  (when (equal bx:class "memo")
	    (insert "

\\end{document}"
		    )
	    )

	  (when (or (equal bx:class "art+pres")
		    (equal bx:class "art"))
	    (insert "

\\end{document}"
		    )
	    )

	  (when (or (equal bx:class "pres+art")
		    (equal bx:class "pres"))
	    (insert "

\\end{document}"	    
		    )
	    )
	  (insert (format "

\\begin{comment}
*      ================
\\end{comment}"
			  )))
      (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
      )))


(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *Conversions*
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (latex-one-section-to-dblock) [[elisp:(org-cycle)][| ]]
")

(defun latex-one-section-to-dblock ()
  "Convert All sections to their dblocks" 
  (interactive)
  (if (save-excursion (re-search-forward "^\\\\.*section" nil t))
      (when (re-search-forward "^\\\\.*section" nil t)
	(let* (
	       (sectionCmnd (thing-at-point 'word))
	       )
	  (save-excursion
	    (skip-chars-forward " 	{")
	    (let ((sectionTitle
		   (buffer-substring 
		    (point)
		    (progn
		      (skip-chars-forward "^}")
		      (point)))))
	      
	      (message (format "Section ==  %s-- %s" sectionCmnd sectionTitle))
	      (beginning-of-line 1)
	      (delete-region (point) (progn (forward-line 1) (point)))
	      (message "Inserting dblock ...") ;;(sit-for 1)
	      (latex-dblock-section-insert sectionCmnd sectionTitle)
	      ))))))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (latex-all-section-to-dblock) [[elisp:(org-cycle)][| ]]
")

(defun latex-all-section-to-dblock ()
  "Convert All sections to their dblocks" 
  (interactive)
  (if (save-excursion (re-search-forward "^\\\\.*section" nil t))
      (while (re-search-forward "^\\\\.*section" nil t)
	(let* (
	       (sectionCmnd (thing-at-point 'word))
	       )
	  (save-excursion
	    (skip-chars-forward " 	{")
	    (let ((sectionTitle
		   (buffer-substring 
		    (point)
		    (progn
		      (skip-chars-forward "^}")
		      (point)))))
	      
	      (message (format "Section ==  %s-- %s" sectionCmnd sectionTitle))
	      (beginning-of-line 1)
	      (delete-region (point) (progn (forward-line 1) (point)))
	      (message "Inserting dblock ...") ;;(sit-for 1)
	      (latex-dblock-section-insert sectionCmnd sectionTitle)
	      ))))))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (latex-dblock-section-insert segCmnd segTitle) [[elisp:(org-cycle)][| ]]
  ")

(defun latex-dblock-section-insert (segCmnd segTitle)
  ""
  (insert "\
%%%#+BEGIN:")
	  
  (insert
   (format "\
 bx:dblock:lcnt:latex-%s :disabledP \"false\" :seg-title \"%s\""
	   segCmnd
	   segTitle))
  
  (insert "
%%%#+END:
"
	  )
  )


(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *Support Functions*
")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-latex-section-insert-dblock-name params) [[elisp:(org-cycle)][| ]]
")

(defun org-latex-section-insert-dblock-nameObsoleted (name)
  "Given NAME, insert a latex commented section tag.
Both begin and end should always be terminated wit ha new line.
Star at the begining of line is avoided not to show up in org-mode view.
"
  (insert
   (format "\
\\begin{comment}\n*\
  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || /DBLOCK: %s/  ::  [[elisp:(org-cycle)][| ]]
\\end{comment}
"
	   name
	   )))

(defun org-latex-section-insert-dblock-name (@name &optional @level @comment)
  "Given NAME, insert a latex commented section tag.
Both begin and end should always be terminated with a new line.
Star at the begining of line is avoided not to show up in org-mode view.
"
  (let (
	($orgLevelStr)
	($commentStart "=")
	($commentEnd "=")	
	)
    (if (not @level)
	(setq @level 1)
      )
    (setq $orgLevelStr (make-string @level ?*))

    (if (not @comment)
	(progn 
	  (setq @comment "")
	  (setq $commentStart "")
	  (setq $commentEnd "")
	  )
      )

    (insert
     (format "\
\\begin{comment}\n%s\
  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]]  /DBLOCK: %s/ %s%s%s ::  [[elisp:(org-cycle)][| ]]
\\end{comment}\
"
	     $orgLevelStr
	     @name	     
	     $commentStart
	     @comment
	     $commentEnd
	     ))
    ))

(defun org-latex-node-insert-note (&rest @args)
  "Insert a latex commented org-node.
"
  (let (
	(@label (or (plist-get @args :label) "Note:"))
	(@name (or (plist-get @args :name) ""))
	(@level (or (plist-get @args :level) 1))
	(@comment (or (plist-get @args :comment) nil))	
	;;;
	($orgLevelStr)
	($commentStart "=")
	($commentEnd "=")
	($labelNameSeparator " ")
	)

    (setq $orgLevelStr (make-string @level ?*))

    (when (not @comment)
      (setq @comment "")
      (setq $commentStart "")
      (setq $commentEnd "")
      )

    (when (equal @name "")
      (setq $labelNameSeparator "")
      )

    (insert
     (format "\
\\begin{comment}\n\
%s\
 [[elisp:(blee:ppmm:org-mode-toggle)][|n]] [[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]] \
 /%s%s%s/  %s%s%s\
 ::  [[elisp:(org-cycle)][| ]]
\\end{comment}\
"
	     $orgLevelStr
	     @label
	     $labelNameSeparator
	     @name	     
	     $commentStart
	     @comment
	     $commentEnd
	     ))
    ))

;; (blee:dblock:params:desc 'latex-mode "Some String")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:dblock:params:desc @mode @descStr) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:dblock:params:desc (@mode @descStr)
  "Inserts $commentStr+@docstr at point -- @mode is used for comment delim"
  (let (
	;;;
	($atLeastOnceWhen nil)
	)
  
    (when (equal @mode 'latex-mode)
      (insert (format "%%%%%% Args: %s\n" @descStr))
      (setq $atLeastOnceWhen t)
      )
    (when (equal @mode 'shell-script-mode)
      (insert (format "### Args: %s\n" @descStr))
      (setq $atLeastOnceWhen t)      
      )
    (when (equal @mode 'org-mode)
      (insert (format "### Args: %s\n" @descStr))
      (setq $atLeastOnceWhen t)      
      )
    (bx:eh:assert:atLeastOnceWhen
     $atLeastOnceWhen
     :context "any"
     :info (format "Unknown mode =%s=\n"
		   @mode)
     )
    )
  )




;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "dblock-lcnt-latex"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'dblock-lcnt-latex)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; bx:iimp:iimName: "hereHere"
;;; end:
