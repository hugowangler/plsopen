#!/usr/bin/awk -f

# opens the html file that has been downloaded using scp
# assumes an input of:
#   scp -flag1 -flag2 ssh_stuff:/path/to/my-file.html dest/path 
$1 == "scp" {
  for (i=2; i <= NF; i++) {
    # skip all the flags at start (e.g. -r)
    if ($i !~ /^\-/) {
      file = i
      break
    }
  }
  # discard everything in path until the file name part e.g. my-file.html
  sub(/.*\//, "", $file) 
  dest = i+1
  if ($dest ~ /.*\/$/) {
    sub(/\/$/, "", $dest)
  }
  path = $(i+1)"/"$file
  cmd = system("open " path " 2>/dev/null")
}

