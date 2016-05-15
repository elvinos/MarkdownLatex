# Latex to Markdown Script

Script for combining markdown files into a single LaTeX document. Then compiles using xelatex

The script archives old verisons of the files as backups

### Requirements

Homebrew (Optional)
Pandoc - Using Homebrew (Can use tarz) (Mac OSX)

To install open the terminal
```
brew install pandoc
```

## Usage
Clone the git hub repository and check that the file structure is as follows:

> ~/Documents/LaTex/MarkdownLatex/

Otherwise edit the script.sh folders to match location on you local disk.

Add your markdown sections to:
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
This moves to your MarkdownLatex Folder and the exectutes the script file which builds the latex document.



## LaTeX Build
The script currently will complie the entire projct into a single PDF.

### Requirements
For PDF output, you’ll also need LaTeX. Because a full MacTeX installation takes more than a gigabyte of disk space, we recommend installing BasicTeX (64M)-

Note this script compiles the LaTeX file into a pdf. - Can use other compilers if prefered.

To Remove this functionality comment out these lines:
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
