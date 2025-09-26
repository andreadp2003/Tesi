\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesPackage{comandi}[2023/11/06 v2.0 Tesi - DIA-Uniroma3]

\LoadClass[a4paper, 12pt, oneside, italian]{memoir}

\RequirePackage[italian]{babel}
\RequirePackage{graphicx}
\RequirePackage[utf8]{inputenc}

\newlength{\widefigextra}
\setlength{\widefigextra}{0.2\textwidth}

\newlength{\widefigwidth}
\setlength{\widefigwidth}{\dimexpr\textwidth + 2\widefigextra\relax}

\usepackage{xparse}
\NewDocumentCommand{\widefigure}{O{\widefigwidth} m m m}{%
   \begin{figure}[H]
   \centering
   \makebox[\textwidth][c]{%
      \includegraphics[width=#1]{#2}
   }
   \caption{#3}
   \label{#4}
   \end{figure}
}

\RequirePackage{setspace}
\RequirePackage{float} % <--- aggiunto per [H]

\usepackage[T1]{fontenc}

\linespread{1.4}
\setlrmarginsandblock{3cm}{3cm}{*}
\checkandfixthelayout
\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{-1}

\pagestyle{ruled}
% intestazioni con titolo (senza numero)
\makeevenhead{ruled}{\textbf{\leftmark}}{}{}
\makeoddhead{ruled}{\textbf{\leftmark}}{}{}
% numero di pagina solo in basso al centro
\makeevenfoot{ruled}{}{\thepage}{}
\makeoddfoot{ruled}{}{\thepage}{}

\usepackage{adjustbox}
\RequirePackage{chngcntr}             % <--- aggiunto: permette \counterwithout
\counterwithout{figure}{chapter}      % rimuove il reset del contatore figure ad ogni chapter
\counterwithout{figure}{section}      % rimuove il reset del contatore figure ad ogni section
\renewcommand{\thefigure}{\arabic{figure}} % numerazione globale: 1,2,3,...

\newcommand{\@annoAccademico}{}
\newcommand{\annoAccademico}[1]{\renewcommand{\@annoAccademico}{#1}}

\newcommand{\@autore}{}
\newcommand{\autore}[1]{\renewcommand{\@autore}{#1}}

\newcommand{\@titolo}{}
\newcommand{\titolo}[1]{\renewcommand{\@titolo}{#1}}

\newcommand{\@matricola}{}
\newcommand{\matricola}[1]{\renewcommand{\@matricola}{#1}}

\newcommand{\@relatore}{}
\newcommand{\relatore}[1]{\renewcommand{\@relatore}{#1}}

\newcommand{\@tutor}{}
\newcommand{\tutor}[1]{\renewcommand{\@tutor}{#1}}

\newcommand{\generaFrontespizio}{
   \thispagestyle{empty}
   \begin{center}
         \vspace{6mm}
         {\includegraphics[width=0.35\linewidth]{../figure/uniroma3-logo}} \\
         \vspace{5mm}
         {\LARGE Dipartimento di Ingegneria Civile, Informatica\\ e delle Tecnologie Aeronautiche} \\
         \vspace{4mm}
         {\Large Corso di Laurea in Ingegneria Informatica} \\
         \vspace{12mm}
         {\Huge \@titolo} \\
         \vspace{3mm}
         {\large Anno Accademico \@annoAccademico} \\
         \vspace{12mm}
         {\large Laureando \\ \textbf{\@autore} \\ Matricola \@matricola} \\
         \vspace{5mm}
         {\large Relatore \\ \textbf{\@relatore}} \\
         \vspace{5mm}
         {\large Tutor \\ \textbf{\@tutor}} \\
   \end{center}
   \newpage
}

% Comandi riguardanti l'inserimento di capitoli
\newcommand{\ringraziamenti}[1]{
   \newpage
   \chapter*{Ringraziamenti}
   \input{#1}
}

\newcommand{\introduzione}[1]{
   \newpage
   \chapter*{Introduzione}
   \markboth{Introduzione}{Introduzione}
   \addcontentsline{toc}{chapter}{Introduzione}
   \input{#1}
}

\newcommand{\conclusioni}[2][Conclusioni]{
   \newpage
   \chapter*{#1}
   \markboth{#1}{#1}
   \addcontentsline{toc}{chapter}{#1}
   \input{#2}
}

\newcommand{\capitolo}[1]{
   \newpage
   \input{#1}
}

\newcommand{\generaIndice}{
	\newpage
	\tableofcontents
	\clearpage
}

\RequirePackage[backref=page]{hyperref}
\renewcommand*{\backref}[1]{}
\renewcommand*{\backrefalt}[4]{
   \ifcase #1
      Nessuna citazione nel testo.
   \or
      Citato a pagina~#2.
   \else
      Citato alle pagine~#2.
   \fi
}

\renewcommand{\printchaptername}{}

\usepackage{tcolorbox}
\tcbuselibrary{listingsutf8,breakable}

\newtcolorbox{windowsconsole}[1][]{%
   colback=black!95!white,
   colframe=black,
   coltext=white,
   fontupper=\footnotesize\ttfamily\fontfamily{pcr}\selectfont,
   boxrule=0.5mm,
   arc=1mm,
   left=1mm,
   right=1mm,
   top=0.5mm,
   bottom=0.5mm,
   sharp corners,
   breakable,           % permette di andare su più pagine
   listing only,
   listing options={breaklines=true, basicstyle=\footnotesize\ttfamily}, % va a capo
   #1
}

\hbadness=10000    % non segnala più underfull hbox
\hfuzz=40pt        % ignora overfull hbox