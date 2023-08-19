#!/usr/bin/env bash

# Get all aliases and functions defined in the current shell
aliases=$(alias)
functions=$(declare -F)

# Loop through each alias and print its name, definition, and description
while read -r line; do
  # Extract the alias name and definition from the line
  name=$(echo "$line" | cut -d'=' -f1)
  definition=$(echo "$line" | cut -d'=' -f2-)

  # Extract the description from the comment immediately following the alias definition
  description=$(echo "$definition" | sed -n 's/^# \(.*\)$/\1/p')

  # Print the alias name, definition, and description
  echo "Alias: $name"
  echo "Definition: $definition"
  echo "Description: $description"
  echo ""
done <<< "$aliases"

# Loop through each function and print its name, definition, and description
while read -r line; do
  # Extract the function name from the line
  name=$(echo "$line" | cut -d' ' -f3)

  # Extract the function definition from the line
  definition=$(echo "$line" | cut -d' ' -f4-)

  # Extract the description from the comment immediately before the function definition
  description=$(sed -n "/^# $name()/,/^{/p" < "$BASH_SOURCE" | sed '1d;$d')

  # Print the function name, definition, and description
  echo "Function: $name"
  echo "Definition: $definition"
  echo "Description: $description"
  echo ""
done <<< "$functions"