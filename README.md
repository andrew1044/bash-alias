# Bash Alias

Folders are for different environments. The shared folder containes all the useful aliases.

| Folder  | Env          | Description                 |
| ------- | ------------ | --------------------------- |
| shared  | all          | Shared alias's for all envs |
| aws-ap1 | windows6 box | windows dev box alias       |

## Sourcing files

Add the following to zshrc

### Individual file

``` bash
[[ ! -f ~/path/to/file ]] || source ~/path/to/file
```

### Directory

Recursive sourcing of files in a directory...

``` bash
ALIAS_DIR=/path/to/dir
if [ -d "$ALIAS_DIR" ];
then
    for file in $ALIAS_DIR/* ; do
      if [ -f "$file" ] ; then
        # echo "sourcing $file"
        . "$file"
      fi
    done
else
    echo "$ALIAS_DIR directory does not exist..."
fi
```

## SSH public key not working

ensure ssh agent is working

``` bash
eval `ssh-agent -s`
```

add ssh key

``` bash
ssh-add ~/.ssh/<ssh_key.key>
```
