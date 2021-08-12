;;; -*- Mode: Emacs-Lisp; -*-
;; (setq debug-on-error t)

;;;#+BEGIN: bx:dblock:global:org-controls :disabledP "false" :mode "auto"
(lambda () "
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
*  /Maintain/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 
*      ================
")
;;;#+END:

;;;#+BEGIN: bx:dblock:global:org-contents-list :disabledP "false" :mode "auto"
(lambda () "
*      ################ CONTENTS-LIST ###############
*  [[elisp:(org-cycle)][| ]]  *Document Status, TODOs and Notes*          ::  [[elisp:(org-cycle)][| ]]
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
  (let ((bx:class (or (plist-get params :class) ""))
	(bx:langs (or (plist-get params :langs) ""))
	)
    (bx:lcnt:info:base-read)

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
	  (insert (format "\
*      ================
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
	)
    (bx:lcnt:info:base-read)

    (insert (format "\
\\begin{comment}
*      ================
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
\\end{comment}\
"
		    bufferFileName bufferFileName bufferFileName bufferFileName
		    ))
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
    
    (insert (format "\
\\begin{comment}\n*\
  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || /DBLOCK: early-common-packages%s/  ::  [[elisp:(org-cycle)][| ]]
\\end{comment}\n"
		    $modernStr 
		    ))
    
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

\\usepackage{fontspec}
% \\usepackage{xltxtra}  % OBSOLETED In Ubuntu 16.04 and 18.04
\\usepackage{xunicode}
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

\\usepackage{fontspec}
% \\usepackage{xltxtra}  % OBSOLETED In Ubuntu 16.04 and 18.04
\\usepackage{xunicode}
")
       (if (not (equal bx:class "art+pres"))
	   (insert "\\usepackage{bidi}\n"))

       (insert "
\\usepackage{beamerarticle}

\\usepackage{tikz}

\\newenvironment{bidiSepBeforeHevea}{}{}
\\usepackage{bidi}
\\newenvironment{bidiSepAfterHevea}{}{}

\\usepackage{bystarpersian}   % Defines: \\newfontfamily{\\persian}, \\newcommand{\\farsi}, \\newenvironment{faPar},{fa}
\\usepackage{bystararticle}   % Defines: \\excludecomment{presentationMode} \\newcommand{\\pnote}
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
\\RCSdef $Revision: 1.1 $
\\RCSdef $Date: 2018-10-29 06:02:25 $
\\RCSdef $Source: /cvsd/rep1/profile/intra/employee/lisp/dblock/dblock-lcnt-latex-new.el,v $
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
    (insert (format "\
\\begin{comment}
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || /DBLOCK: optional-packages-and-styles/  ::  [[elisp:(org-cycle)][| ]]
\\end{comment}\n"))
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
    (insert (format "\
\\begin{comment}
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || /DBLOCK: custom-specialized-packages/  ::  [[elisp:(org-cycle)][| ]]
\\end{comment}\n"))
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

    (insert (format "\
\\begin{comment}
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || /DBLOCK: late-common-packages/  ::  [[elisp:(org-cycle)][| ]]
\\end{comment}\n"))

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

\\usepackage{bystarpersian}   % Defines: \\newfontfamily{\persian}, \\newcommand{\farsi}, \\newenvironment{faPar},{fa}
\\usepackage{bystarpresentation}   % Defines: \\excludecomment{presentationMode} \\newcommand{\\pnote}
")
	)
      ;;;(insert "\\begin{document}\n")
      )
    ;;;(insert "%}}} DBLOCK-header-end")
    ))


(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *Common Packages Style Settings*
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex:common-packages-style-settings params) [[elisp:(org-cycle)][| ]]
")

(defun org-dblock-write:bx:dblock:lcnt:latex:common-packages-style-settings (params)
  (let ((bx:class (or (plist-get params :class) ""))
	(bx:langs (or (plist-get params :langs) "")))
    (bx:lcnt:info:base-read)
    
    (org-latex-section-insert-dblock-name "common-packages-style-settings")


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


\\pagestyle{fancy}
\\fancyhead{} % clear all header fields  
%% \\fancyhead[C]{{\\small  {\\tt Work In Progress}}}
\\renewcommand{\\headrulewidth}{0pt} % no line in header area
\\fancyfoot{} % clear all footer fields
%%\\fancyfoot[LE,RO]{\\thepage}           % page number in \"outer\" position of footer line
%% \\fancyfoot[RE,LO]{{\\tt --EARLY DRAFT DOCUMENT--\\hspace{20 mm} --Reflects Work In Progress-- }}
\\fancyfoot[RE,LO]{}


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
    
    (bx:lcnt:info:base-read)
    ;;;(insert "%{{{ DBLOCK-main-begin\n")

    (org-latex-section-insert-dblock-name "begin-document")

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


(defun org-dblock-write:bx:dblock:lcnt:latex:title-insert (@params)
  (let (
	(bx:class (or (plist-get @params :class) ""))
	(bx:langs (or (plist-get @params :langs) ""))
	($title (or (plist-get @params :title) ""))	
	(lcnt-shortTitle (get 'bx:lcnt:info:base 'shortTitle))
	(lcnt-mainTitle (get 'bx:lcnt:info:base 'mainTitle))
	(lcnt-subTitle (get 'bx:lcnt:info:base 'subTitle))
	(lcnt-subSubTitle (get 'bx:lcnt:info:base 'subSubTitle))
	)
    
    (bx:lcnt:info:base-read)

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
	(lcnt-authorName1 (get 'bx:lcnt:info:base 'authorName1))
	)

    (if (equal bx:form "none")
	(progn
	  (insert "% dblock copyright notice says none")
	  )
      (progn 
    
    (bx:lcnt:info:base-read)
    ;;;(insert "%{{{ DBLOCK-copyright\n")

    (org-latex-section-insert-dblock-name "Copyright Settings")

    (when (or (equal bx:class "art+pres")
	      (equal bx:class "art"))
      (when (or (equal bx:langs "en")
		(equal bx:langs "en+fa"))
	(insert (format "
\\vspace{0.4in}

{\\bf Copyright} \\copyright \\space  {\\bf  2014 %s}
" lcnt-authorName1))

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
" lcnt-authorName1))

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
      (insert "% dblock copyright notice just says verbatim copying permitted\n"))

))
    
    ;;;(insert "%}}} DBLOCK-copyright")
    ))



(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *Mention LCNT (PLPC-NU)*
")


(defun org-dblock-write:bx:dblock:lcnt:latex:mention-lcnt (params)
  " Typical usage:
%%%#+BEGIN: bx:dblock:lcnt:latex:mention-lcnt :class \"art\" :lcnt-nu \"plpc-120038\"

%%%#+END:
"
  (let (
	(in:lcntNu (or (plist-get params :lcnt-nu) ""))
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
  \\textbf{%s}\\\\"
		      in:lcntNu
		      lcnt-mainTitle
		      ))

      (when (not (string-equal (format "%s" lcnt-subTitle) ""))
	(insert (format "
  \\textbf{%s}\\\\"
			lcnt-subTitle
			)))

      (when (not (string-equal (format "%s" lcnt-subSubTitle) ""))
	(insert (format "
  \\textbf{%s}\\\\"
			lcnt-subSubTitle
			)))

      (insert (format "
  \\href{%s}{%s}
  --- \\cite{%s}\\\\
\\end{quote}
"
		      lcnt-url lcnt-url
		      in:lcntNu
		      ))

      
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
	(lcnt-shortTitle (get 'bx:lcnt:info:base 'shortTitle))
	)
    (bx:lcnt:info:base-read)

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

    (org-latex-section-insert-dblock-name "title-page")

    (when (or (equal bx:class "art+pres")
	      (equal bx:class "art"))
      (insert (format "
\\thispagestyle{empty}

\\vfill

\\title{%s}\n" lcnt-shortTitle))

      (insert (format "
\\begin{center}
  {\\huge {\\bf %s\\\\
"  lcnt-mainTitle))

      (if (not (string-equal lcnt-subTitle ""))
	  (insert (format "%s\\\\\n" lcnt-subTitle)))

      (if (not (string-equal lcnt-subSubTitle ""))
	  (insert (format "%s\\\\\n" lcnt-subSubTitle)))

      (insert "\\vspace{0.2in}
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
\\vspace{0.05in}

\\begin{center}
{\\large This Document is Available on-line at:\\\\
")

   (insert (format "\\href{%s}{%s}}\n" lcnt-url lcnt-url))

   (insert "\\end{center}

\\vspace{0.3in}

\\begin{center}
")

   (insert (format "{\\large {\\bf %s}\\\\
  Email: \\href{%s/contact}{%s/contact}\\\\
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
  تماس: \\lr{\\href{%s/contact}{%s/contact}}\\\\
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

\\title[%s]
{%s}\n" lcnt-mainTitle lcnt-mainTitle))

      (if (not (string-equal lcnt-subTitle ""))
	  (insert (format "
\\subtitle[%s]
{%s}\n" lcnt-subTitle lcnt-subTitle)))

      ;;;(if (not (string-equal lcnt-subSubTitle ""))
	;;;  (insert (format "%s\\\\\n" lcnt-subSubTitle)))

      (insert (format "
\\author[%s] 
{%s\\\\
Email: \\href{%s/contact}{%s/contact}\\\\
}
" lcnt-authorName1 lcnt-authorName1 lcnt-authorUrl1 lcnt-authorUrl1))

      (insert (format "
\\institute[%s-%s] 
{\\href{%s}{%s}}
"   lcnt-type lcnt-lcntNu lcnt-url lcnt-url))

      (insert (format "
\\date[%s]
{%s\\\\Varbatim Copying Permitted}
" lcnt-date lcnt-date))

      (insert (format "
\\subject{%s}
" lcnt-shortTitle))

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
  Email: \\href{%s/contact}{%s/contact}\\\\
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

(defun org-dblock-write:bx:dblock:lcnt:latex:toc-insert (@params)
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
	     (equal "true" bx:disabledP)))
	(progn
	  ;;; Processing Body
	  (message (format "EXECUTING -- disabledP = %s" bx:disabledP))
	  (if (file-exists-p bx:input-file)
	      (progn
		(insert (format "\
\\begin{comment}
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || /Input/  [[elisp:(blee:file-goto-contents \"%s\")][Goto %s]] ::  [[elisp:(org-cycle)][| ]]
\\end{comment}

\\input{%s}"
				bx:input-file
				bx:input-file
				bx:input-file
				)))))
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

(defun lcnt:latex:insertSegment (orgDepth segType segTitle labelInfo)
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
	)

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
	       (str:capitalize-first-char segType) segTitle
	       )))
    
    (when (not (string-equal segType "part"))
      (insert
       (format "\
\\begin{comment}%s
%s  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]]  /%s/   %s ::  [[elisp:(org-cycle)][| ]]
\\end{comment}"
	       delimiterLinePerhaps
	       (make-string orgDepth ?*)
	       (str:capitalize-first-char segType) segTitle
	       )))
    
    (insert
     (format "
%s
\\%s{%s}"
	     newPagePerhaps
	     segType segTitle
	     ))
    
    (when (string-equal labelInfo "auto")
      (setq labelInfo (str:spacesElim segTitle)))

    (when (not (string-equal labelInfo "UnSpecified"))
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
		   (labelInfo (or (plist-get params :label) "UnSpecified"))
		   )
	       (when (blee:dblock:mode:disabledP dblockMode)
		 (blee:dblock:mode:disabledIndicate))
		 
	       (when (not (blee:dblock:mode:disabledP dblockMode))
		 (lcnt:latex:insertSegment ,orgDepth ,segType segTitle labelInfo)
		 )
	       ))
	   )
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex-part params) [[elisp:(org-cycle)][| ]]
  ")

;;(bx:lcnt:org-dblock-defun ":bx:dblock:lcnt:latex-part" "part" 1)


(defun org-dblock-write:bx:dblock:lcnt:latex-part (params)
  (let ((bx:disabledP (or (plist-get params :disabledP) "UnSpecified"))
	(bx:seg-title (or (plist-get params :seg-title) "missing")))
    (message (format "disabledP = %s" bx:disabledP))
    (if (not
	 (or (equal "TRUE" bx:disabledP)
	     (equal "true" bx:disabledP)))
	(progn
	  ;;; Processing Body

      (setq newPagePerhaps "\n\\newpage")
      (insert
       (format "\
\\begin{comment}%s
%s  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]]  *%s*   /%s/ ::  [[elisp:(org-cycle)][| ]]
\\end{comment}"
	       delimiterLinePerhaps
	       (make-string orgDepth ?*)
	       (str:capitalize-first-char segType) segTitle
	       )))
	  
	  
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

          (org-latex-section-insert-dblock-name "End-Of-Document")	  
	  
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

(defun org-latex-section-insert-dblock-name (name)
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


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "dblock-lcnt-latex"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide       :: Provide [[elisp:(org-cycle)][| ]]
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
