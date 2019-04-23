#!/usr/bin/env perl

$pdf_mode         = 3;

$latex            = 'uplatex -synctex=1 -interaction=nonstopmode %O %S';
$pdflatex         = 'pdflatex -synctex=1 -interaction=nonstopmode %O %S';
$lualatex         = 'lualatex -synctex=1 -interaction=nonstopmode %O %S';

$bibtex           = 'upbibtex %O %B';
$dvipdf           = 'dvipdfmx %O -o %D %S';
$makeindex        = 'mendex %O -o %D %S';
