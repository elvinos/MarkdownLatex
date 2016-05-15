### Latex to Markdown Script

Script for combining markdown files into a single LaTeX document.

The script archives old verisons of the files as backups

##Requirements
Pandoc - Using Homebrew
```
brew install pandoc
```
For PDF output, you’ll also need LaTeX. Because a full MacTeX installation takes more than a gigabyte of disk space, we recommend installing BasicTeX (64M)

Note this sciprt does not combile the LaTeX file into a pdf - instead use LaTeX - Plus package in atom.

To add this functionality copy and edit these lines:
```
# Build the TeX once without stopping for errors (as the hyperref plugin throws errors on the first run)
/usr/texbin/xelatex -output-driver="/usr/texbin/xdvipdfmx" -interaction=nonstopmode -synctex=1 Stylerdissertation

# Render the bibliography based on the prior file
/usr/texbin/bibtex Stylerdissertation

# Render the file twice more, to ensure that the bibliographical references are included and that the TOC reflects everything accurately
/usr/texbin/xelatex -output-driver="/usr/texbin/xdvipdfmx" -synctex=1 Stylerdissertation
/usr/texbin/xelatex -output-driver="/usr/texbin/xdvipdfmx" -synctex=1  Stylerdissertation

# Open the PDF generated in my PDF reader of choice
open /Applications/Skim.app ~/Documents/dissertation/0_build/Stylerdissertation.pdf
```
