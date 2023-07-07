\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Imeasure}
\LoadClass[twoside, fontset=fandol]{ctexart}
\RequirePackage[svgnames]{xcolor}
\ctexset {
    section = {
      name = {第,节},
      number = \chinese{section},
      format = \large\bfseries,
     }
}
\RequirePackage[b5paper]{geometry}
\RequirePackage[scr=boondox]{mathalpha}
\RequirePackage{dsfont}
\DeclareMathAlphabet{\mathbb}{U}{dsrom}{m}{n}
\RequirePackage{amsmath,amsfonts,amssymb,amsthm,euscript,fontspec,tocloft,fancyhdr,mathtools,enumitem,pgfplots,tikz-cd,xeCJKfntef,endnotes}
\RequirePackage{fixdif}
\RequirePackage{etoolbox}
\RequirePackage{expl3,xparse}
\RequirePackage[
    colorlinks,
    linkcolor = DarkTurquoise,
    anchorcolor = OrangeRed,
    filecolor = RoyalBlue,
    urlcolor = Peru,
    citecolor = Teal,
    linktocpage,
    hyperfootnotes = true,
    breaklinks = true,
]{hyperref}

% Font settings

\def\complement{{\mathrm c}}
\setlist[enumerate]{itemsep = 0pt}
\setlist[itemize]{itemsep = 0pt}
\setmainfont{lmroman10-regular.otf}[
    BoldFont = lmromandemi10-regular.otf,
    ItalicFont = lmroman10-italic.otf,
    SmallCapsFont = lmromancaps10-regular.otf,
    SizeFeatures = {
            {Size = {-9}, Font = lmroman8-regular.otf},
            {Size = {9-14}, Font = lmroman10-regular.otf},
            {Size = {14-}, Font = lmroman17-regular.otf}
        }
]
\setCJKmainfont{FandolSong-Regular.otf}[
    BoldFont = FandolSong-Bold.otf,
    ItalicFont = FandolKai-Regular.otf,
    SizeFeatures={
            {Size={-9}, FakeStretch = 1.05, ItalicFont = FandolKai-Regular.otf},
            {Size={9-}, FakeStretch = 1, ItalicFont = FandolKai-Regular.otf}
        }
]
\setmonofont{lmmonoproplt10-regular.otf}
\setCJKmonofont[Scale = .9]{Resource Han Rounded SC Normal}
\AtBeginDocument{%
    \DeclareFontFamily{U}{msa}{}
    \DeclareFontShape{U}{msa}{m}{n}{%
        <-9>cmbras8%
        <9-10>cmbras9%
        <10->cmbras10%
    }{}
    \DeclareFontFamily{U}{msb}{}
    \DeclareFontShape{U}{msb}{m}{n}{%
        <-9>cmbrbs8%
        <9-10>cmbrbs9%
        <10->cmbrbs10%
    }{}
}
\renewcommand{\@cite}[2]{\texttt{[{#1\if@tempswa , #2\fi}]}}
\AddToHook{cmd/@BIBLABEL/before}{\ttfamily}
\newcommand{\autodate}{\number\year~\rule{.6pt}{.68em}~\ifnum\month<10 0\number\month\else\number\month\fi~\rule{.6pt}{.68em}~\ifnum\day<10 0\number\day\else\number\day\fi}

% Something about mathemathics

\renewcommand\implies{\DOTSB \,\Longrightarrow \,}
\renewcommand\setminus{\,\mathord{\mathchar"226E}\,}
\newcommand\dif{\mathrel{\triangle}}
\renewcommand{\arraystretch}{.9}
\renewcommand\mathcal[1]{\EuScript{#1}}
\makeatletter
\newcommand \given{}
\newcommand \setskip{\,}
\newcommand \SetSymbol[1][]{%
    \nonscript\setskip#1\vert
    \allowbreak
    \nonscript\setskip
    \mathopen{}}
\DeclarePairedDelimiterX\@set[1]{\{}{\}}%
{\renewcommand\given{\SetSymbol[\delimsize]}%
    \setskip#1\setskip\mathopen{}}
\DeclareDocumentCommand{\@set@nostar}{O{}O{\,}m}{%
\renewcommand{\setskip}{#2}\@set[#1]{#3}}
\DeclareDocumentCommand{\@set@star}{O{\,}m}{%
\renewcommand{\setskip}{#1}\@set∗{#2}}
\newcommand\set{\@ifstar\@set@star\@set@nostar}
\makeatother

% Layout settings

\renewcommand{\sectionmark}[1]{\markright {\uppercase{#1}}}
\fancypagestyle{fancy}
{
    \fancyhead[OR]{\fontspec{lmsansquot8-oblique.otf}[FakeStretch=.85]\itshape\small\rightmark\qquad{\fontspec{lmsans10-boldoblique.otf}\thepage}}
    \fancyhead[LE]{\fontspec{lmsansquot8-oblique.otf}[FakeStretch=.85]\itshape\small{\fontspec{lmsans10-boldoblique.otf}\thepage}\qquad\leftmark}
    \fancyhead[LO,RE]{}
    \fancyfoot[C]{}
    \renewcommand{\headrulewidth}{0pt}
}
\pagestyle{fancy}

% About footnotes

\newlength \circlenumbertemp
\newlength \squarenumbertemp
\newcommand {\circlenumber} [1] {%
    \ifnum #1 > 9
        \circlenumbertemp = 0.18cm
    \else
        \circlenumbertemp = 0.12cm
    \fi
    \hbox{\begin{tikzpicture}[baseline = -.8ex]
            \draw [line width = .3pt] (0,0) circle (0.12);
            \node at(0,0){\makebox[0pt]{\resizebox{\circlenumbertemp}{!}{\textbf{#1}}}};
        \end{tikzpicture}}
}
\newcommand {\squarenumber} [1] {%
    \ifnum #1 > 9
        \squarenumbertemp = 0.18cm
    \else
        \squarenumbertemp = 0.12cm
    \fi
    \hbox{\begin{tikzpicture}[baseline = -.7ex]
            \draw [line width = .3pt, rounded corners = 1pt] (-0.12,-0.12) rectangle (0.12,0.12);
            \node at(0,0){\makebox[0pt]{\resizebox{\squarenumbertemp}{!}{\textbf{#1}}}};
        \end{tikzpicture}}
}
\renewenvironment{quote}{\begin{flushright}\small\kaishu\begin{minipage}{15em}\hspace*{2em}}{\end{minipage}\end{flushright}\medskip}
\makeatletter
\renewcommand\@makefnmark{\@textsuperscript{\scalebox{.8}{\circlenumber{\@thefnmark}}}}
\renewcommand\makeenmark{\@textsuperscript{\scalebox{.8}{\squarenumber{\@theenmark}}}\!}
\renewcommand\enoteformat{\rightskip\z@ \leftskip\z@ \parindent=2em
    \leavevmode\llap{\raise-.8ex\hbox{\squarenumber{\@theenmark}}~}}
\renewcommand\enoteformat{
\rightskip\z@%
\leftskip\z@%
\parindent=2em%
\noindent\leavevmode%
\makebox[2em][l]{%
\kern-1.5\ccwd\makebox[1.5em]{$\hookrightarrow$}\,%
\setcounter{Hendnote}{\@theenvalue}%
\addtocounter{Hendnote}{-1}%
\refstepcounter{Hendnote}%
\ifenotelinks%
    \expandafter\@secondoftwo%
\else%
    \expandafter\@firstoftwo%
\fi%
{\@firstofone}%
{\hyperlink{Hendnotepage.\@theenvalue}}%
{\squarenumber{\@theenmark}}%
}%
}
\renewcommand\@makefntext[1]{%
    \hspace*{-2em}%
    \parindent 2em%
    \noindent
    \hb@xt@ 2em{\hss
            \normalfont
            \scalebox{1}[.9]{\circlenumber{\@thefnmark}}~}%
    #1}
\renewcommand\notesname{尾\kern\ccwd 注}
\renewcommand\enoteheading{\section{\notesname}%
    \mbox{}\par\vskip-2.3\baselineskip\noindent\rule{.5\textwidth}{0.4pt}
    \begin{quote}
        饱含魔力的土地下\,$\mathinner{\ldotp \ldotp \ldotp\ldotp \ldotp \ldotp}$\,
    \end{quote}
    直接读尾注也是可以的. 不过尾注并没有按照知识的顺序来, 而是零散得不成样子.\bigskip
}
% Make endnotes ``hyperrefiable'' From https://tex.stackexchange.com/questions/8452/making-endnotes-clickable-links-with-hyperref
\newif\ifenotelinks
\newcounter{Hendnote}
\let\savedhref\href
\let\savedurl\url
\def\endnotemark{\@ifnextchar[\@xendnotemark{\stepcounter{endnote}%
    \protected@xdef\@theenmark{\theendnote}%
    \protected@xdef\@theenvalue{\number\c@endnote}%
    \@endnotemark}}%
\def\@xendnotemark[#1]{%
    \begingroup\c@endnote#1\relax
    \unrestored@protected@xdef\@theenmark{\theendnote}%
    \unrestored@protected@xdef\@theenvalue{\number\c@endnote}%
    \endgroup\@endnotemark
}
\def\endnotetext{%
\@ifnextchar[\@xendnotenext{%
    \protected@xdef\@theenmark{\theendnote}%
    \protected@xdef\@theenvalue{\number\c@endnote}%
    \@endnotetext}
}%
\def\@xendnotenext[#1]{%
    \begingroup
    \c@endnote=#1\relax
    \unrestored@protected@xdef\@theenmark{\theendnote}%
    \unrestored@protected@xdef\@theenvalue{\number\c@endnote}%
    \endgroup\@endnotetext}%
\def\endnote{%
\@ifnextchar[\@xendnote{%
    \stepcounter{endnote}%
    \protected@xdef\@theenmark{\theendnote}%
    \protected@xdef\@theenvalue{\number\c@endnote}%
    \@endnotemark\@endnotetext}}%
\def\@xendnote[#1]{%
    \begingroup
    \c@endnote=#1\relax
    \unrestored@protected@xdef\@theenmark{\theendnote}%
    \unrestored@protected@xdef\@theenvalue{\number\c@endnote}%
    \show\@theenvalue
    \endgroup\@endnotemark\@endnotetext
}%
\def\@endnotemark{%
\leavevmode
\ifhmode
    \edef\@x@sf{\the\spacefactor}\nobreak
\fi
\ifenotelinks\expandafter\@firstofone
\else
    \expandafter\@gobble
\fi
{\Hy@raisedlink{\hyper@@anchor{Hendnotepage.\@theenvalue}{\empty}}}%
\hyper@linkstart{link}{Hendnote.\@theenvalue}%
\makeenmark\hyper@linkend
\ifhmode
    \spacefactor\@x@sf
\fi
\relax
}%
\long\def\@endnotetext#1{%
    \if@enotesopen
    \else
        \@openenotes
    \fi
    \immediate\write\@enotes{%
        \@doanenote{\@theenmark}{\@theenvalue}%
    }%
    \begingroup
    \def\next{#1}%
    \newlinechar='40
    \immediate\write\@enotes{\meaning\next}%
    \endgroup
    \immediate\write\@enotes{%
        \@endanenote
    }%
}%
\def\theendnotes{%
\immediate\closeout\@enotes
\global\@enotesopenfalse
\begingroup
\makeatletter
\edef\@tempa{`\string>}%
\ifnum\catcode\@tempa=12
    \let\@ResetGT\relax
\else
    \edef\@ResetGT{\noexpand\catcode\@tempa=\the\catcode\@tempa}%
    \@makeother\>%
\fi
\def\@doanenote##1##2##3>{%
\def\@theenmark{##1}%
\def\@theenvalue{##2}%
\par
\smallskip %<-small vertical gap between endnotes
\begingroup
\def\href{\expandafter\savedhref}%
\def\url{\expandafter\savedurl}%
\@ResetGT
\edef\@currentlabel{\csname p@endnote\endcsname\@theenmark}%
\enoteformat
}%
\def\@endanenote{%
    \par\endgroup
}%
% Redefine, how numbers are formatted in the endnotes-section:
\renewcommand*\@makeenmark{%
    \hbox{\normalfont\@theenmark~}%
}%
% header of endnotes-section
\enoteheading
% font-size of endnotes
\enotesize
\input{\jobname.ent}%
\endgroup
}
\makeatother
\enotelinkstrue
\makeatother
\ExplSyntaxOn
\NewDocumentCommand{\evalduxkingcpt}{m}{\fp_eval:n {0}}
\ExplSyntaxOff
\setcounter{endnote}{-1}
\renewcommand\enotesize{\normalsize}

% Defining environments

\newtheoremstyle{innocent}{}{}
{\rmfamily\kaishu}{}
{\sffamily\bfseries}{}
{ }{\thmname{#1}\thmnumber{ #2}\,\mdseries\rmfamily\thmnote{$\left(\,\mbox{#3}\,\right) $.}~}
\theoremstyle{innocent}
\newtheorem*{theorem}{定理}
\newtheorem*{prop}{命题}
\newtheorem*{cor}{推论}
\newtheorem*{tempdefi}{定义}
\newsavebox\tempdefibox
\savebox\tempdefibox{\quad$\lrcorner$}

\def\signed #1{{\leavevmode\unskip\nobreak\hfil\penalty50\hskip2em
            \hbox{}\nobreak\hfil#1%
            \parfillskip=0pt \finalhyphendemerits=0 \endgraf}}

% \newsavebox\mybox
% \newenvironment{aquote}[1]
%   {\savebox\mybox{#1}\begin{quote}}
%   {\signed{\usebox\mybox}\end{quote}}
\newenvironment*{defi}{\begin{tempdefi}}{\signed{\usebox\tempdefibox}\end{tempdefi}}


% CFT settings

\newcounter{duxing@cft@temp}
\renewcommand \contentsname{}
\renewcommand \cfttoctitlefont{\hspace*{3\ccwd}\normalsize\bfseries}
\renewcommand \cftaftertoctitle{\vspace{-\baselineskip - \ccwd}}
\renewcommand \cftsecleader{\stepcounter{duxing@cft@temp}%
    ~~\color{lightgray!20!white}\leavevmode\cleaders\hbox to 0.05em{\hss \rule[-0.1em]{0.1em}{0.8em}\hss }\hfill\kern0pt}
\cftsetpnumwidth{6em}
\renewcommand \cftsecindent{0em}
\renewcommand \cftsecpresnum{\color{white!\the\value{duxing@cft@temp}0!black}\hspace*{4\ccwd-\evalduxkingcpt{\the\value{duxing@cft@temp}}\ccwd}
    \begin{tikzpicture}[remember picture, baseline = -.5ex]
        \node (\ifnum\the\value{duxing@cft@temp}=0 zero\else\roman{duxing@cft@temp}\fi) {$\bullet$};
    \end{tikzpicture}
    \kern\ccwd}
\renewcommand \cftsecaftersnumb{\color{white!\the\value{duxing@cft@temp}0!black}\hspace*{7\ccwd}\itshape\mdseries}
\renewcommand \cftsecpagefont{\color{lightgray!20!white}\leavevmode\cleaders\hbox to 0.05em{\hss \rule[-0.1em]{0.1em}{0.8em}\hss }\hfill\kern0pt~~\fontspec{lmsansquot8-regular.otf}\hypersetup{linkcolor=white!\the\value{duxing@cft@temp}0!DarkTurquoise}}
\renewcommand \cftsecafterpnum{\thispagestyle{empty}\kern6em}


% Defining colors

\definecolor{DarkTurquoise}{rgb}{0, .48, .48}


% ctex settings

\renewcommand \cleardoublepage{\clearpage \if@twoside \ifodd \c@page \else \hbox {\thispagestyle{empty}}\newpage \if@twocolumn \hbox {\thispagestyle{empty}}\newpage \fi \fi \fi}
\xeCJKsetup{
    CJKecglue = {\hskip 0.2em plus 0.08\baselineskip},
    xCJKecglue = true
}
\ctexset {
    section = {
      name = {第,节},
      number = \chinese{section},
      format = \large\bfseries,
     }
}

\ExplSyntaxOn
\prop_new:N \g_loadendnote_prop
\tl_new:N \l_alterenda_tl
\tl_set:Nn \l_alterenda_tl { 0 }
\tl_set:Nn \l_alterendb_tl { 0 }
\NewDocumentCommand{\loadendnote}{m}{
    \prop_get:NnNF \g_loadendnote_prop { #1 } \l_tmpa_tl { \textbf{Undefined} }
    \tl_use:N \l_tmpa_tl
    \tl_clear:N \l_tmpa_tl
}
\NewDocumentCommand{\addendnotetohash}{+m}{
    \tl_set:No \l_tmpa_tl { #1 }
    \prop_gput:NVV \g_loadendnote_prop { \l_alterenda_tl } \l_tmpa_tl
    \tl_gset:Nx \l_alterenda_tl { \int_eval:n { \tl_use:N \l_alterenda_tl + 1 } }
}
\NewDocumentEnvironment { alterendnote }
{ +b }
{\addendnotetohash{#1}} {}

\NewDocumentCommand { \Kenote } {} { \exp_args:Nx \loadendnote{\l_alterendb_tl} \tl_gset:Nx \l_alterendb_tl { \int_eval:n { \l_alterendb_tl + 1 } }}
\NewDocumentCommand { \enote } {} {\endnote{\Kenote}\ignorespaces}
\ExplSyntaxOff