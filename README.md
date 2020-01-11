# Emojize

## 💡 About

Emojize is a simple command line tool that will parse a markdown file or stream for Apple Emojis and replace them with Latex images.

## ♻️ Installation

We recommend [Mint](https://github.com/yonaskolb/mint) to install the package:

```console
$ brew install mint
$ mint install ladislas/emojize
```

## 🕹️ Usage

For a stream

```console
$ echo "# A title with an 🏅" | emojize | pandoc -s -o file.pdf --pdf-engine=xelatex
```

## 🐛 The problem we are trying to solve

I love writing markdown and using emojis. I also love pandoc to create beautiful pdfs.

But on macOS, pandoc and emojis don't work well together because emojis are rendered using `Apple Color Emoji.ttc`, which is actually using embedded `.png` images.

*Note: this might also be an issue on other systems but I can't test it...*

Wanna see for yourself? Open your terminal and run the following:

```console
$ curl https://raw.githubusercontent.com/ladislas/emojize/master/README.md | pandoc -s -o README.pdf --pdf-engine=xelatex
```

This is the output you should get something like...

```console
[WARNING] Missing character: There is no 💡 (U+1F4A1) in font [lmroman10-regular]:mapping=tex-text;!
[WARNING] Missing character: There is no 🐛 (U+1F41B) in font [lmroman12-bold]:mapping=tex-text;!
...
```

Yup! It sucks...

Pure Latex solutions exist, such as:

- [doraTeX/coloremoji](https://github.com/doraTeX/coloremoji)
- [genericFJS/coloremoji.sty](https://github.com/genericFJS/coloremoji.sty)
- [alecjacobson/coloremoji.sty](https://github.com/alecjacobson/coloremoji.sty)
- [mreq/xelatex-emoji](https://github.com/mreq/xelatex-emoji)
- [zr-tex8r/BXcoloremoji](https://github.com/zr-tex8r/BXcoloremoji)

But they have the following issues:

- not up-to-date with the standard
- not up-to-date or maintained at all
- using complicated ways to find and replace the unicode characters
- not working well with xelatex
- dealing badly with unicode modifiers
- designed to be used in latex documents and not through pandoc with or w/o templates

## ⚗️ Our solution

Our solution is a command line tool that will:

- [x] - parse a stream or markdown file 
- [x] - look for emojis
- [x] - replace them with a latex snippet for pandoc
- [x] - echo output to `stdout`
- [x] - or save output to a file for later use

This is the latex snippet that we'll use:

```latex
\text{\includegraphics[width=1em,valign=t,raise=-0.1em]{emoji_image.pdf}
```


