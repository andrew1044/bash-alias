# Bash Alias

Folders are for different environments. The shared folder containes all the useful aliases.

| Folder  | Env          | Description                 |
| ------- | ------------ | --------------------------- |
| shared  | all          | Shared alias's for all envs |
| aws-ap1 | windows6 box | windows dev box alias       |

## Sourcing files

Add the following to `.bashrc`/`.zshrc`

### Individual file

``` bash
[[ ! -f ~/path/to/file ]] || source ~/path/to/file
```

### Directory

Recursive sourcing multiple files in multiple directories

``` bash
# Define array of directory paths
ALIAS_DIRS=(
    /path/to/dir1
    /path/to/dir2
    /path/to/dir3
)

for ALIAS_DIR in "${ALIAS_DIRS[@]}"; do
  if [ -d "$ALIAS_DIR" ]; then
    for file in "$ALIAS_DIR"/*; do
      if [ -f "$file" ]; then
        # echo "sourcing $file" # testing
        . "$file"
      fi
    done
  else
    echo "$ALIAS_DIR directory does not exist..."
  fi
done
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
