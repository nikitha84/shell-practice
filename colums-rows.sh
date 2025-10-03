#!/bin/bash
file="file1.txt"

names=()
ages=()

while IFS= read -r line; do
    words=($line)
    names+=("${words[0]}")
    ages+=("${words[1]}")
done < "$file"

echo "Names: ${names[@]}"
echo "Ages: ${ages[@]}"
