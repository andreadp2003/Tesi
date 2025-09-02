\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesPackage{comandi}[2023/11/06 v2.0 Tesi - DIA-Uniroma3]

\LoadClass[a4paper, 12pt, oneside, italian]{memoir}

% Si utilizza la sillabazione italiana
\RequirePackage[italian]{babel}
% Load graphicx
\RequirePackage{graphicx}
% Line spacing
\RequirePackage{setspace}

% pacchetti per i font
\usepackage[T1]{fontenc}
% interlinea
\linespread{1.4}
% margini (la dimensione del blocco di testo viene regolata di conseguenza)
\setlrmarginsandblock{3cm}{3cm}{*}
\checkandfixthelayout
% profondità dell'indice (settato per stampare fino alle sottosezioni)
\setcounter{tocdepth}{3}
% numera parti, capitoli, sezioni, sottosezioni e sotto-sottosezioni
\maxsecnumdepth{none}
\setsecnumdepth{none}

\pagestyle{ruled}
% intestazioni con titolo (senza numero)
\makeevenhead{ruled}{\textbf{\leftmark}}{}{}
\makeoddhead{ruled}{\textbf{\leftmark}}{}{}
% numero di pagina solo in basso al centro
\makeevenfoot{ruled}{}{\thepage}{}
\makeoddfoot{ruled}{}{\thepage}{}

\usepackage{adjustbox}

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
   \addcontentsline{toc}{chapter}{Ringraziamenti}
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

\let \OldBib \bibliography
\renewcommand{\bibliography}[1]{
   \newpage
   \markboth{Bibliografia}{Bibliografia}
   \OldBib{#1}
}
\bibliographystyle{unsrturl}

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
