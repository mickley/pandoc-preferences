---
# This section (enclosed by 3 dashes and 3 dots on lines by themselves) is YAML metadata.
# It's a simple way to essentially set variables that pandoc, panzer, and many filters use
# to parse the document.  It's really convenient because you can then bundle settings with the document
# Comments in yaml start with a poind sign
title: Document title
author:
- name: James Mickley
  affiliation: University of Connecticut
  email: james.mickley@uconn.edu
# You can add more authors here by adding another name block

# date: January 1, 2000
published: Draft
abstract: Loren ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.  

# Set the panzer style to use for the document here:
# See https://github.com/msprev/panzer
style: Thesis-Draft

# Set the bibliography file here:
bibliography: "example-references.bib"
csl: nature.csl

# End of YAML metadata block.  
...


<!--- This is a comment in markdown, it's not parsed into the final document -->


# Chapter Title

## Section 

Let's test a citation here [@Schlichting:1988vh; @Schlichting:1989hv].  These citekeys come from the bibtek file of all your references specified in the YAML metadata.  If using Sublime to edit markdown, you can cite quickly using [Papers](http://www.papersapp.com/mac/) by hitting CTRL twice.  Or there are two Sublime packages [Citer](https://packagecontrol.io/packages/Citer) and [CiteBibtex](https://packagecontrol.io/packages/CiteBibtex) that may help.  For citations to work, you also have to run the pandoc-citeproc filter, either via panzer style or pandoc commandline options.  Finally, you need to specify a citation style csl file in the metadata.  See [pandoc citations](http://pandoc.org/README.html#citations) for more information.

### Subsection: Some text examples

* *italics*
* **bold text**
* ~~strikethrough~~
* superscript: Q^2^ 
* subscript: H~2~O

#### Subsubsection

## Tables

Pandoc markdown supports [several different kinds of tables](http://pandoc.org/README.html#tables).  Thus far, there is no easy way to set up styles in word for them.  They can be referenced in text though using [pandoc-tablenos](https://github.com/tomduck/pandoc-tablenos) or [pandoc-crossref filters](https://github.com/lierdakil/pandoc-crossref).  Making tables with more than a few rows or columns can be cumbersome in markdown, so with [pandoc-placetable](https://github.com/mb21/pandoc-placetable) or [pandoc-csv2table](https://github.com/baig/pandoc-csv2table) you can make them using csv files.  For table examples refer to [@tbl:table1], [@tbl:table2], [@tbl:table3], [@tbl:table4].

  Right     Left     Center     Default
-------     ------ ----------   -------
     12     12        12            12
    123     123       123          123
      1     1          1             1

Table: This is a simple table.  You can left, right, and center align cells by controlling the spacing relative to the dashes below column headings.  {#tbl:table1}

-------------------------------------------------------------
 Centered   Default           Right Left
  Header    Aligned         Aligned Aligned
----------- ------- --------------- -------------------------
   First    row                12.0 Example of a row that
                                    spans multiple lines.

  Second    row                 5.0 Here's another one. Note
                                    the blank line between
                                    rows.
-------------------------------------------------------------

Table: This is a multi-line table.  Multiline tables pay attention to the relative width of columns allowing more control.  {#tbl:table2}

+---------------+---------------+--------------------+
| Fruit         | Price         | Advantages         |
+===============+===============+====================+
| Bananas       | $1.34         | - built-in wrapper |
|               |               | - bright color     |
+---------------+---------------+--------------------+
| Oranges       | $2.10         | - cures scurvy     |
|               |               | - tasty            |
+---------------+---------------+--------------------+

Table: This is a grid table.  Grid tables allow for multiple paragraphs, code blocks, lists etc. within a cell. {#tbl:table3}

<div id="tbl:table4">
```{.table header=yes caption="Table caption"}
Fruit,Price,Advantages
Bananas,$1.34,"Bright color"
Oranges,$2.10,"Oranges are orange"
```
</div>


## Figures

The syntax for figures is just like a link, but is preceeded by an exclamation point.  You can embed PDFs this way, but currently there is no support for sizing them, so it's better to use an image format.  Images will be displayed at their specified width/height and dpi

![Here's a caption for our figure.](Post_Selection_Clustering-1.pdf){#fig:figure1 width=6in height=3in}

## Equations

Here's a complicated equation, written in LaTex:  To use this notation, the pandoc commandline option for format has to be changed from *-f markdown* to *-f markdown+tex_math_single_backslash*
\\[
\phi_n(\kappa) =
 \frac{1}{4\pi^2\kappa^2} \int_0^\infty
 \frac{\sin(\kappa R)}{\kappa R}
 \frac{\partial}{\partial R}
 \left[R^2\frac{\partial D_n(R)}{\partial R}\right]\,dR
\\] {#eq:equation1}

You can also write equations by enclosing the statement in 1 or 2 dollar signs:

$$(a^2 + b^2 = c^2)/\pi$$ {#eq:equation2}

$(a^2 + b^2 = c^2)/\mu$ {#eq:equation3}

You can also add additional latex between $ signs.  For example using this latex code:

```Latex
\begin{aligned}
\dot{x} & = \sigma(y-x) \\
\dot{y} & = \rho x – y – xz \\
\dot{z} & = -\beta z + xy
\end{aligned}
```
produces this set of equations:

$$\begin{aligned}
\dot{x} & = \sigma(y-x) \\
\dot{y} & = \rho x – y – xz \\
\dot{z} & = -\beta z + xy
\end{aligned}$$ {#eq:equation4}


## Code
You can include code fenced on either side by 3 backticks.  This will also work with R Markdown, and can be run through knitr before pandoc/panzer.  

```r
# Make an empty graph
plot(0,0)
```

## Miscellany

Using pandoc-pagebreak filter you can specify a pagebreak for Word and LaTeX

\newpage

You can refer to sections of the document, for example see the [Citation Section](#section).  The link to use is lowercase, with spaces replaced by dashes.  (see @eq:equation2)

Markdown supports bullet points and lists

### Ordered List

1. Item 1
2. Item 2
3. Item 3

### Bullet points

* Fruit
    + Apples
        - Green
        - Red
    + Bananas
    + Pears
* Veggies
    + Tomatoes
    + Broccoli


## References
<!---
Adds hanging indent to LaTeX pdfs.  Not needed for Word, just edit Bibliography style
https://groups.google.com/forum/#!msg/pandoc-discuss/4SKA5E11rO4/HvDu9dliIQcJ
-->
\noindent
\vspace{-2em}
\setlength{\parindent}{-0.25in}
\setlength{\leftskip}{0.25in}
\setlength{\parskip}{8pt}