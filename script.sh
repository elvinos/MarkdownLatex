# Will Styler
# Markdown to LaTeX Dissertation Build Script

# Captures the date for later use
date=`date +"%m-%d-%y-%H%M"`

# Move into the build folder
cd ~/Documents/LaTex/MarkdownLatex/LatestBuild/

# Gather the files which together constitute a dissertation into one place.
cat ~/Documents/LaTex/MarkdownLatex/LatestBuild/markdown.md > sectionbuild.md

# These two are actually TeX files, but I call them .md so I can edit them on an iPad
# cat ~/Documents/dissertation/header.md > header.tex
# cat ~/Documents/dissertation/footer.md > footer.tex

# Run Pandoc to turn the markdown file with the bulk of the document into a .TeX file
pandoc -f markdown --latex-engine=xelatex -R -i sectionbuild.md -s -o pandocked.tex

# Remove some of the junk that Markdown adds when converting to TeX.
sed -i .bak 's/\[<+->\]//g' ~/Documents/LaTex/MarkdownLatex/LatestBuild/pandocked.tex
sed -i .bak 's/\\def\\labelenumi{\\arabic{enumi}.}//g' ~/Documents/LaTex/MarkdownLatex/LatestBuild/pandocked.tex
sed -i .bak 's/\\itemsep1pt\\parskip0pt\\parsep0pt//g' ~/Documents/LaTex/MarkdownLatex/LatestBuild/pandocked.tex

# This turns the word "F0" into a pretty version, with a subscript.
perl -pi -w -e 's/F0/F\$_{0}\$/g;' ~/Documents/LaTex/MarkdownLatex/LatestBuild/pandocked.tex

# Concatenate the header file (with the preambles, TOC, etc), the pandoc-created TeX file, and the footer file (with the bibliography) into a single buildable TeX file
cat ~/Documents/LaTex/MarkdownLatex/LatestBuild/header.tex ~/Documents/LaTex/MarkdownLatex/LatestBuild/pandocked.tex ~/Documents/LaTex/MarkdownLatex/LatestBuild/footer.tex > ~/Documents/LaTex/MarkdownLatex/LatestBuild/Report.tex

# Copy the PDF and final TeX out of the build folder for accessibility
cp Report.tex ~/Documents/LaTex/MarkdownLatex/LatestReport.tex

# Archives a copy of the md and tex files by date, leaving a trail of prior drafts
tar cfvz ~/Documents/LaTex/MarkdownLatex/LatestBuild/latest.tar.gz sectionbuild.md Report.tex header.tex footer.tex

# Rename the archived version, including the date generated.
mv ~/Documents/LaTex/MarkdownLatex/LatestBuild/latest.tar.gz ~/Documents/LaTex/MarkdownLatex/Archive/rep_bu_$date.tar.gz
