# plsopen
Small awk script that opens stuff for you.

# Functionality
Currently only supports opening HTML files that have been downloaded using
`scp`

## scp
If you are downloading files from a remote host using

```
scp -r USER_HOST:/path/to/my-file.html dest/path/
```

you can instead pipe it along to `plsopen` to directly open it using `xdg-open`
after the file has been downloaded.

```
scp -r USER_HOST:/path/to/my-file.html dest/path/ && fc -l -n -1 | ./plsopen.awk
```

currently working on getting stuff to work without having to pipe the command
history into `plsopen`.
