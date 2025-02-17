#!/bin/bash

echo "========== Finding Files =========="
# Find all Python files in the current directory and subdirectories
echo "Finding all Python files..."
find . -name "*.py"

echo -e "\nFinding large log files (greater than 10MB)..."
find . -name "*.log" -size +10M

echo -e "\nUsing fd (if installed) to find text files..."
if command -v fd &> /dev/null; then
    fd -e txt
else
    echo "fd not installed. Skipping..."
fi

echo -e "\n========== Searching Inside Files =========="
# Find occurrences of "TODO" inside source code files
echo "Searching for 'TODO' comments..."
grep -R "TODO" .

echo -e "\nUsing ripgrep (rg) for faster searching..."
if command -v rg &> /dev/null; then
    rg "TODO"
else
    echo "ripgrep (rg) not installed. Skipping..."
fi

echo -e "\n========== Searching Command History =========="
# Show last 10 history entries
echo "Last 10 commands used:"
history | tail -n 10

# Searching history for "find"
echo -e "\nSearching for previous 'find' commands..."
history | grep "find"

echo -e "\nUsing fzf (if installed) for interactive history search..."
if command -v fzf &> /dev/null; then
    history | fzf
else
    echo "fzf not installed. Skipping..."
fi

echo -e "\n========== Directory Navigation =========="
# Check if autojump or fasd is available
if command -v z &> /dev/null; then
    echo "Jumping to 'projects' directory using fasd..."
    z projects
elif command -v j &> /dev/null; then
    echo "Jumping to 'projects' directory using autojump..."
    j projects
else
    echo "fasd/autojump not installed. Skipping..."
fi

# Show directory structure using tree
echo -e "\nDisplaying directory structure..."
if command -v tree &> /dev/null; then
    tree -L 2
else
    echo "tree not installed. Skipping..."
fi

echo -e "\n========== Script Execution Completed =========="
