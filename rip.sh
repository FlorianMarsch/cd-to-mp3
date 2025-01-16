first_external_volume=$(ls /Volumes | grep -v "Macintosh HD" | head -n 1)
OUTPUT="${first_external_volume// /_}"


# Check if the variable is "Audio_CD"
if [[ "$first_external_volume" == "Audio CD" ]]; then
  # Prompt the user for input
  read -p "The variable is Audio_CD. Please enter a value: " user_input
  echo "You entered: $user_input"
  OUTPUT="${user_input// /_}"
else
  echo "The variable is not Audio_CD. No input required."
fi




CD_PATH="/Volumes/$first_external_volume"
mkdir -p $PWD/$OUTPUT/

echo "Ripping: $CD_PATH to $PWD/$OUTPUT/"
which vlc
vlc -version

for file in "$CD_PATH"/*; do
    # Skip if no files are found
    if [ ! -e "$file" ]; then
        echo "No files found in $CD_PATH"
        exit 1
    fi

    # Print the file name
    echo "Processing: $file"
    filename=$(basename "$file" .aiff)".mp3"
    echo "export to: $filename"

    # Use regex to find a single-digit number at the start of the string
    if [[ $filename =~ ^([0-9])\ (.*) ]]; then
        # Add leading zero to the single-digit number
        filename="0${BASH_REMATCH[1]} ${BASH_REMATCH[2]}"
        echo "leading zero issue detected - auto adapt to: $filename ."
    fi



    destination=$PWD/$OUTPUT/$filename
    echo "export to: $destination ."
    
    # 
    vlc "$file" --sout "#transcode{acodec=mp3,ab=192}:std{access=file,mux=raw,dst=$destination}" --no-sout-display  --intf dummy --play-and-exit --verbose=0
    

    # Example: Perform some operation on each file
    # Replace with your desired commands
    # e.g., echo "File size: $(stat -c %s "$file") bytes"
done

echo "Finished! eject $CD_PATH."
diskutil eject "$first_external_volume"