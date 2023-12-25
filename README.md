This is a toy model of a pseudo-Zettelkasten using simple LaTeX macros
and ISO-2145 numbering of nodes.

In some sense, it is a variant of Jonathan Sterling's
[dieudonne](https://github.com/jonsterling/latex-dieudonne/) package,
but the numbering for nodes are not in parentheses. (Instead, they're
bold.)

There is a simple example using lorem ipsum and other random text, just
run `pdflatex zk` to produce the PDF output.

# Working with sections

If you wanted to do something like the dieudonne package and have nodes
be numbered within each chapter, section, subsection, etc., then the
first thing you should do is seriously consider what you want your
output to look like. Dieudonne's _Treatise on Analysis_ treated
subsections (and subsubsections and everything below it)
as "just another [named] node".

Other considerations:
- Are equations numbered within nodes, or are they using the node counter?
- Will you use LaTeX's `\chapter` and `\section` commands, then have
  `\subsection` and lower sectioning commands just be `node`
  environments (as Dieudonne did)? Or will you follow the Dieudonne
  package and reset the node counter for each sectioning command (and
  prefix the node label with the section label, separated by `\textcdot`
  or something similar)?


# Steps to make your own Zettelkasten

I suppose if you wanted to turn this into a serious tool for
note-taking, you'd want to write some Emacs macros to create a new file
and prepopulate it with a `\begin{node}\n\n\n\end{node}` environment.

It might also help to write a LaTeX macro for relative input, something
like `\def\transclude#1{\input{\CurrentFilePath/#1}}`. Then you've
effectively got something along the lines of Sterling's `forester` tool.
