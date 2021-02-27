# bash completion scripts

To use these, check the repo out at your root directory so you have
a folder called `bash_completions`

```shell
cd ~
git co git@github.com:bunnymatic/bash_completions.git
```

Add the following to your `.bashrc` or `.profile`

```shell
if [ -d ~/bash_completions/ ]; then
  # regex here is to exclude emacs tmp files
  for script in ~/bash_completions/completion-*[^~]; do
    . $script
  done
fi
```

