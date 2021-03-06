%% LaTeX2e class for diploma theses
%% Based on wissdoc.cls by Roland Bless, 1996-2001
%% bless@telematik.informatik.uni-karlsruhe.de
%%
%% Adapted by: Timo Rohrberg, 2009
%% timo.rohrberg@student.kit.edu
%%
%% Additions by: Thorsten Haberecht, IPD - Chair Prof. Böhm, 2010
%% thorsten.haberecht@kit.edu
%%
%% Additions of multiple classes: Denis Štogl, IAR-IPR Prof. Hein, 2017
%% denis.stogl@kit.edu
%% Some ideas taken from: SDQ-Version by Erik Burger (v1.3, Dezember 2016)
%%
%% Version: 0.3 (22.02.2018)


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{KITthesis}
  \def\dotfill#1{\cleaders\hbox to #1{.}\hfill}
\newcommand\dotline[2][.5em]{\leavevmode\hbox to #2{\dotfill{#1}\hfil}}


\newif\ifKITthesis@german
\newif\ifKITthesis@seminar
\newif\ifKITthesis@studien
\newif\ifKITthesis@bachelor
\newif\ifKITthesis@master
\newif\ifKITthesis@phd
\newif\ifKITthesis@thesis
\newif\ifKITthesis@techreport
\newif\ifKITthesis@final
\newif\ifKITthesis@declaration

\DeclareOption{german}{\KITthesis@germantrue}
\DeclareOption{ngerman}{\KITthesis@germantrue}

\DeclareOption{phd}{\KITthesis@phdtrue \KITthesis@thesistrue}

\ProcessOptions\relax

\newcommand{\thesistype}{}
\renewcommand{\thesistype}{\iflanguage{ngerman}{Doktorarbeit}{PhD Thesis}}


\usepackage[main=english,ngerman]{babel}


  \ifKITthesis@declaration
    \LoadClass[12pt,twoside,headsepline,a4paper,titlepage=firstiscover,DIV=15,BCOR=20mm]{scrbook}
	\renewcommand*{\coverpagetopmargin}{48mm}
% 	\renewcommand*{\coverpageleftmargin}{0mm}
	\renewcommand*{\coverpagerightmargin}{0mm}
	\renewcommand*{\coverpagebottommargin}{-10mm}
  \else
	\LoadClass[12pt,twoside,headsepline,a4paper,titlepage,DIV=15,BCOR=20mm]{scrbook}
  \fi

%% -----------------------
%% | Headers and footers |
%% -----------------------
\RequirePackage[automark,headsepline]{scrlayer-scrpage}

\clubpenalty=10000 %prevent orphans
\widowpenalty=10000 %prvent widows


%% ----------------------------------------
%% |         Setup of the document        |
%% ----------------------------------------
\input{Aux/KIT_document_setup}

%% -------------------------------
%% |         New commands        |
%% -------------------------------
\newcommand{\changefont}[3]{\fontfamily{#1} \fontseries{#2} \fontshape{#3} \selectfont}
%\renewcommand*{\headfont}{\slshape}
%\newcommand{\captionfont}{}
\newcommand{\chapterheadfont}{}
\newcommand{\blankpage}{
 \clearpage{\pagestyle{empty}\cleardoublepage}
}
%% --- End of New Commands ---



 \setcounter{secnumdepth}{3} % Numbering also for \subsubsections
\setcounter{tocdepth}{3}    % Register \subsubsections in content directory

\setpapersize{A4}
\setmarginsrb{2.5cm}{1cm}{1.5cm}{1cm}{6mm}{7mm}{5mm}{15mm}

\parindent 0cm                     % Do not indent beginning of paragraph
\parskip1.5ex plus0.5ex minus0.5ex % Margin between paragraphs


  \renewcommand{\part}[1]{}



%% ----------------------------------
%% |  Style of appendix numbering   |
%% ----------------------------------
% appendix
\RequirePackage[toc,title,header]{appendix}
\noappendicestocpagenum

 \renewcommand\appendix{\par
   \setcounter{section}{0}%
   \setcounter{subsection}{0}%
   \setcounter{figure}{0}%
   \setcounter{algorithm}{0}
   \renewcommand\thesection{\Alph{section}}%
   \renewcommand\thefigure{\Alph{section}.\arabic{figure}}
   \renewcommand\thetable{\Alph{section}.\arabic{table}}
  \renewcommand\thealgorithm{\Alph{section}.\arabic{algorithm}} }
%% --- End of appenix numbering style ---


%% ----------------------
%% | Title page options |
%% ----------------------
% Logos
\newcommand{\theinstitutelogo}{\iflanguage{ngerman}{KIT-Departments/IPRLogo_de}{KIT-Departments/IPRLogo_en}}
\newcommand{\institutelogo}[1]{\renewcommand{\theinstitutelogo}{#1}}
\newcommand{\printinstitutelogo}{\includegraphics[width=5cm,height=1.8cm,keepaspectratio]{Aux/Logos/\theinstitutelogo}}
\newcommand{\noinstitutelogo}{\renewcommand{\printinstitutelogo}{}}
\newcommand{\thegrouplogo}{KIT-Departments/iirob.png}
\newcommand{\grouplogo}[1]{\renewcommand{\thegrouplogo}{#1}}
\newcommand{\printgrouplogo}{~\\  \hspace*{\fill} \includegraphics[width=3cm,height=1.8cm,keepaspectratio]{Aux/Logos/\thegrouplogo}}
\newcommand{\nogrouplogo}{\renewcommand{\printgrouplogo}{}}

  \nogrouplogo

\titlehead{%

\newcommand{\diameter}{20}
\newcommand{\xone}{0}
\newcommand{\xtwo}{160}
\newcommand{\yone}{0}
\newcommand{\ytwo}{-253}

\iflanguage{ngerman}
{\begin{center}\includegraphics[height=1.8cm]{Aux/Logos/kitlogo_de_cmyk}\end{center}}
{\begin{center}\includegraphics[height=1.8cm]{Aux/Logos/kitlogo_de_cmyk}\end{center}}
\hfill

\printgrouplogo
\newcommand{\titlepreamble}{}

\ifthenelse{\equal{\titlepreamble}{}}
{}
{
  \begin{center}
    \vspace*{1cm}
    \Huge{
      {\changefont{phv}{m}{n}\selectfont \titlepreamble }
    }
  \end{center}
}
}

  \setkomafont{title}{\Huge\changefont{phv}{m}{n}}
  \setkomafont{subtitle}{\large\changefont{phv}{m}{n}}
  \setkomafont{author}{\huge\changefont{phv}{m}{n}}

% TODO: Add this for title??
\def\@author{}
\renewcommand{\author}[1]{\def\@author{#1}}

\newcommand{\theinstitute}{{ Institut für Angewandte und Numerische Mathematik (IANM)	 }}
\newcommand{\myinstitute}[1]{\renewcommand{\theinstitute}{#1}}

\newcommand{\theinstitutefaculty}{ {KIT-Fakult\"at f\"ur Mathematik}}
\newcommand{\KITfaculty}[1]{\renewcommand{\theinstitutefaculty}{#1}}

\newcommand{\theinstituteaddress}{Englerstraße 2}
\newcommand{\instituteaddress}[1]{\renewcommand{\theinstituteaddress}{#1}}

\newcommand{\theinstitutecity}{76131 Karlsruhe}
\newcommand{\institutecity}[1]{\renewcommand{\theinstitutecity}{#1}}

\newcommand{\thereviewerone}{}
\newcommand{\reviewerone}[1]{\renewcommand{\thereviewerone}{#1}}
\newcommand{\thereviewertwo}{}
\newcommand{\reviewertwo}[1]{\renewcommand{\thereviewertwo}{#1}}
\newcommand{\thereviewerthree}{}
\newcommand{\reviewerthree}[1]{\renewcommand{\thereviewerthree}{#1}}

\date{}

\newcommand{\theaddress}[1]{}
\newcommand{\address}[1]{\renewcommand{\theaddress}{#1}}
\newcommand{\thecity}[1]{}
\newcommand{\city}[1]{\renewcommand{\thecity}{#1}}
\newcommand{\theemail}[1]{}
\newcommand{\email}[1]{\renewcommand{\theemail}{#1}}

\newcommand{\thetitleotherlanguage}{}
\newcommand{\titleotherlanguage}[1]{\renewcommand{\thetitleotherlanguage}{#1}}
\newcommand{\thekeywords}{}
\newcommand{\keywords}[1]{\renewcommand{\thekeywords}{#1}}
\newcommand{\thekeywordsotherlanguge}{}
\newcommand{\keywordsotherlanguge}[1]{\renewcommand{\thekeywordsotherlanguge}{#1}}

%% Thesis type handling
\newcommand{\thethesistype}{}
\ifKITthesis@seminar
  \newcommand{\studyprogram}[1]{
      \subtitle{\vspace*{1cm}  \Large{\iflanguage{ngerman}{Seminararbeit von}{Seminar work of}}
      }
      \renewcommand{\thethesistype}{#1}
  }
\fi
\ifKITthesis@thesis
%   \newcommand{\studyprogram}[1]{\subtitle{\vspace*{1.5cm} \iflanguage{ngerman}{\thesistype\\ im Studiengang #1\\von}{\thesistype\\ in #1\\of}}
  \newcommand{\studyprogram}[1]{\subtitle{\vspace*{1cm} \iflanguage{ngerman}{\thesistype\\ ~\\von}{\thesistype\\ ~\\of}}
  \renewcommand{\thethesistype}{#1}}
\fi
\ifKITthesis@techreport
    \newcommand{\studyprogram}[1]{
      \ifx\@author\empty
      \else
	\subtitle{\vspace*{1.5cm} \iflanguage{ngerman}{geschrieben von}{written by}}
      \fi
    \renewcommand{\thethesistype}{#1}}
\fi

\newcommand{\settitle}{
  \publishers{
    {\changefont{phv}{m}{n}\selectfont
    \ifKITthesis@seminar
      \Large
    \else
      \large
    \fi
    

    \small{
    Zur Erlangung des akademischen Grades eines
    \\}
	\vspace{0.5cm}
    \Large{DOKTORS DER NATURWISSENSCHAFTEN     }
	\\
	\vspace{0.5cm}
	\small{
    von der KIT-Fakultät für Mathematik des \\
    Karlsruher Instituts für Technologie (KIT) \\
    genehmigte 
    \\}
	\vspace{0.5cm}
    \Large{DISSERTATION}
    \\
    \vspace{0.5cm}
    \small{von} \\
    \vspace{0.5cm}
\Large{\yournameTitle}
	


    
    

    \ifKITthesis@declaration \vspace*{1cm} \else \vspace*{1cm} \fi

    \begin{tabular}{l c l}
     
      \ifKITthesis@thesis
	\ifthenelse{\equal{\thereviewertwo}{}}{
		\iflanguage{ngerman}{Gutachter}{Tag der mündlichen Prüfung}: & \hfill  &\yourdateTitle\\
	  \iflanguage{ngerman}{Gutachter}{Reviewer}: & \hfill  & \thereviewerone \\
	}{
	\iflanguage{ngerman}{Gutachter}{Tag der mündlichen Prüfung}: & \hfill  & \yourdateTitle\\
	{ }\iflanguage{ngerman}{Erstgutachter}{Erstgutachter}: & \hfill & \thereviewerone \\
	  { }\iflanguage{ngerman}{Zweitgutachterin}{Zweitgutachterin}: & \hfill & \thereviewertwo \\
	  { }\iflanguage{ngerman}{Drittgutachter}{Drittgutachter}: & \hfill & \thereviewerthree \\
}
      \fi
    \end{tabular}

	\ifKITthesis@declaration \vspace{1cm} \else \vspace{4cm} \fi
	  \pagenumbering{roman}
	\newpage 
	${}$
	\thispagestyle{empty}
	\newpage 
	${}$
	\thispagestyle{empty}
		  \pagenumbering{roman}
	\vfill
  

  \begin{minipage}{\textwidth}
  	\normalsize{
  		%\hbox to \textwidth{\hrulefill}
  		\par\vspace{0.2cm}
  		\iflanguage{ngerman}
  	
  		{Ich versichere wahrheitsgem\"a\ss, die Arbeit selbstst\"andig angefertigt, alle benutzten Hilfsmittel vollst\"andig und genau angegeben und alles kenntlich gemacht zu haben, was aus Arbeiten anderer unver\"andert oder mit Ab\"anderungen entnommen wurde.}
  
  		\vspace{1cm}
  		
  			{I declare that I have developed and written the enclosed thesis completely by myself, and have not used sources or means without declaration in the text.}
  		
  		\vspace{0.4cm}

  		\vspace{2cm}
  		
  		\dotline{6.1cm}\hspace*{2.0cm}\\
  		\hspace*{0cm}\yournameDeclaration%center name with hspace
  		
  		{\yourplaceDeclaration, \yourdateDeclaration} 
  		
  	}
  \end{minipage}
    }
  }
}

\newcommand{\includetitle}{\maketitle \ifKITthesis@declaration \stop \fi}

%% ------------
%% | Todos    |
%% ------------

\newcommand{\includelistoftodos}{}
\renewcommand{\includelistoftodos}{\ifKITthesis@final \else \newpage \listoftodos \newpage \fi}

\newcommand{\includedeclaration}{}
\ifKITthesis@techreport
  \thispagestyle{empty}
  \pagebreak
\else
    \renewcommand{\includedeclaration}{\input{Aux/0-Declaration.tex}\blankpage}
\fi

%% ------------
%% | Abstract |
%% ------------
\newcommand{\includeabstract}{}

\ifKITthesis@techreport
  \newcommand{\Abstract}[1]{\chapter*{\iflanguage{ngerman}{\abstractname}{Executive Summary}} #1 \vspace{0.7cm}
    \textbf{\iflanguage{ngerman}{Stichw\"orter}{Keywords}:} \emph{\thekeywords}}
  \renewcommand{\includeabstract}{
  \iflanguage{ngerman}{
    \include{Aux/0-Abstract_DE}
  }{
    \include{Aux/0-Abstract_EN}
  }
  }
\fi\thispagestyle{empty}

\ifKITthesis@thesis

  \newcommand{\theAbstract}{}
  \newcommand{\abstract}{}
  \newcommand{\Abstract}{}

  \renewcommand{\includeabstract}{
  \iflanguage{ngerman}{
    % include German and English abstracts
    \renewcommand{\abstract}[1]{\renewcommand{\theAbstract}{\chapter*{\abstractname} ##1}}
    \renewcommand{\Abstract}[1]{\renewcommand{\theAbstract}{\chapter*{\abstractname}\addcontentsline{toc}{chapter}{\abstractname}
     {\Large\changefont{phv}{b}{n}\centering{\thetitle}\\\vspace{0.7cm}} ##1}}
    \include{Aux/0-Abstract_DE}
    \theAbstract
    \vspace{0.7cm}
    \textbf{Stichw\"orter:} \emph{\thekeywords}

    \begin{otherlanguage}{english}
      \renewcommand{\abstract}[1]{\renewcommand{\theAbstract}{\chapter*{\abstractname} ##1}}
      \renewcommand{\Abstract}[1]{\renewcommand{\theAbstract}{\chapter*{\abstractname}\addcontentsline{toc}{chapter}{\abstractname}
       {\Large\changefont{phv}{b}{n}\centering{\thetitleotherlanguage}\\\vspace{0.7cm}} ##1}}
      \include{Aux/0-Abstract_EN}
      %\theAbstract
      %\vspace{0.7cm}
      %\textbf{Keywords:} \emph{\thekeywordsotherlanguge}
    \end{otherlanguage}
  }{
    % include English and German abstracts
    \renewcommand{\abstract}[1]{\renewcommand{\theAbstract}{\chapter*{\abstractname} ##1}}
    \renewcommand{\Abstract}[1]{\renewcommand{\theAbstract}{\chapter*{\abstractname}\addcontentsline{toc}{chapter}{\abstractname}
     {\Large\changefont{phv}{b}{n}\centering{\thetitle}\\\vspace{0.7cm}} ##1}}
    \include{Aux/0-Abstract_EN}
      %\theAbstract
      %\vspace{0.7cm}
      %\textbf{Keywords:} \emph{\thekeywords}
  }
  }
\fi

%% --------------------
%% | Acknowledgements |
%% --------------------


\newcommand{\includelegal}{}
\ifKITthesis@thesis
\renewcommand{\includelegal}{\newpage\thispagestyle{empty}\vspace*{\fill}{\input{Aux/0-Legal.tex}}\vspace*{\fill}}
\else
\thispagestyle{empty}
\pagebreak
\fi


\newcommand{\includeacknowledgments}{}
\ifKITthesis@thesis
  \renewcommand{\includeacknowledgments}{\newpage\thispagestyle{empty}\vspace*{\fill}{\input{Aux/0-Acknowledgments.tex}}\vspace*{\fill}}
\else
  \thispagestyle{empty}
  \pagebreak
\fi

\newcommand{\includepreface}{}
\ifKITthesis@thesis
\renewcommand{\includepreface}{\newpage\thispagestyle{empty}\vspace*{\fill}{\input{Aux/0-Preface.tex}}\vspace*{\fill}}
\else
\thispagestyle{empty}
\pagebreak
\fi

  % \def\ackname{Acknowledgments}
  % \def\tname{Abstract}
  % \def\switcht@deutsch{\svlanginfo
  % 	\def\ackname{Danksagung}
  % 	\def\abstractname{Kurzfassung}
  % }
  %\def\switcht@english{\svlanginfo
  % 	\def\ackname{Acknowledgements}
  % 	\def\abstractname{Abstract}
  % }


% DEDICATION

\newcommand{\includeepigraph}{}
\ifKITthesis@thesis
\renewcommand{\includeepigraph}{\newpage\thispagestyle{empty}\vspace*{\fill}\begin{center}\emph{\input{Aux/0-Epigraph.tex}}\end{center}\vspace*{\fill}}
\else
\thispagestyle{empty}
\pagebreak
\fi


%% ------------------------------------------
%% | Tables of Contents, Figures and Tables |
%% ------------------------------------------
\newcommand{\inculdetableofcontents}{}
\ifKITthesis@seminar
  \renewcommand{\inculdetableofcontents}{
    \tableofcontents
    \pagebreak
    }
\fi
\ifKITthesis@techreport
  \renewcommand{\inculdetableofcontents}{
    \tableofcontents
    \pagebreak
    }
\fi
\ifKITthesis@thesis
  \renewcommand{\inculdetableofcontents}{
    \tableofcontents
    \blankpage
  }
\fi

\newcommand{\includeglossary}{}
\renewcommand{\includeglossary}{
    \glsaddall
    \printglossary %\addcontentsline{toc}{chapter}{\listfigurename}
}
\newcommand{\includeacronyms}{}
\renewcommand{\includeacronyms}{
    \glsaddall
    \printacronyms %\addcontentsline{toc}{chapter}{\listfigurename}
}
% TODO: Check this if its needed in the future...
\newcommand{\includeglossaries}{}
\renewcommand{\includeglossaries}{
    \glsaddall
    \printglossaries %\addcontentsline{toc}{chapter}{\listfigurename}
}
%%%
\newcommand{\inculdelistoffigures}{}
\renewcommand{\inculdelistoffigures}{
    \listoffigures \addcontentsline{toc}{chapter}{\listfigurename}
}
\newcommand{\inculdelistoftables}{}
\renewcommand{\inculdelistoftables}{
    \listoftables \addcontentsline{toc}{chapter}{\listtablename}
}
\newcommand{\inculdelistoflistings}{}
\renewcommand{\inculdelistoflistings}{
    \lstlistoflistings \addcontentsline{toc}{chapter}{\lstlistlistingname}
}
\newcommand{\inculdelistofalgoritms}{}
\renewcommand{\inculdelistofalgoritms}{
    \listofalgorithms  \addcontentsline{toc}{chapter}{\listalgorithmname}
}

\newcommand{\setmainpart}{
  \setcounter{page}{1}
  \pagenumbering{arabic}
}

%% ------------
%% | Appendix |
%% ------------
\ifKITthesis@thesis
  \newcommand{\Appendix}[1][\appendixname]{\chapter*{#1}\addcontentsline{toc}{chapter}{#1} \appendix \setcounter{figure}{0}}
\else
  \newcommand{\Appendix}[1][\appendixname]{\chapter*{#1}\addcontentsline{toc}{section}{#1} \appendix \setcounter{figure}{0}}
\fi

% \appendix

% \iflanguage{english}
% {\addchap{Appendix}}	% english style
% {\addchap{Anhang}}	% german style

%% -----------------------------
%% | Bibliography              |
%% -----------------------------


\ifKITthesis@thesis
  \newcommand{\Bibliography}[1]{\addcontentsline{toc}{chapter}{\bibname} \bibliography{#1}}
\else
  \newcommand{\Bibliography}[1]{\addcontentsline{toc}{section}{\bibname} \bibliography{#1}}
\fi

% \iflanguage{ngerman}
% %   {\bibliographystyle{unsrtdin}}	% german style
%   {\bibliographystyle{IEEEtran}}
%   {\bibliographystyle{IEEEtran}}	% english style

%% Use plainnat to work nicely with natbib.
\bibliographystyle{plainnat}

% Provide support for the control entries of IEEEtran.bst V1.00 and later.
\def\bstctlcite#1{\@bsphack
  \@for\@citeb:=#1\do{%
    \edef\@citeb{\expandafter\@firstofone\@citeb}%
    \if@filesw\immediate\write\@auxout{\string\citation{\@citeb}}\fi}%
  \@esphack}

% \usepackage[fixlanguage]{babelbib}	% sets german style for literature entries
% \selectbiblanguage{ngerman}			% for \bibliographystyle{babalpha}

%% -----------------------------
%% | My Bibliography - Entry   |
%% -----------------------------
\newcommand{\addmybibentry}{}
\ifKITthesis@thesis
  \renewcommand{\addmybibentry}{
    \newpage
    \thispagestyle{empty}
    \section*{\iflanguage{ngerman}{BibTex Eintrag für dieser Arbeit}{BibTex Entry of this Thesis}}
%     Referencing this work: \\ \\
    @mastersthesis\{\theauthor\_\theeditend, 	\\
	\tab author = \{\theauthor\},		\\
	\tab editor = \{\theadvisorone, \theadvisortwo\},	\\
	\tab ipr-thesis = \thesistype,		\\
	\tab keywords = \{\thekeywords\},		\\
	\tab location = \{Karlsruhe, Germany\},	\\
	\tab month = ,				\\
	\tab pages = ,				\\
	\tab school = \{Karlsruhe Institute of Technology\},	\\
	\tab title = \{\thetitle\},			\\
	\tab year = \{\theeditend\}			\\
    \}
  }
\fi

\newcommand{\includehowtouse}{}
\ifKITthesis@final
\else
    \renewcommand{\includehowtouse}{
        \renewcommand\thesection{\arabic{chapter}}%
        \include{Aux/0-How-to-Use}
    }
\fi



