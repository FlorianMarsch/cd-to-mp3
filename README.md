# Audio CD Ripping Script with VLC

This script automates the process of ripping audio CDs to MP3 format on macOS using VLC. It detects the first external volume, checks if it's an audio CD, prompts for user input when needed, and converts `.aiff` files to `.mp3` with proper naming conventions.

## Features

- Automatically detects the first external volume (excluding the internal hard drive).
- Prompts for a custom output folder name if the CD is detected as "Audio CD."
- Handles spaces in file and directory names by replacing them with underscores.
- Adds leading zeros to track numbers for proper ordering.
- Converts `.aiff` files from the CD to `.mp3` format using VLC with 192 kbps bitrate.
- Ejects the CD after completing the ripping process.

## Prerequisites

- **VLC**: Ensure VLC is installed and added to your PATH. You can install it via Homebrew:
  brew install --cask vlc

- **Bash Shell**: This script is written for the bash shell and assumes you are using macOS.

## Usage

1. Save the script to a file, for example, `rip_cd.sh`.

2. Make the script executable:
   chmod +x rip_cd.sh

3. Insert an audio CD into your drive.

4. Run the script:
   ./rip_cd.sh

5. If the detected CD volume is named "Audio CD," the script will prompt you to enter a custom output folder name. The name you enter will automatically have spaces replaced with underscores.

6. The script will rip and convert all `.aiff` files from the CD to `.mp3` format and save them in the specified folder.

### Example

If the CD is named "Audio CD" and contains tracks like `1 Audio Track.aiff`, the script will:

- Prompt you for a custom output name (e.g., `My_CD`).
- Save the `.mp3` files to a folder `My_CD/`, converting the track names to proper format (e.g., `01_Audio_Track.mp3`).

## Notes

- The script uses the `--intf dummy` and `--play-and-exit` flags with VLC to ensure a silent, headless operation.
- It processes all `.aiff` files in the detected CD volume.
- The CD is automatically ejected after the conversion is complete.

## Troubleshooting

- If VLC is not detected, ensure it's installed and accessible from your PATH. Check with:
  ```which vlc```

- If no files are found on the CD, ensure the CD is properly mounted and contains `.aiff` files.

## License

This script is provided as-is under the MIT License. Feel free to modify and use it according to your needs.

## Author

This script and its man was generated and tailored by the help of AI.