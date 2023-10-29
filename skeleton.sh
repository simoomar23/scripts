#!/bin/bash
function bash_gen(){
echo '#!/bin/sh/env bash
#
# @filename monfichier.sh
# @date 2019-10-18 15:13
# @author Prenom Nom <prenom.nom@enseirb-matmeca.fr>
# @brief ...
#

CMD=$( basename $0 )
nbminparams=1

usage()
{
	echo "Usage: $CMD ..."
}

if [ $# -lt $nbminparams ]
then
	usage
	exit 1
fi'>$1
}
function c_gen(){
echo '#include <stdlib.h>
#include <stdio.h>

#define _NB_MIN_PARAMS_1
void print_usage( char *argv[] ) {
     fprintf( stderr,"Usage: %s ....\n",argv[0]);
     return ;
}
int main( int argc, char *argv[] )
{   
    if ( argc <_NB_MIN_PARAMS_){
       print_usage (argv );
       return EXIT_FAILURE;
       }
       return EXIT_SUCCESS;
}'>$1
}
function tex_gen(){
echo '%%
%% @filename monfichier.tex
%% @date 2019-10-18 15:13
%% @author Prenom Nom <prenom.nom@enseirb-matmeca.fr>
%% @brief ...
%%
\documentclass[a4paper, draft]{article}

\usepackage[utf8]{inputenc}
\usepackage[french]{babel} 

% Figures
\usepackage{graphicx}
\graphicspath{{./img/}}

% Math
\usepackage{amsmath, amssymb}
\newtheorem{defi}{Définition}

% Algortihmes
\usepackage[vlined,lined,linesnumbered,boxed,french]{algorithm2e}
\DeclareMathOperator*{\argmin}{argmin}
\DeclareMathOperator{\myfunc}{myfunc}
\DeclareMathOperator*{\sign}{sign}
\DeclareMathOperator*{\imwh}{width}
\DeclareMathOperator*{\imht}{height}

% Extra
\usepackage[left=3cm,right=3cm,top=2cm,bottom=2cm]{geometry}
\usepackage{url}

\begin{document}


\end{document}'>$1
}
case $2 in
    "tex")
	tex_gen $1;;
    "c")
	c_gen $1;;
    "sh")
	bash_gen $1;;
esac

