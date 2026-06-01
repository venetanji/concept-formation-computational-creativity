% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "Dissertate.cls",
%     version         = "2.0",
%     date            = "25 March 2014",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, Dissertate",
%     supported       = "Send email to suchow@post.harvard.edu.",
%     docstring       = "Class for a dissertation."
% --------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Dissertate}[2014/03/25 v2.0 Dissertate Class]
\LoadClass[12pt, oneside, letterpaper]{book}

%
% Options
%
\RequirePackage{etoolbox}
\RequirePackage[bottom]{footmisc}

\RequirePackage{listings}
\RequirePackage{longtable}
\RequirePackage{wrapfig}
\RequirePackage{float}
\RequirePackage{array}
\RequirePackage[hyperref=true, natbib=true,style=apa, backend=biber]{biblatex}
\RequirePackage{csquotes}
\addbibresource{references-biblatex.bib}
\DeclareFieldFormat{apacase}{#1}
\DeclareLanguageMapping{american}{american-apa}
\renewcommand{\cite}{\citet}

\DeclareFieldFormat{citehyperref}{%
  \DeclareFieldAlias{bibhyperref}{noformat}% Avoid nested links
  \bibhyperref{#1}}


\savebibmacro{cite}


\renewbibmacro*{cite}{%
  \printtext[citehyperref]{%
    \restorebibmacro{cite}%
    \usebibmacro{cite}}}




\RequirePackage{afterpage}


\lstset{
basicstyle=\small\ttfamily,
columns=flexible,
breaklines=true
}


% Line spacing: dsingle/ddouble
%   Whether to use single- or doublespacing.
\newtoggle{DissertateSingleSpace}
\toggletrue{DissertateSingleSpace}
\DeclareOption{dsingle}{
    \toggletrue{DissertateSingleSpace}
    \ClassWarning{Dissertate}{Single-spaced mode on.}
}
\DeclareOption{ddouble}{\togglefalse{DissertateSingleSpace}}

\ProcessOptions\relax

% Line Spacing
%   Define two line spacings: one for the body, and one that is more compressed.
\iftoggle{DissertateSingleSpace}{
    \newcommand{\dnormalspacing}{1.2}
    \newcommand{\dcompressedspacing}{1.0}
}{
    \newcommand{\dnormalspacing}{2.0}
    \newcommand{\dcompressedspacing}{1.2}
}

% Block quote with compressed spacing
\let\oldquote\quote
\let\endoldquote\endquote
\renewenvironment{quote}
    {\begin{spacing}{\dcompressedspacing}\oldquote}
    {\endoldquote\end{spacing}}

% Itemize with compressed spacing
\let\olditemize\itemize
\let\endolditemize\enditemize
\renewenvironment{itemize}
    {\begin{spacing}{\dcompressedspacing}\olditemize}
    {\endolditemize\end{spacing}}

% Enumerate with compressed spacing
\let\oldenumerate\enumerate
\let\endoldenumerate\endenumerate
\renewenvironment{enumerate}
    {\begin{spacing}{\dcompressedspacing}\oldenumerate}
    {\endoldenumerate\end{spacing}}



% Text layout.
\RequirePackage[width=5.75in, a4paper]{geometry}
\usepackage{ragged2e}
\RaggedRight
\RequirePackage{graphicx}
\parindent 12pt
\RequirePackage{lettrine}
\RequirePackage{setspace}
\RequirePackage{verbatim}

% Fonts.
\RequirePackage{color}
\RequirePackage[table]{xcolor}
\usepackage{hyperref}
\RequirePackage{url}
\RequirePackage{tcolorbox}
\RequirePackage{tikz}
\arrayrulecolor{lightgray}
\arrayrulewidth=1pt
\setlength{\arrayrulewidth}{1pt}
\tcbuselibrary{breakable,skins}
\tcbset{enhanced,breakable,colback=red!5!white,
	boxrule=1pt,sharp corners,
	colback=lightgray!25!white,
	colframe=lightgray,fonttitle=\bfseries}

\renewcommand{\footnoterule}{%
  \kern -3pt
  \hbox{%
    \tikz \fill[left color=gray!50!white, right color=white]
        (0,0) rectangle (5in, 0.2pt);%
  }%
  \kern 2.6pt
  \vspace{2pt}
}

\newenvironment{mycolorbox}
	{\begin{spacing}{\dcompressedspacing}\begin{tcolorbox}[ drop lifted shadow ]}
	{\end{tcolorbox}\end{spacing}\vspace{5pt}}


\newenvironment{mycolorboxpar}
	{\begin{spacing}{\dcompressedspacing}\begin{tcolorbox}[ drop lifted shadow]}
	{\end{tcolorbox}\end{spacing}\vspace{5pt}}

\RequirePackage{amssymb}
\RequirePackage{mathspec}

\AtBeginEnvironment{tabular}{\addfontfeature{RawFeature=+tnum}}
\widowpenalty=300
\clubpenalty=300
%\setmainfont{EBGaramond-VariableFont_wght.ttf}
%\setromanfont[Numbers=OldStyle, Ligatures={Common, TeX}, Scale=1.0]{EBGaramond-VariableFont_wght.ttf}

\setromanfont{EBGaramond}[Extension = .ttf, Path = c:/users/giova/AppData/Local/Microsoft/Windows/Fonts/, UprightFont=*-VariableFont_wght, BoldFont=*-Bold, ItalicFont=*-Italic-VariableFont_wght, BoldItalicFont=*-BoldItalic]

\newfontfamily{\smallcaps}[RawFeature={+c2sc,+scmp}]{EBGaramond-VariableFont_wght.ttf}
\setsansfont[Scale=MatchLowercase, BoldFont={Lato Bold}]{Lato Regular}
\setmonofont[Scale=MatchLowercase]{SourceCodePro-VariableFont_wght.ttf}
\RequirePackage[labelfont={bf,sf,footnotesize,singlespacing},
                textfont={sf,footnotesize,singlespacing},
                justification={Justified},
                singlelinecheck=false,
                margin=0pt,
                figurewithin=chapter,
                tablewithin=chapter]{caption}
\renewcommand{\thefootnote}{\arabic{footnote}}
\RequirePackage{microtype}
\RequirePackage{enumitem}



% Headings and headers.
\RequirePackage{fancyhdr}
\RequirePackage[tiny, md, sc]{titlesec}
\setlength{\headheight}{15pt}
\pagestyle{plain}
\RequirePackage{titling}

% Front matter.
\setcounter{tocdepth}{1}
\usepackage[titles]{tocloft}
\usepackage[titletoc]{appendix}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapfont}{\normalsize \scshape}
\renewcommand\listfigurename{Listing of figures}
\renewcommand\listtablename{Listing of tables}

% Endmatter
\renewcommand{\setthesection}{\arabic{chapter}.A\arabic{section}}

% References.
\renewcommand\bibname{References}

\SetCiteCommand{\parencite}
%\renewcommand{\bibnumfmt}[1]{[#1]}
\RequirePackage[palatino]{quotchap}
\renewcommand*{\chapterheadstartvskip}{\vspace*{-0.5\baselineskip}}
\renewcommand*{\chapterheadendvskip}{\vspace{1.3\baselineskip}}

% An environment for paragraph-style section.
\providecommand\newthought[1]{%
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
   \noindent\textsc{#1}%
}

% Align reference numbers so that they do not cause an indent.
\newlength\mybibindent
\setlength\mybibindent{0pt}
\renewenvironment{thebibliography}[1]
    {\chapter*{\bibname}%
     \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
     \list{\@biblabel{\@arabic\c@enumiv}}
          {\settowidth\labelwidth{\@biblabel{999}}
           \leftmargin\labelwidth
            \advance\leftmargin\dimexpr\labelsep+\mybibindent\relax\itemindent-\mybibindent
           \@openbib@code
           \usecounter{enumiv}
           \let\p@enumiv\@empty
           \renewcommand\theenumiv{\@arabic\c@enumiv}}
     \sloppy
     \clubpenalty4000
     \@clubpenalty \clubpenalty
     \widowpenalty4000%
     \sfcode`\.\@m}
    {\def\@noitemerr
      {\@latex@warning{Empty `thebibliography' environment}}
     \endlist}

% Some definitions.
\def\advisor#1{\gdef\@advisor{#1}}
\def\coadvisorOne#1{\gdef\@coadvisorOne{#1}}
\def\coadvisorTwo#1{\gdef\@coadvisorTwo{#1}}
\def\committeeInternal#1{\gdef\@committeeInternal{#1}}
\def\committeeInternalOne#1{\gdef\@committeeInternalOne{#1}}
\def\committeeInternalTwo#1{\gdef\@committeeInternalTwo{#1}}
\def\committeeExternal#1{\gdef\@committeeExternal{#1}}
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degreeterm#1{\gdef\@degreeterm{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\department#1{\gdef\@department{#1}}
\def\field#1{\gdef\@field{#1}}
\def\university#1{\gdef\@university{#1}}
\def\universitycity#1{\gdef\@universitycity{#1}}
\def\universitystate#1{\gdef\@universitystate{#1}}
\def\programname#1{\gdef\@programname{#1}}
\def\pdOneName#1{\gdef\@pdOneName{#1}}
\def\pdOneSchool#1{\gdef\@pdOneSchool{#1}}
\def\pdOneYear#1{\gdef\@pdOneYear{#1}}
\def\pdTwoName#1{\gdef\@pdTwoName{#1}}
\def\pdTwoSchool#1{\gdef\@pdTwoSchool{#1}}
\def\pdTwoYear#1{\gdef\@pdTwoYear{#1}}
% School name and location
\university{The Hong Kong Polytechnic University}
\universitycity{Hong Kong}

% School color found from university's graphic identity site:
% http://isites.harvard.edu/icb/icb.do?keyword=k75408&pageid=icb.page392732
\definecolor{SchoolColor}{rgb}{0.6471, 0.1098, 0.1882} % Crimson
\definecolor{chaptergrey}{rgb}{0.6471, 0.1098, 0.1882} % for chapter numbers

\hypersetup{
    colorlinks,
    citecolor=SchoolColor,
    filecolor=black,
    linkcolor=black,
    urlcolor=SchoolColor,
}

% Formatting guidelines found in:
% http://www.gsas.harvard.edu/publications/form_of_the_phd_dissertation.php
\renewcommand{\frontmatter}{
	\input{frontmatter/personalize}
	\coverpage
	\maketitle
	\originality
	\dedicationpage
	% \copyrightpage
	\abstractpage
    \contentspage
	\listoffigures % optional
	\listoftables
	\abbreviations
	\acknowledgments
}

\renewcommand{\maketitle}{
    \pagenumbering{roman}
    \setcounter{page}{1}
	\thispagestyle{empty}
	\vspace*{\fill}
	\vspace{100pt}
	\begin{center}
	\Huge 
	\@university
	\vspace{30pt}
	School of \@department \\
	\vspace{100pt}
	\thetitle \\
	\vspace{30pt}
	\large
	\theauthor 
	\normalsize \\
	\vspace{100pt}
	A thesis submitted in partial fulfillment \\
	of the requirements for the degree of \\
	Doctor of Philosophy \\
	\vspace{12pt}
	April 2023
	\end{center} \vspace*{\fill}
}

\newcommand{\copyrightpage}{
	\newpage
	\thispagestyle{empty}
	\vspace*{\fill}
	\scshape \noindent \small \copyright \small 2014\hspace{3pt}-- \theauthor \\
	\noindent all rights reserved.
	\vspace*{\fill}
	\newpage
	\rm
}

\newcommand{\originality}{
	\newpage 
	\chapter*{Certificate of Originality}
	\thispagestyle{empty}
	\noindent \\
	\Large
	\doublespacing
	I hereby declare that this thesis is my own work and that, to the best of my knowledge and belief, it reproduces no material previously published or written, nor material that has been accepted for the award of any other degree or diploma, except where due acknowledgment has been made in the text.
	\normalsize  \\
	\singlespacing 
	\vspace{50pt}
	\begin{center}
	\includegraphics[width=0.5\textwidth]{figures/signature-transparent} \\
    \@author
	\end{center}
}

\newcommand{\coverpage}{
	\newpage
	\thispagestyle{empty}
	\begin{center}
	\vspace*{\fill}
	\Huge
	\MakeUppercase{\@title} \\
	\Large
	\vspace{20pt}
	\MakeUppercase{\@author} \\
	\vspace{250pt}
	PhD \\
	\vspace{20pt}
	\@university \\
	\vspace{20pt}
	\@degreeyear \\
	\vspace{50pt}
	\normalsize
	\vspace*{\fill}
	\end{center}
	\newpage
	\rm
}



\newcommand{\abstractpage}{
    \pdfbookmark{Abstract}{Abstract}
	\newpage
	\pagenumbering{roman}
	\setcounter{page}{5}
	\pagestyle{fancy}
	\lhead{Thesis advisor: \@advisor} \rhead{\@author}
	\renewcommand{\headrulewidth}{0.0pt}
	\vspace*{35pt}
	\begin{center}
    	\Large
		\textcolor{SchoolColor}{\@title} \normalsize \\
    	\vspace*{20pt}
    	\scshape Abstract \\ \rm
	\end{center}
    \begin{spacing}{1.2}
    	\input{frontmatter/abstract}
    \end{spacing}
	\vspace*{\fill}
	\newpage \lhead{} \rhead{}
	\cfoot{\thepage}
}

\newcommand{\contentspage}{
    \pdfbookmark{\contentsname}{Contents}
    \tableofcontents
}

\newcommand{\dedicationpage}{
    \cleardoublepage
    \phantomsection
    \pdfbookmark{Dedication}{Dedication}
	\newpage \thispagestyle{empty} \vspace*{\fill}
	\scshape \noindent \input{frontmatter/dedication}
	\vspace*{\fill} \newpage \rm
    \cleardoublepage
}

\newcommand{\abbreviations}{
	\newpage 
	\chapter*{Listing of Abbreviations}
    \begin{spacing}{1.0}
		\input{frontmatter/abbreviations}
	\end{spacing}


}

\newcommand{\acknowledgments}{
	\chapter*{Acknowledgments}
	\noindent
    \begin{spacing}{1.5}
    	\input{frontmatter/thanks}
    \end{spacing}
	\vspace*{\fill} \newpage
	\setcounter{page}{1}
	\pagenumbering{arabic}
}


\renewcommand{\backmatter}{
    \begin{appendices}
        \include{chapters/appendixA}
		\include{chapters/appendixB}
    \end{appendices}
    \input{endmatter/personalize}
    \clearpage
    \begin{spacing}{\dcompressedspacing}
		\cleardoublepage
		\addcontentsline{toc}{chapter}{References}
        \printbibliography[title=References]

        % \include{endmatter/colophon}
    \end{spacing}
}
