#!/bin/env perl
#
# The shebang at the top  is only to get syntax highlighting (not meant to be run, but read by `latexmk`).
#
# Sources:
#  https://tex.stackexchange.com/a/689645/154993
#  https://github.com/alexpovel/latex-cookbook/blob/main/.latexmkrc
# See also:
#  https://www.ctan.org/tex-archive/support/latexmk/example_rcfiles

# Verbosity level
#$verbose = 2;

# PDF-generating modes are:
# 1: pdflatex, as specified by $pdflatex variable (still largely in use)
# 2: postscript conversion, as specified by the $ps2pdf variable (useless)
# 3: dvi conversion, as specified by the $dvipdf variable (useless)
# 4: lualatex, as specified by the $lualatex variable (best)
# 5: xelatex, as specified by the $xelatex variable (second best)
$pdf_mode = 4;

# Set the lualatex variable.
$lualatex = 'lualatex --synctex=1 --file-line-error %O %S';

# Disable PS and DVI generation
$postscript_mode = $dvi_mode = 0;

# Set the output directory for generated files
$out_dir = 'build';

# See the docs. The default value may work fine.
#$pdf_update_method = 4;

# Show used CPU time. Looks like: https://tex.stackexchange.com/a/312224/120853
$show_time = 1;

# The next two preview variables are mutually exclusive!
# Preview after each build.
# Equivalent to -pv on command line.
# $preview_mode = 1;
# Preview continuously.
# Equivalent to -pvc on command line.
# $preview_continuous_mode = 1;

# Comment out to use Preview.app.
# Give -pv on the command line.
#$pdf_previewer = 'open -a Skim.app %S';

# Special latexmk makeindex line for .dtx files.
#$makeindex = "makeindex -s gind.ist %O -o %D %S";

# Files to be cleaned.
#$clean_ext = "deriv equ glo gls gsprogs hd listing lol" .
#" _minted-%R/* _minted-%R nav snm synctex.gz tcbtemp vpprogs";
