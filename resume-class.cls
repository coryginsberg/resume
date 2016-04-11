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

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{666666}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{7AC943}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{CE2227}
\definecolor{blue}{HTML}{353D75}

\ifdefined\@cv@print
\colorlet{green}{gray}
\colorlet{orange}{gray}
\colorlet{purple}{gray}
\colorlet{red}{gray}
\colorlet{blue}{gray}
\colorlet{fillheader}{white}
\colorlet{header}{gray}
\else
\colorlet{fillheader}{red}
\colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

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

\newcommand{\header}[2]{%
\begin{tikzpicture}[remember picture,overlay]
  \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
  \node [anchor=center] (name) at (box) {
    \color{header}
    \Huge #1
  };
  \node [anchor=north] at (name.south) {
    \color{header}
    \large #2
  };
\end{tikzpicture}
\vspace{2.5cm}
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
      blue\or%
      orange\or%
      green\or%
      purple\or%
      red\or%
      brown\else%
      headercolor%
      \fi%
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
#1&\parbox[t]{10cm}{
  \textbf{#2}
  \hfill
{\normalsize #3}\\
#4\vspace{\parsep}
\vspace{0.25cm}
}\\}

%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}

\newenvironment{aside}{%
\let\oldsection\section
\renewcommand{\section}[1]{
\par\vspace{\baselineskip}{\Large\color{red} ##1}
}
\begin{textblock}{5.25}(0, 4.33)
\begin{flushright}
\obeycr
}{%
\restorecr
\end{flushright}
\end{textblock}
\let\section\oldsection
}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}