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
```
```

Wherein "left" and "right" are the content you want in each column, respectively.
