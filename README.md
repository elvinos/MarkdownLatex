# Latex to Markdown Script

This is a GITHub project for for combining markdown files into a single LaTeX document.The project Then compiles using xelatex, using a beautiful report template packed with functionality.

The script archives old versions of the files as backups meaning no work is ever lost.

By using single markdown files to build the report, collaboration on a full report is easy to achieve using services like Evernote to create the individual text files then copy these across.

*Benefits of Markdown to Latex*
- A beautiful robust template for creating reports!
- Markdown is a simple and clean way to create formatting in plain text files, easy to use even for non latex users
- All the horrible formatting issues commonly found with word are avoided using beautiful Latex template.
- Only ever worry about content no more time wasted formatting.
- Collaborate Easily, send text files using Evernote/ Github and let one person do the formatting, or have everyone install the tool and upload revisions using Github's version control

### Requirements For Using Markdown to Latex

Homebrew (Optional)
Pandoc - Using Homebrew (Can use tarz) (Mac OSX) - **Used to convert from Markdown to Latex**
LaTeX (Optional)

Text editor - Atom recommended! Go to http://flight-manual.atom.io/getting-started/sections/installing-atom/

Copy and paste text into Grammarly (it recognises Markdown) to proof read

To install open the terminal and type (if homebrew is installed)

```
brew install pandoc
```

## LaTeX Build Function
The script currently will compiles the entire project into a single PDF.

### Requirements
For PDF output, you’ll need LaTeX installed. I recommend installing BasicTeX (64M) rather than MacTeX (1Gb)

Note this script compiles the LaTeX file into a pdf. - Can use other compilers if preferred so this bit is optional.

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
1. Clone the git hub repository
2. Add .md sections of your new report to the ReportSections Folder. You can start writing up your report here.
3. Edit the run.sh and runquick.sh files with the list and order of these sections (see line 15)
4. Edit the title and author names on the header.tex file lines 165 onwards. Under:  **NAMES & CLASS DEFINITION**
5. Compile! Open up terminal change directory to the folder and run using ./run.sh

To Compiled Using the terminal type:

```
cd /Documents/yourreportlocation/
./run.sh
```

*Tips*:
- runquick.sh is a second file which compiles quicker. This is useful for quick edits but can produce issues with bibliographies
- You may need to give permission to use ./run.sh

```
cd /Documents/yourreportlocation/
sudo chmod -R a+rwx run.sh
sudo chmod -R a+rwx runquick.sh
```
- Add a bibliography using a free tool like BibDesk to update the `BibFiile.bib`
- Don't replace **LatestBuild/ReportSections** if cloned this will keep the structure for the files
- When white spaces are in path names terminal can get funny. For every white space in the path name use a
  - e.g. cd ~/Documents/University/Year\ 4/Research\ and\ Communications/
- By dragging the folder into the terminal window this will copy the location with all the necessary white spaces already placed. Just cmd + c into find and replace.

## Template Editing

Edit the header.tex file with your name and report details. In the * NAMES & CLASS DEFINITION * Section.

For tables of contents, Acknowledgments, abstract edit them in the header.tex file

Other than that you wont need to use latex code

This template uses the Avenir Next font which may need downloading (I have included a .ttc file in the folder, for mac double click to install), if you prefer another font type it into the header.tex file or remove this package completely for the standard and much loved latex font.

```
\usepackage{ifxetex,ifluatex}  %<<<<<<<<< Edit FONT HERE
\ifnum 0\ifxetex 1\fi\ifluatex 1\fi=0 % if pdftex
  \usepackage[T1]{fontenc}
  \usepackage[utf8]{inputenc}
\else % if luatex or xelatex
  \ifxetex
    \usepackage{mathspec}
    \setmainfont[
 BoldFont={AvenirNext-Medium},ItalicFont={AvenirNext-Italic},
 BoldItalicFont={AvenirNext-MediumItalic}]{AvenirNext-Regular}
  \else
  % Font Package for XeLatex
    \usepackage{fontspec}
    \setmainfont{AvenirNext-Regular}
  \fi
  \defaultfontfeatures{Ligatures=TeX,Scale=MatchLowercase}
\fi
```

## Further Work
- Documentation on all the report template features
- references to places to learn latex
- help with windows users
