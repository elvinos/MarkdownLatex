# Markdown to LaTeX Dissertation Build Script

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
path2="$parent_path"/LatestBuild/ReportSections
path3="$parent_path"/LatestBuild
# Captures the date for later use
date=`date +"%m-%d-%y-%H%M"`
# # Move into the Sections folder
cd "$path2"

# Gather the files which together constitute a dissertation into one place. Add Section Files Here/ Aims.md Background.md Content.md > sectionbuild.md
###########
# Add the list of report sections here in the order you want them processed e.g cat section1.md section2.md section3.md > sectionbuild.md
###########

cat Introduction.md Conclusion.md > sectionbuild.md

# Copy into the build folder
cp  sectionbuild.md "$path3"/sectionbuild.md

# Move into the Build folder
cd "$path3"

# Run Pandoc to turn the markdown file with the bulk of the document into a .TeX file
pandoc -f markdown --pdf-engine=xelatex -i sectionbuild.md -o pandocked.tex

# Remove some of the junk that Markdown adds when converting to TeX.
sed -i .bak 's/\[<+->\]//g' "$path3"/pandocked.tex
sed -i .bak 's/\\def\\labelenumi{\\arabic{enumi}.}//g' "$path3"/pandocked.tex
sed -i .bak 's/\\itemsep1pt\\parskip0pt\\parsep0pt//g' "$path3"/pandocked.tex

# This turns the word "F0" into a pretty version, with a subscript.
perl -pi -w -e 's/F0/F\$_{0}\$/g;' "$path3"/pandocked.tex

# Concatenate the header file (with the preambles, TOC, etc), the pandoc-created TeX file, and the footer file (with the bibliography) into a single buildable TeX file
cat "$path3"/header.tex "$path3"/pandocked.tex "$path3"/footer.tex > "$path3"/Report.tex

cp Report.tex "$path3"/Aux/Report.tex

cd "$path3"/Aux

# Build the TeX once without stopping for errors (as the hyperref plugin throws errors on the first run)
# /Library/TeX/texbin/xelatex -output-driver="/Library/TeX/texbin/xdvipdfmx" -interaction=nonstopmode -synctex=1 Report.tex

# Render the bibliography based on the prior file
# /Library/TeX/texbin/bibtex Report

# Render the file twice more, to ensure that the bibliographical references are included and that the TOC reflects everything accurately
/Library/TeX/texbin/xelatex -output-driver="/Library/TeX/texbin/xdvipdfmx" -synctex=1 Report.tex
# /Library/TeX/texbin/xelatex -output-driver="/Library/TeX/texbin/xdvipdfmx" -synctex=1 Report.tex

# Copy the PDF and final TeX out of the build folder for accessibility
cp Report.tex "$parent_path"/LatestReport.tex
cp Report.pdf "$parent_path"/LatestReport.pdf

# Open the PDF generated in my PDF reader of choice
open /Applications/preview.app "$parent_path"/LatestReport.pdf

# Archives a copy of the md and tex files by date, leaving a trail of prior drafts
# tar cfvz "$path3"/latest.tar.gz sectionbuild.md Report.tex header.tex footer.tex
cd "$path3"

tar cfvz "$path3"/latest.tar.gz sectionbuild.md Report.tex header.tex footer.tex

# Rename the archived version, including the date generated.
mv "$path3"/latest.tar.gz "$parent_path"/Archive/rep_bu_$date.tar.gz

# killall Terminal
