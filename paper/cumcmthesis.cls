\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cumcmthesis}[2026/08/26 CUMCM 2026 competition paper class]

\LoadClass[12pt,a4paper]{article}

\RequirePackage{iftex}
\ifXeTeX\else
  \ClassError{cumcmthesis}{Please compile with XeLaTeX}{Use XeLaTeX, not pdfLaTeX.}
\fi

% -------------------- Chinese and Latin fonts --------------------
\RequirePackage[UTF8]{ctex}
\RequirePackage{fontspec}
\IfFontExistsTF{Times New Roman}{\setmainfont{Times New Roman}}{\setmainfont{Tinos}}
\setsansfont{Arimo}
\IfFontExistsTF{Noto Serif CJK SC}{\setCJKmainfont{Noto Serif CJK SC}}{}
\IfFontExistsTF{Noto Sans CJK SC}{\setCJKsansfont{Noto Sans CJK SC}}{}
\IfFontExistsTF{Noto Sans Mono CJK SC}{\setmonofont{Noto Sans Mono CJK SC}\setCJKmonofont{Noto Sans Mono CJK SC}}{\setmonofont{Latin Modern Mono}}

% -------------------- Official page constraints --------------------
\RequirePackage{geometry}
\geometry{a4paper,top=25mm,bottom=25mm,left=25mm,right=25mm}
\setlength{\parindent}{2em}
\setlength{\parskip}{0pt}
\linespread{1.32}
\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty=10000

% -------------------- Mathematics --------------------
\RequirePackage{amsmath,amssymb,bm,mathtools}
\RequirePackage{siunitx}
\sisetup{detect-all,per-mode=symbol,range-phrase=--,range-units=single}
\setlength{\abovedisplayskip}{8pt plus 2pt minus 3pt}
\setlength{\belowdisplayskip}{8pt plus 2pt minus 3pt}
\setlength{\abovedisplayshortskip}{5pt plus 2pt}
\setlength{\belowdisplayshortskip}{5pt plus 2pt minus 2pt}
\newenvironment{constraintset}{\left\{\begin{aligned}}{\end{aligned}\right.}

% -------------------- Figures and tables --------------------
\RequirePackage{graphicx}
\RequirePackage{booktabs,array,tabularx,longtable,multirow,threeparttable}
\RequirePackage{caption,subcaption}
\RequirePackage{float}
\RequirePackage{placeins}
\graphicspath{{figures/}{figure/}{images/}}
\DeclareGraphicsExtensions{.pdf,.png,.jpg,.jpeg}
\captionsetup{font=small,labelsep=quad,justification=centering,singlelinecheck=true}
\captionsetup[figure]{position=bottom,skip=5pt}
\captionsetup[table]{position=top,skip=5pt}
\renewcommand{\arraystretch}{1.20}
\setlength{\tabcolsep}{6pt}
\newcolumntype{Y}{>{\centering\arraybackslash}X}

% -------------------- Lists --------------------
\RequirePackage{enumitem}
\setlist{topsep=0.35em,itemsep=0.15em,parsep=0pt,partopsep=0pt,leftmargin=2em}

% -------------------- Headings --------------------
\RequirePackage{titlesec}
\setcounter{secnumdepth}{3}
\newif\ifcumcmappendix
\cumcmappendixfalse
\newcommand{\cumcmsectionlabel}{\ifcumcmappendix 附录\thesection\else\chinese{section}、\fi}
\titleformat{\section}{\centering\sffamily\bfseries\zihao{3}}{\cumcmsectionlabel}{0.35em}{}
\titleformat{\subsection}{\sffamily\bfseries\zihao{4}}{\thesubsection}{0.8em}{}
\titleformat{\subsubsection}{\sffamily\bfseries\zihao{-4}}{\thesubsubsection}{0.8em}{}
\titlespacing*{\section}{0pt}{1.6ex plus .4ex minus .2ex}{1.0ex plus .2ex}
\titlespacing*{\subsection}{0pt}{1.3ex plus .3ex minus .2ex}{0.7ex plus .2ex}
\titlespacing*{\subsubsection}{0pt}{1.1ex plus .2ex minus .2ex}{0.5ex plus .1ex}
\let\cumcmoldappendix\appendix
\renewcommand{\appendix}{\clearpage\cumcmoldappendix\cumcmappendixtrue}

% -------------------- Page number and hyperlinks --------------------
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\RequirePackage{hyperref}
\hypersetup{
  unicode=true,
  colorlinks=true,
  linkcolor=black,
  citecolor=black,
  urlcolor=black,
  pdfauthor={},
  pdfsubject={},
  pdfkeywords={}
}
\RequirePackage[nameinlink,noabbrev]{cleveref}
\crefname{figure}{图}{图}
\crefname{table}{表}{表}
\crefname{equation}{式}{式}
\crefname{section}{节}{节}
\crefname{subsection}{节}{节}

\newcommand{\formref}[1]{\hyperref[#1]{式~(\ref*{#1})}}
\newcommand{\sectionloc}[1]{\hyperref[#1]{\ref*{#1}}}
\newcommand{\symbolloc}[2]{\hyperref[#2]{\ref*{#1}，式~(\ref*{#2})}}

% -------------------- Anonymous title and abstract page --------------------
\makeatletter
\renewcommand{\maketitle}{%
  \setcounter{page}{1}%
  \thispagestyle{fancy}%
  \begin{center}
    {\sffamily\bfseries\zihao{-2}\@title\par}
  \end{center}
  \vspace{0.8em}
}
\makeatother
\renewenvironment{abstract}{%
  \begin{center}{\sffamily\bfseries\zihao{4} 摘要}\end{center}
  \vspace{-0.2em}
}{\par}
\newcommand{\keywords}[1]{%
  \par\vspace{0.8em}
  \noindent{\sffamily\bfseries 关键词：}#1\par
}
\newcommand{\keyresult}[1]{\textbf{#1}}

% -------------------- Proposition proof box --------------------
\RequirePackage[most]{tcolorbox}
\newtcolorbox{propositionbox}{
  enhanced jigsaw,
  breakable,
  colback=white,
  colframe=black!62,
  boxrule=0.45pt,
  sharp corners,
  arc=0pt,
  left=0.95em,
  right=0.95em,
  top=0.75em,
  bottom=0.75em,
  before skip=0.8em,
  after skip=0.8em
}
\newcommand{\proofend}{\unskip\nobreak\hfill\ensuremath{\square}}

% -------------------- Clean external-code insertion --------------------
\RequirePackage{xcolor}
\RequirePackage{fvextra}
\definecolor{cumcmgray}{gray}{0.55}
\definecolor{cumcmlightgray}{gray}{0.965}
\newcommand{\codefile}[2]{%
  \par\medskip
  \begin{tcolorbox}[
    enhanced jigsaw,
    breakable,
    colback=white,
    colframe=cumcmgray,
    colbacktitle=cumcmlightgray,
    coltitle=black,
    fonttitle=\sffamily\bfseries\small,
    title={#1},
    center title,
    titlerule=0.4pt,
    boxrule=0.4pt,
    sharp corners,
    arc=0pt,
    left=0.7em,
    right=0.5em,
    top=0.45em,
    bottom=0.45em,
    before skip=0.7em,
    after skip=0.8em
  ]
  \VerbatimInput[
    fontsize=\small,
    numbers=left,
    numbersep=7pt,
    frame=none,
    breaklines=true,
    breakanywhere=true,
    tabsize=4,
    showspaces=false,
    showtabs=false
  ]{#2}%
  \end{tcolorbox}
}

% -------------------- AI declaration --------------------
\newcommand{\AIUsageDeclaration}[1]{%
  \section*{AI工具使用声明}
  本参赛队在竞赛过程中使用了AI工具，主要用于#1，详细使用情况见支撑材料。
}
\newcommand{\NoAIUsageDeclaration}{%
  \section*{AI工具使用声明}
  本参赛队在竞赛过程中未使用任何AI工具。
}

\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
\renewcommand{\refname}{参考文献}

\endinput
