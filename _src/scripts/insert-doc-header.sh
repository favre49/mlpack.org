#!/bin/bash
#
# Insert a couple extra entries into the header for the documentation page that
# is generated by the Markdown bindings for mlpack.
#
# $1: input
# $2: output

cat $1 | \
awk '

/^<div id=\"header\" markdown=\"1\">/,/^<\/form>/ {
  next;
}

/^ - \[mlpack overview\]\(#mlpack-overview\)\{: .language-link #always \}/ {
  print " - [overview](#overview){: .language-link #always }";
  print " - [quickstart](#quickstart){: .language-link #always }";
  print " - [tutorials](#tutorials){: .language-link #always }";
  next;
}

// {
  print $0;
}
' |\
head -n-2 > $2;

# The 'head' removes the last extra </div>.

grep '    <option value' $1;
