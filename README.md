This repo is intended to be dropped directly into the `.emacs.d/private` of a
spacemacs configuration. 

## Bootstrapping a new installation
```
# go your home directory, or wherever you want .emacs.d
cd ~

# (optional) move any existing .emacs.d out of the way
mv .emacs.d .emacs.d.BACKUP

git clone https://github.com/syl20bnr/spacemacs.git .emacs.d
cd .emacs.d
cd private
git clone git@github.com:jobvisser03/spacemacs_layers.git
cp ./dot.spacemacs ~/.spacemacs
# ...edit ~/.spacemacs as necessary, e.g. for ycmd paths, etc...
```

