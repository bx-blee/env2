;;;
;;; This File Has Been Obsoleted
;;;

(require 'bx-lcnt-lib)

(defun org-dblock-write:bx:dblock:lcnt:warning-intro (params)
  (let ((bx:class (or (plist-get params :class) ""))
	(bx:langs (or (plist-get params :langs) "")))

    (bx:lcnt:info:base-read)
    ;;;(bxi:dblock-warning)

(lambda () "    
    (insert \"%{{{ DBLOCK-warning-intro
%%%   This is a ByStar Top Level LaTeX document.
%%%   It primarily is made of Dynamic Blocks (dblock).
%%%   If you are not familiar with how dblock works. STOP now.
%%%   WARNING: Any edits inside of a dblock will be overwritten.
%%%
%%%   Structure of a document is as follows:
%%%
%%%      - dblock:lcnt:warning-intro
%%%
%%%      - dblock:lcnt:header-begin
%%%      - dblock:lcnt:style-params
%%%      - dblock:lcnt:header-end
%%%
%%%      - dblock:lcnt:front-begin
%%%      - dblock:lcnt:copyright
%%%      - dblock:lcnt:front-end
%%%
%%%      - dblock:lcnt:main-begin
%%%        List of Inputs
%%%      - dblock:lcnt:main-end
%}}} DBLOCK-warning-intro\")
") 
    ))


;;;
;;; NOTYET, needs to become moded
(defun bxi:dblock-warning ()
  (insert "%%% Dynamic Block WARNING: Never edit directly inside a dblock. It will be overwritten. Edit the function.\n")
  )

(defun org-dblock-write:bx:dblock:lcnt:header-begin (params)
  (let ((bx:class (or (plist-get params :class) ""))
	(bx:langs (or (plist-get params :langs) "")))
    (bx:lcnt:info:base-read)
    (insert "%{{{ DBLOCK-header-begin\n")

    (when (equal bx:class "memo")
      (when (or (equal bx:langs "en")
		(equal bx:langs "en+fa"))
	(insert "
\\documentclass{article}

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
      (when (equal bx:langs "fa+en")
	(insert "
\\documentclass{article}

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
% \\usepackage{xltxtra}  % For ubuntu-2004
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

    (when (or (equal bx:class "art+pres")
	      (equal bx:class "art"))

      (when (or (equal bx:langs "en")
		(equal bx:langs "en+fa"))
	(insert "
\\documentclass{article}

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
      (when (equal bx:langs "fa+en")
	(insert "
\\documentclass{article}
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

      (when  (or (equal bx:langs "en")
		 (equal bx:langs "en+fa"))
	(insert "

\\usepackage{comment}

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
% \\usepackage{xltxtra}
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


    (when (equal bx:class "art+pres")
      (insert "
\\usepackage{beamerarticle}
\\usepackage{bidi}

"))

    ;;; This RCS Stuff needs to be cleaned up or eliminated
    (when (or (equal bx:class "art+pres")
	      (equal bx:class "art"))

      ;;; ENGLISH
      (when (equal bx:langs "en")
	(insert "
\\begin{latexonly}
\\def\\RcsEmptyValue{$\\rm \\langle Unknown \\rangle$}
\\RCSdef $Revision: 1.17 $
\\RCSdef $Date: 2017-01-21 23:55:32 $
\\RCSdef $Source: /cvsd/rep1/profile/intra/employee/lisp/dblock/dblock-lcnt-latex-front.el,v $
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
\\nonstopmode

\\documentclass[ignorenonframetext]{beamer}\n")
	)
      
      ;;; FARSI
      (when (equal bx:langs "fa+en")
	(insert "
\\documentclass[ignorenonframetext]{bidibeamer}

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

    (insert "%}}} DBLOCK-header-begin")
    ))

(defun org-dblock-write:bx:dblock:lcnt:style-params (params)
  (let ((bx:class (or (plist-get params :class) ""))
	(bx:langs (or (plist-get params :langs) "")))
    (bx:lcnt:info:base-read)
    (insert "\
\\begin{comment}
*  [[elisp:(org-cycle)][| ]]  *DBLK: style-params*                                       :: [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]]  [[elisp:(org-cycle)][| ]]
\\end{comment}\n")


    (when (or 
	   (equal bx:class "art+pres")
	   (equal bx:class "art")
	   (equal bx:class "memo")
	   )
      (insert "% ===== STYLE PARAMETERS =====

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
	)

      (when (equal bx:langs "fa+en")
	(insert "
\\mode<presentation>
{
  \\usetheme{Warsaw}
}
")
	)
      )
    %%%(insert "%}}} DBLOCK-style-params")
    ))


(defun org-dblock-write:bx:dblock:lcnt:header-end (params)
  (let ((bx:class (or (plist-get params :class) ""))
	(bx:langs (or (plist-get params :langs) "")))
    (bx:lcnt:info:base-read)
    (insert "%{{{ DBLOCK-header-end\n")

    (when (equal bx:class "memo")
      (insert "
\\begin{document}
")
      )


    (when (or (equal bx:class "art+pres")
	      (equal bx:class "art"))
      ;;; ENGLISH
      (when (equal bx:langs "en")
	(insert "
\\begin{document}\\ifpdf\\DeclareGraphicsExtensions{.pdf,.jpg,.png}\\else\\DeclareGraphicsExtensions{.eps,.epsi,.ps,.pdf}\\fi
")
	)

      (when (equal bx:langs "en+fa")
	(insert "
\\begin{document}
")
	)

      (when (equal bx:langs "fa+en")
	(insert "
\\begin{document}
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
\\usepackage{fontspec}
% \\usepackage{xltxtra}
\\usepackage{xunicode}
\\usepackage{bidi}

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
      (insert "\\begin{document}\n")
      )
    (insert "%}}} DBLOCK-header-end")
    ))

(defun org-dblock-write:bx:dblock:lcnt:front-begin (params)
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
    ;;;(insert "%{{{ DBLOCK-front-begin\n")
    (insert "\
\\begin{comment}
*  [[elisp:(org-cycle)][| ]]  *DBLK: front-begin*                                       :: [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]]  [[elisp:(org-cycle)][| ]]
\\end{comment}\n")
    

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

\\vspace{0.5in}
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
      (insert "\\mode<all>\n")
      (insert (format "
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
      )

    ;;;(insert "%}}} DBLOCK-front-begin")
    ))


(defun org-dblock-write:bx:dblock:lcnt:copyright (params)
  (let ((bx:class (or (plist-get params :class) ""))
	(bx:langs (or (plist-get params :langs) ""))
	(bx:form (or (plist-get params :form) ""))    ;; std, or std-en-fa NOTYET
	(lcnt-authorName1 (get 'bx:lcnt:info:base 'authorName1))
	)
    (bx:lcnt:info:base-read)
    ;;;(insert "%{{{ DBLOCK-copyright\n")
    (insert "\
\\begin{comment}
*  [[elisp:(org-cycle)][| ]]  *DBLK: copyright*                                       :: [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]]  [[elisp:(org-cycle)][| ]]
\\end{comment}\n")
    

    (when (or (equal bx:class "art+pres")
	      (equal bx:class "art"))
      (when (or (equal bx:langs "en")
		(equal bx:langs "en+fa"))
	(insert (format "\\vspace{0.4in}

{\\bf Copyright} \\copyright \\space  {\\bf  2014 %s}
" lcnt-authorName1))

	(insert "\\vspace{0.1in}

Permission is granted to make and distribute complete (not partial)\\\\
verbatim copies of this document provided that the copyright notice\\\\
and this permission notice are preserved on all copies.
")
	)
      (when (equal bx:langs "fa+en")
	(insert (format "\\vspace{0.4in}
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

    ;;;(insert "%}}} DBLOCK-copyright")
    ))


(defun org-dblock-write:bx:dblock:lcnt:front-end (params)
  (let ((bx:class (or (plist-get params :class) ""))
	(bx:langs (or (plist-get params :langs) "")))
    (bx:lcnt:info:base-read)
    ;;;(insert "%{{{ DBLOCK-frontend\n")
    (insert "\
\\begin{comment}
*  [[elisp:(org-cycle)][| ]]  *DBLK: front-end*                                       :: [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]]  [[elisp:(org-cycle)][| ]]
\\end{comment}\n")

    (when (or (equal bx:class "art+pres")
	      (equal bx:class "art"))
      (insert "\\clearpage

\\pagenumbering{roman}
\\setcounter{page}{2}

\\bigskip

\\tableofcontents
%\\listoftables
\\listoffigures
")
      )

    (when (or (equal bx:class "pres+art")
	      (equal bx:class "pres"))
      (when (or (equal bx:langs "en")
		(equal bx:langs "en+fa"))
	(insert "\\bibliographystyle{plain}

\\begin{frame}
  \\titlepage
\\end{frame}
")
	)

      (when (equal bx:langs "fa+en")
	(insert "\\bibliographystyle{plain}

\\begin{frame}
  \\titlepage
\\end{frame}
")
	)
      )

    ;;;(insert "%}}} DBLOCK-front-end")
    ))


(defun org-dblock-write:bx:dblock:lcnt:main-begin (params)
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
    (insert "\
\\begin{comment}
*  [[elisp:(org-cycle)][| ]]  *DBLK: main-begin*                                       :: [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]]  [[elisp:(org-cycle)][| ]]
\\end{comment}\n") 
    

    (when (equal bx:class "memo")
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

\\clearpage

\\pagenumbering{arabic}
")
      )

    (when (or (equal bx:class "pres+art")
	      (equal bx:class "pres"))
      (insert "% dblock for pres is empty\n"))

    ;;;(insert "%}}} DBLOCK-main-begin")
    ))


(defun org-dblock-write:bx:dblock:lcnt:main-end (params)
  (let ((bx:class (or (plist-get params :class) ""))
	(bx:langs (or (plist-get params :langs) "")))
    (bx:lcnt:info:base-read)
    ;;;(insert "%{{{ DBLOCK-main-end\n")
    (insert "\
\\begin{comment}
*  [[elisp:(org-cycle)][| ]]  *DBLK: main-end*                                       :: [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]]  [[elisp:(org-cycle)][| ]]
\\end{comment}\n")
    

    (when (equal bx:class "memo")
      (insert "
\\end{document}
")
      )

    (when (or (equal bx:class "art+pres")
	      (equal bx:class "art"))
      (insert "
%\\bibliography{/usr/local/lib/bib/gnu,/usr/local/lib/bib/networking,/usr/local/lib/bib/nedadoc,/usr/local/lib/bib/rfcs,/lcnt/outputs/all/plpc}
\\bibliography{/lcnt/outputs/all/plpcUrl,/usr/local/lib/bib/rfcs} 

\\end{document}
")
      )

    (when (or (equal bx:class "pres+art")
	      (equal bx:class "pres"))
      (insert "
\\bibliography{/lcnt/outputs/all/plpcUrl,/usr/local/lib/bib/rfcs} 

\\end{document}
")
      )

    ;;;(insert "%}}} DBLOCK-main-end")
    ))

;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "dblock-lcnt-latex-front"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'dblock-lcnt-latex-front)
;;;#+END:
