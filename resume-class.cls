\ProvidesClass{resume-class}[2016/04/09 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
\PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{000000}
\definecolor{gray}{HTML}{000000}
\definecolor{lightgray}{HTML}{000000}

\definecolor{green}{HTML}{000000}
\definecolor{orange}{HTML}{000000}
\definecolor{purple}{HTML}{000000}
\definecolor{red}{HTML}{000000}
\definecolor{blue}{HTML}{000000}

\ifdefined\@cv@print
\colorlet{green}{black}
\colorlet{orange}{black}
\colorlet{purple}{black}
\colorlet{red}{black}
\colorlet{blue}{black}
\colorlet{fillheader}{black}
\colorlet{header}{black}
\else
\colorlet{fillheader}{white}
\colorlet{header}{black}
\fi
\colorlet{textcolor}{black}
\colorlet{headercolor}{black}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}

\defaultfontfeatures{Mapping=tex-text}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{
\selectfont
\Large
\color{white}
}

\newcommand{\header}[3]{
\begin{tikzpicture}[remember picture,overlay]
  \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=2cm] (box) at (8.8cm, 45pt){};
  \node [anchor=north] (name) at (box.north) {
    \color{header}
    \Huge #1
  };
  \node [anchor=north] at (8.8cm, 5pt) { % second number adjusts the height of #2 in the box
    \color{header}
    \large #2
  };
  \node [anchor=north] at (box.south) {
    \color{header}
    \large #3
  };
\end{tikzpicture}
\vspace{1.5cm}
\vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{ColorCounter}
\newcommand\Color{
  \color{
      \ifcase\value{ColorCounter}
      blue\or
      orange\or
      green\or
      purple\or
      red\else
      brown
     \fi
  }
}

\renewcommand{\section}[1]{
\par\vspace{\parskip}
{
  \LARGE\Color #1
}
\par\vspace{\parskip}
\stepcounter{ColorCounter}
}

\renewcommand{\subsection}[1]{
\par\vspace{.5\parskip}
{
  \large\Color #1
}
\par\vspace{.25\parskip}
}

\pagestyle{empty}

%%%%%%%%%%%%%%%%%%%%%
% List environment  %
%%%%%%%%%%%%%%%%%%%%%
% Entry Sections:   %
% 1) Date           %
% 2) Title          %
% 3) Place of work  %
% 4) Info about Job %
%%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{
    \end{tabular*}
}

\renewcommand{\bfseries}{\Large}
\newcommand{\entry}[4]{
    #1&\parbox[t]{14cm}{
        \textbf{#2}
        \hfill
        {\normalsize #3}\\
        #4\vspace{\parsep}
        \vspace{0.25cm}
    }
\\}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=2cm,top=2cm,right=1.5cm,bottom=1.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}