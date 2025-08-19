# LUG@UIC Slide Template

## Table Of Contents
- [Description](#description)
- [Credits](#credits)
- [Instructions](#instructions)
  - [Options](#options)
  - [Markdown to Slides](#markdown-to-slides)

# Description

A beamer theme for LUG Slideshows entitled "lugatuic". Based on F. Muro's "Seville" theme. Additionally contains a basic template for converting Markdown and Org mode files into slide decks.

# Credits

[Original "Seville" Theme](https://github.com/FMuro/seville)
F. Muro

# Instructions

## Software Dependencies (for markdown -> PDF usage):
- GNU Make
- pandoc
- pdflatex - provided by the texlive package on debian, and other packages on other systems
  - Sadly, texlive-full, with its relatively large install size, is the smallest of [the umbrella texlive packages in the official debian apt repos](https://wiki.debian.org/Latex) that works. Not everything in that package is necessary, it is very likely that very *little* of it is necessary. The smallest set of packages that supports this on debian 13.0 is `texlive` and `texlive-fonts-extra`.
The above dependencies can be installed on debian 13.0 with `apt install make pandoc texlive texlive-fonts-extra`. Those particular packages, on that particular distribution, have been verified to work as prerequisites for using this repository to create PDFs from Markdown (as described below).

Other distributions work, and the required packages on them likely have very similar names. If you have specific instructions for different packages, that's another good thing to contribute with a pull-request.

## After Installation:

To simply use the theme, copy the .sty file into the directory of your LaTeX code and insert `\usepackage{lugatuic}` in your preamble. (The preamble is the metadata before your `begin{document}`)

If you have a Markdown document you want to convert into a slideshow, please see the instructions below.

## Options

All fonts and compilers supported by the original Seville theme are also supported by this theme!

These font choices have the same caveats as they do in the original theme, which can be found [here](https://github.com/FMuro/seville?tab=readme-ov-file#options).

**Color Themes**

The default color scheme is Gruvbox's Dark Theme.
To use Catpuccin's Frappe theme, use the `catfrap` option.

Example:
`\usetheme[catfrap]{lugatuic}`

## Markdown to Slides

To convert a file from Markdown or Org Mode into a slide deck, just run:

`make NAME.pdf`

Wherein "NAME" is the name of your markdown/org file without the extension. For example, if I had a markdown file "example.md", to turn it into a slide deck, I'd run:

`make example.pdf`

### Notable Markdown to Beamer Syntax

While raw LaTeX *should* be able to be embedded into your Markdown and Org mode files, there are a few tricks which make stylizing your slideshow with Markdown much easier!

**Blocks**

Assuming you are using a level 1 heading for your slide titles/dividers (`#`), then any text that follows a level two heading (`##`) until the next level one heading will be put into a block!

**Columns**

If you want two columns (perhaps to put an image alongside text), use the following syntax:

```
::: columns

:::: column
left
::::

:::: column
right
::::

:::
```

Wherein "left" and "right" are the content you want in each column, respectively.
