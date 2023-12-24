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

# (unnecessary if `set_tex_cmds` invoked) Set the lualatex variable.
#$lualatex = 'lualatex --synctex=1 --file-line-error %O %S';

# `set_tex_cmds` applies to all *latex commands (latex, xelatex, lualatex,...), so
# no need to specify these each. This allows to simply change `$pdf_mode` to get a
# different engine. Check if this works with `latexmk --commands`.
#
# `--interaction=nonstopmode`: compilation continues on error, instead of prompting user input.
#
# `--halt-on-error`: stop compilation immediately on the first error.
#
# `--shell-escape`: allow execution of code outside of latex (required for the 'svg' package; it converts raw SVG files
#     to the PDF+PDF_TEX combo using InkScape).
#
# `--synctex` allows to jump between source (code) and output (PDF) in IDEs with support (many have it). A value of `1`
#     is enabled (gzipped), `-1` is enabled but uncompressed, `0` is off.
#     Testing in VSCode w/ LaTeX Workshop only worked for the compressed version. Adjust this as needed. Of course, only
#     relevant for local use, no effect on a remote CI pipeline (except for slower compilation, probably).
#
# %O and %S will forward Options and the Source file, respectively, given to latexmk. latexmk itself adds some options.
#
set_tex_cmds("--interaction=nonstopmode --halt-on-error --file-line-error --shell-escape --synctex=1 %O %S");

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
