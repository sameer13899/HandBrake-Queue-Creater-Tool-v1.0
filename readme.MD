## HandBrake Tool for creating 'queue.json' without worrying about the subdirectories and the files.

It will create everything at one go.

## How to Use this tool

1. Put the source folder inside 'input' folder.

2. Run the script 'hand-brake.sh'.

3. It will create 'output' folder with all files excluding media files.

4. And will also create a 'queue.json' file.

5. Load this 'queue.json' file in HandBrake and start encoding.

6. This 'queue.json' file will automatically put the converted files in the 'output' folder and inside it's subfolders respectively.

## Miscellaneous (How to modify 'hand-brake.sh' for handling files with other extensions)

1. This line is used to create copy of the directories and files, before encoding.

   rsync -a -f"+ _/" -f"- _.mp4" -f"- \*.m4v" input/ output/

   This can prevent 'mp4' and 'm4v' files from being copied. However, you can change it to exclude more file types. To add exclusion for more files types, see below:

   rsync -a -f"+ _/" -f"- _.mp4" -f"- _.m4v" -f"- _.ext1" -f"- _.ext2" -f"- _.ext3" input/ output/

2. This line checks for the file to process for encoding, before encoding.

   for i in $(find . -iname '_.mp4' -o -iname '_.m4v')

   This can process 'mp4' and 'm4v' files. However, you can change it to add more file types. To add more files for processing, see below:

   for i in $(find . -iname '_.mp4' -o -iname '_.m4v' -o -iname '_.ext1' -o -iname '_.ext2' -o -iname '\_.ext3')
