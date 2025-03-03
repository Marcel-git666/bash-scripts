#!/bin/bash
# Script to download a small text file and view it
# Set the URL and output file
URL="https://raw.githubusercontent.com/torvalds/linux/master/README"
OUTPUT_FILE="linux_readme.txt"

if [ -f "$OUTPUT_FILE" ]; then
    read -p "File $OUTPUT_FILE already exists, do you need to update it? (y/n): " update

    if [ "$update" = "y" ] || [ "$update" = "Y" ]; then
        # Download the file
        echo "Downloading $URL..."
        curl -o "$OUTPUT_FILE" "$URL"
    else
        echo "Using previously downloaded file"
    fi
fi

# Check if download was successful
if [ $? -eq 0 ]; then
    echo "File downloaded successfully as $OUTPUT_FILE"

    # Ask if user wants to view the file
    read -p "Do you want to view the downloaded file? (y/n): " view_choice

    if [ "$view_choice" = "y" ] || [ "$view_choice" = "Y" ]; then
        # View the file with head or tail based on input
        read -p "How many lines do you wish to read? (positive for beginning, negative for end): " number_of_lines

        # Check if input is a number
        if [[ "$number_of_lines" =~ ^-?[0-9]+$ ]]; then
            if [ $number_of_lines -gt 0 ]; then
                # Positive number - use head
                head -n$number_of_lines "$OUTPUT_FILE"
            elif [ $number_of_lines -lt 0 ]; then
                # Negative number - use tail, but convert to positive
                # No need to multiply by -1, tail accepts negative numbers directly
                tail -n${number_of_lines#-} "$OUTPUT_FILE"
            else
                echo "You entered 0. No lines will be displayed."
            fi
        else
            echo "Invalid input. Please enter a number."
        fi
    fi
else
    echo "Failed to download the file."
fi
