# Latex to Markdown Script

This is a GITHub project for for combining markdown files into a single LaTeX document.The project Then compiles using xelatex, using a beautiful report template packed with functionality.

The script archives old versions of the files as backups meaning no work is ever lost.

By using single markdown files to build the report, collaboration on a full report is easy to achieve using services like Evernote to create the individual text files then copy these across.

*Benefits of Markdown to Latex*
- Markdown is a simple and clean way to create formatting in plain text files, easy to use even for non latex users
- All the horrible formatting issues commonly found with word are avoided using beautiful Latex template.
- Only ever worry about content no more time wasted formatting.
- Collaborate Easily, send text files using evernote and let one person do the formatting, or have everyone install the tool and upload reveisions using githubs version control

### Requirements For Using Markdown to Latex

Homebrew (Optional)
Pandoc - Using Homebrew (Can use tarz) (Mac OSX) - **Used to convert from Markdown to Latex**

Text editor - atom recommended! Go to http://flight-manual.atom.io/getting-started/sections/installing-atom/

To install open the terminal
```
brew install pandoc
```
## Usage
Clone the git hub repository and check that the file structure is as follows:

> ~/Documents/LaTex/MarkdownLatex/

Otherwise edit the script.sh folders to match location on you local disk.

Click on the script.sh in text editor (atom). Using find replace (cmd + f), search

```
/LaTex/MarkdownLatex/
```
Replace
```
/Yourfilelocationhere/
```
*Tips*:
- Don't replace **LatestBuild/ReportSections** if cloned this will keep the structure for the files
- When white spaces are in path names terminal can get funny. For every white space in the path name use a \
  - e.g. cd ~/Documents/University/Year\ 4/Research\ and\ Communications/
- By dragging the folder into the terminal window this will copy the location with all the necessary white spaces already placed. Just cmd + c into find and replace.

Next:Add your markdown sections to:
> ~/Documents/LaTex/MarkdownLatex/LatestBuild/ReportSections

Change the line 11 in the script.sh file and add all the section files e.g :

```
# Gather the files which together constitute a dissertation into one place. Add Section Files Here
cat ~/Documents/LaTex/MarkdownLatex/LatestBuild/ReportSections/markdown.md > sectionbuild.md

# Change to:
cat ~/Documents/LaTex/MarkdownLatex/LatestBuild/ReportSections/section1.md section2.md > sectionbuild.md
```

Using the terminal type:

```
cd /Documents/LaTex/MarkdownLatex/
./script.sh
```
This moves to your MarkdownLatex Folder and the executes the script file which builds the latex document.

## LaTeX Build Functuion
The script currently will compiles the entire project into a single PDF.

### Requirements
For PDF output, you’ll also need LaTeX. Because a full MacTeX installation takes more than a gigabyte of disk space, we recommend installing BasicTeX (64M)-

Note this script compiles the LaTeX file into a pdf. - Can use other compilers if prefered.

To Remove this functionality comment out these lines in the script.sh file:
```
# Build the TeX once without stopping for errors (as the hyperref plugin throws errors on the first run)
/Library/TeX/texbin/xelatex -output-driver="/Library/TeX/texbin/xdvipdfmx" -interaction=nonstopmode -synctex=1 Report.tex

# Render the bibliography based on the prior file
/Library/TeX/texbin/bibtex Report

# Render the file twice more, to ensure that the bibliographical references are included and that the TOC reflects everything accurately
/Library/TeX/texbin/xelatex -output-driver="/Library/TeX/texbin/xdvipdfmx" -synctex=1 Report
/Library/TeX/texbin/xelatex -output-driver="/Library/TeX/texbin/xdvipdfmx" -synctex=1  Report

# Open the PDF generated in my PDF reader of choice
open /Applications/preview.app ~/Documents/LaTex/MarkdownLatex/LatestReport.pdf
```

## Usage

Edit the header.tex file with your name and report details. In the * NAMES & CLASS DEFINITION * Section.

For tables of contents, Acknowledgments, abstract edit them in the header.tex file

Other than that you wont need to use latex code! Isn't that what we all need.

This template uses the Avenir font which may need downloading (I have included a .ttc file in the folder, for mac double click to install), if you prefer another font type it into the header.tex file or remove this package completely for the standard and much loved latex font.

```
\usepackage{ifxetex,ifluatex}
\ifnum 0\ifxetex 1\fi\ifluatex 1\fi=0 % if pdftex
  \usepackage[T1]{fontenc}
  \usepackage[utf8]{inputenc}
\else % if luatex or xelatex
  \ifxetex
    \usepackage{mathspec}
    \setmainfont{Avenir-Light}
  \else
  % Font Package for XeLatex
    \usepackage{fontspec}
    \setmainfont{Avenir-Light}
  \fi
  \defaultfontfeatures{Ligatures=TeX,Scale=MatchLowercase}
\fi
```

## Further Work
- Documentation on all the report template features
- easy way to make sure script.sh file is targeted to the right location
- references to places to learn latex
- help with windows users
