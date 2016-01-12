
@REM Comment: Parse out the different filename components from the first argument passed
@set file=%1
@set basename=%~n1
@set extension=%~x1
@set pathname=%~dp1

REM Generating word doc with panzer
panzer -f markdown+tex_math_single_backslash -t docx -o "%pathname%%basename%.docx" --data-dir="%pathname%" %file%

@REM Generating pdf with panzer and LaTeX
@REM panzer -f markdown+tex_math_single_backslash --latex-engine=pdflatex -o "%pathname%%basename%.pdf" --data-dir="%pathname%", %file%
 
@REM pandoc -f markdown+tex_math_single_backslash -t docx --bibliography="example-references.bib" --filter pandoc-crossref --csl="C:\Users\James\.panzer\references\harvard.csl" --reference-docx="C:\Users\James\.panzer\template\manuscript-template-dblspace.docx" -o Sample.docx sample.md

@REM pandoc -f markdown+tex_math_single_backslash -t latex --latex-engine=pdflatex --bibliography="example-references.bib" --filter pandoc-crossref --csl="C:\Users\James\.panzer\references\harvard.csl" -o Sample.pdf sample.md