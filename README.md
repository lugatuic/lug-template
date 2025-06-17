# LUG@UIC Slide Template

## Table Of Contents
- [Description](#description)
- [Credits](#credits)
- [Instructions](#instructions)
  - [Options](#options)
  - [Markdown to Slides](#markdown-to-slides)

# Description

Contains a modified "Seville" Beamer template, "lugatuic".
In the future, this will additionally contain a Makefile for converting a Markdown file into a LUG slideshow!

This is still a work in progress!

# Credits

[Original "Seville" Theme](https://github.com/FMuro/seville)
F. Muro

# Instructions

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

TODO: Update instructions when such instructions exist :)
