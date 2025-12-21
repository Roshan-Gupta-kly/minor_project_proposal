% THAPATHALI CAMPUS ENGINEERING report CLASS
% PLEASE DO NOT MODIFY THIS FILE DIRECTLY.
% Version: 1.0
% Date: December 15, 2025
% Description: IEEE-compliant report class for Thapathali Campus
%              engineering programs with modern typography and
%              consistent formatting standards.
% Designed by Krishna Acharya (THA078BEI020)
% krishna@tcioe.edu.np

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thapathaliece}[2025/12/15 Thapathali CE report Class]

% CLASS OPTIONS
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\ProcessOptions\relax

% Load base class with default options
\LoadClass[%
    fontsize=12pt,
    a4paper,
    oneside,
    captions=tableheading,
    listof=totoc,
    listof=flat,
    listof=nochaptergap,
    bibliography=totoc,
    parskip=false  % Disable KOMA's paragraph spacing adjustments
]{scrreprt}

% ESSENTIAL PACKAGES
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[american]{babel}
\RequirePackage{xspace}
\RequirePackage{amsmath, amsfonts}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{newtxtext,newtxmath}  % Times-like fonts for IEEE compliance

% GEOMETRY
\RequirePackage[a4paper, left=1.25in, right=1in, top=1in, bottom=1in]{geometry}

% VISUAL ELEMENTS
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{cite}
\RequirePackage[labelfont=bf,textfont=it]{caption}
\RequirePackage{subcaption}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{multirow}
\RequirePackage{listings}
\RequirePackage{siunitx}
\RequirePackage{float}
\RequirePackage{pdfpages}
\RequirePackage{standalone}

% LISTS
\RequirePackage{enumitem}
\setlist[itemize]{topsep=3pt,itemsep=0pt,parsep=2pt,leftmargin=*}
\setlist[enumerate]{topsep=3pt,itemsep=0pt,parsep=2pt,leftmargin=*}
\setlist[description]{topsep=3pt,itemsep=0pt,parsep=2pt}

% ALGORITHMS AND THEOREMS
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\RequirePackage{algorithmicx}
\RequirePackage{scrhack}

% SPACING - Must load AFTER scrhack (which loads setspaceenhanced)
\RequirePackage{setspace}
\onehalfspacing  % Apply 1.5 line spacing globally

% Override KOMA-Script's automatic single spacing in TOC, LOF, LOT
\AfterTOCHead{\onehalfspacing}
\AfterStartingTOC{\onehalfspacing}

\theoremstyle{plain}
\newtheorem{theorem}{Theorem}[section]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{corollary}[theorem]{Corollary}

\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{example}[theorem]{Example}

\theoremstyle{remark}
\newtheorem{remark}[theorem]{Remark}
\newtheorem{note}[theorem]{Note}

% GLOSSARIES
\RequirePackage[acronym,symbols,nomain,nonumberlist,nopostdot,translate=false,nogroupskip]{glossaries}
\makeglossaries

% Custom glossary style with uniform spacing
\newglossarystyle{uniformlist}{%
    \setglossarystyle{long}% base this style on the long style
    \renewenvironment{theglossary}%
    {\renewcommand{\arraystretch}{1.3}%
        \begin{longtable}{@{}p{0.15\textwidth}p{0.75\textwidth}@{}}}%
            {\end{longtable}}%
    \renewcommand*{\glossaryheader}{}%
    \renewcommand*{\glsgroupheading}[1]{}%
    \renewcommand*{\glsgroupskip}{}%
    \renewcommand{\glossentry}[2]{%
        \glsentryitem{##1}\glstarget{##1}{\glossentryname{##1}} &
        \glossentrydesc{##1}\tabularnewline[2pt]
    }%
    \renewcommand*{\subglossentry}[3]{%
        & \glssubentryitem{##2}%
        \glstarget{##2}{\strut}\glossentrydesc{##2}\tabularnewline[2pt]
    }%
}

% Set the style for acronyms
\setglossarystyle{uniformlist}

% HYPERREF (load late in package chain)
% Use hidelinks option to hide link borders (can be overridden in document)
\RequirePackage{url}
\RequirePackage[hidelinks]{hyperref}
\hypersetup{
    colorlinks=false,
    linkcolor=black,
    citecolor=black,
    urlcolor=blue,
    filecolor=black,
    anchorcolor=black,
    menucolor=black,
    runcolor=black,
    bookmarksnumbered=true,
    pdfstartview={FitH},
    breaklinks=true,
    pdftitle={Thapathali Campus Engineering report},
    pdfauthor={},
    pdfsubject={Engineering report},
    pdfkeywords={LaTeX, IEEE, report, engineering}
}
\urlstyle{tt}

% CLEVEREF (load after hyperref)
\RequirePackage[capitalize,noabbrev,nameinlink]{cleveref}

% IEEE-style cleveref configuration
\crefname{figure}{Fig.}{Figs.}
\Crefname{figure}{Figure}{Figures}
\crefname{table}{Table}{Tables}
\Crefname{table}{Table}{Tables}
\crefname{equation}{Eq.}{Eqs.}
\Crefname{equation}{Equation}{Equations}
\crefname{section}{Section}{Sections}
\Crefname{section}{Section}{Sections}
\crefname{chapter}{Chapter}{Chapters}
\Crefname{chapter}{Chapter}{Chapters}
\crefname{algorithm}{Algorithm}{Algorithms}
\Crefname{algorithm}{Algorithm}{Algorithms}

% IEEE FORMATTING SETTINGS
% Math preferences
\allowdisplaybreaks[4]
\interdisplaylinepenalty=2500

% Caption configuration
\captionsetup{font=small}
% Note: Table caption position handled by captions=tableheading in KOMA options

% Bibliography heading
\renewcommand{\bibname}{REFERENCES}

% List title renaming (IEEE uppercase style)
\renewcommand{\contentsname}{TABLE OF CONTENTS}
\renewcommand{\listfigurename}{LIST OF FIGURES}
\renewcommand{\listtablename}{LIST OF TABLES}
\renewcommand{\listalgorithmname}{LIST OF ALGORITHMS}

% Table formatting - IEEE style with booktabs
\setlength{\heavyrulewidth}{0.08em}
\setlength{\lightrulewidth}{0.05em}
\setlength{\aboverulesep}{0.4ex}
\setlength{\belowrulesep}{0.4ex}
% Note: \tabcolsep uses LaTeX default (6pt) for automatic column spacing

% Chapter/Section formatting - IEEE style with sans serif headings
\setkomafont{chapter}{\sffamily\huge\bfseries}
\addtokomafont{chapter}{\MakeUppercase}
\renewcommand*{\chapterformat}{\thechapter\autodot\enskip}
\setkomafont{section}{\sffamily\Large\bfseries}
\renewcommand*{\sectionformat}{\thesection\autodot\enskip}
\setkomafont{subsection}{\sffamily\large\bfseries}
\renewcommand*{\subsectionformat}{\thesubsection\autodot\enskip}
\setkomafont{subsubsection}{\sffamily\normalsize\bfseries}
\renewcommand*{\subsubsectionformat}{\thesubsubsection\autodot\enskip}

% Section spacing
\RedeclareSectionCommand[beforeskip=3.5ex plus 1ex minus .2ex, afterskip=2.3ex plus .2ex]{section}
\RedeclareSectionCommand[beforeskip=3.25ex plus 1ex minus .2ex, afterskip=1.5ex plus .2ex]{subsection}
\RedeclareSectionCommand[beforeskip=3.25ex plus 1ex minus .2ex, afterskip=1.5ex plus .2ex]{subsubsection}

% Numbering formats (IEEE: Figure 1.1, Table 1.1, Equation (1.1))
% Note: Counter reset per chapter is automatic in scrreprt
\renewcommand\thefigure{\thechapter.\arabic{figure}}
\renewcommand\thetable{\thechapter.\arabic{table}}
\renewcommand{\theequation}{\thechapter.\arabic{equation}}

% Code listings
\lstset{
    basicstyle=\ttfamily\small,
    breaklines=true,
    numbers=left,
    numberstyle=\tiny\color{gray},
    frame=single,
    captionpos=b,
    commentstyle=\color{green!50!black},
    keywordstyle=\color{blue},
    stringstyle=\color{red!70!black},
    showstringspaces=false,
    tabsize=4,
    xleftmargin=2em,
    framexleftmargin=1.5em
}

% CUSTOM COMMANDS
% =============================================================================
% CROSS-REFERENCING: Use cleveref package (\cref and \Cref)
% =============================================================================
% Instead of manual \ref, use \cref{label} or \Cref{label} for automatic
% formatting with proper names and hyperlinks.
%
% LABEL NAMING CONVENTIONS:
%   \label{fig:name}   - for figures
%   \label{tab:name}   - for tables
%   \label{eq:name}    - for equations
%   \label{alg:name}   - for algorithms
%   \label{sec:name}   - for sections
%   \label{chap:name}  - for chapters
%
% USAGE EXAMPLES:
%   \cref{fig:architecture}     → "Fig. 1"
%   \Cref{fig:architecture}     → "Figure 1"
%   \cref{tab:results,eq:loss}  → "Table 1 and Eq. 2"
%   \cref{sec:method}           → "Section 3"
% =============================================================================

% Math operators
\DeclareMathOperator*{\argmax}{arg\,max}
\DeclareMathOperator*{\argmin}{arg\,min}

% IEEE notation helpers
\newcommand{\set}[1]{\mathcal{#1}}
\newcommand{\vect}[1]{\mathbf{#1}}
\newcommand{\matr}[1]{\mathbf{#1}}

% IEEE abbreviations
\newcommand{\ie}{i.e.,\xspace}
\newcommand{\eg}{e.g.,\xspace}
\newcommand{\etc}{etc.\xspace}
\newcommand{\etal}{et~al.\xspace}
\newcommand{\vs}{vs.\xspace}

% Path helpers
\newcommand{\vectorpath}{src/images/diagrams}
\newcommand{\imgpath}{src/images/figures}

% DYNAMIC AUTHOR MANAGEMENT (1-4 authors supported)
% Supports 1, 2, 3, or 4 authors automatically
% Define only what you need in vars.tex, leave others empty
% Author I is required (minimum 1 author), II/III/IV are optional

\newcommand{\cSubmittedI}{}
\newcommand{\cSubmittedII}{}
\newcommand{\cSubmittedIII}{}
\newcommand{\cSubmittedIV}{}
\newcommand{\cSubmittedIRoll}{}
\newcommand{\cSubmittedIIRoll}{}
\newcommand{\cSubmittedIIIRoll}{}
\newcommand{\cSubmittedIVRoll}{}

% Dynamic author table - simple table format with left alignment
% Outputs: Name ~~ Roll in a table
\newcommand{\authorTable}{%
    \begin{tabular}{@{}ll@{}}
        \cSubmittedI   & ~~\cSubmittedIRoll   \\
        \ifx\cSubmittedII\@empty\else
        \cSubmittedII  & ~~\cSubmittedIIRoll  \\
        \fi
        \ifx\cSubmittedIII\@empty\else
        \cSubmittedIII & ~~\cSubmittedIIIRoll \\
        \fi
        \ifx\cSubmittedIV\@empty\else
        \cSubmittedIV  & ~~\cSubmittedIVRoll  \\
        \fi
    \end{tabular}%
}

% Dynamic comma-separated author list
\newcommand{\authorList}{%
    \cSubmittedI%
    \ifx\cSubmittedII\@empty\else, \cSubmittedII\fi%
    \ifx\cSubmittedIII\@empty\else, \cSubmittedIII\fi%
    \ifx\cSubmittedIV\@empty\else, \cSubmittedIV\fi%
}


\endinput
