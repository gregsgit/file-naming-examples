# File Renaming Examples

Given a list of (number, name) pairs in a file, how do we go through a
folder and rename files from "number.wav" to "name-number.wav"
according to those pairs?

Suppose the renaming file is named `code-to-bird.txt` and contains:

```
58456,Tawny Eagle
36753,Besra
577,Shikra
```

And suppose you have a folder containing the following files:

```
58456.wav, 36753.wav, 577.wav
```

You would like to copy those files to:

```
TawnyEagle-58456.wav, Besra-3673.wav, Shikra-577.wav
```

in a new folder

The simplest approach, assuming you have access to a command line that
understands commands such as `cp oldname newname`, is to generate a
script that is simply a list of commands, such as:

```
cp 58456.wav ../renamed-files/TawnyEagle-58456.wav
cp 3673.wav ../renamed-files/Besra-3673.wav
cp 577.wave ../renamed-files/Shikra-577.wav
```

Suppose the generated script is named `do-copies.sh`. Then at a
linux/unix command prompt, you do:

```
cd <wherever your files are>
<wherever do-copies.sh is>/do-copies.sh
```

# Cleaning code-to-bird list

The first thing is to clean up code-to-bird.txt. I did:

1. Removed spaces in bird names. Ex. "Yellow Bittern" -> "YellowBittern".
2. Got rid of empty lines such as ","
3. Replaced "(" and ")" with "_",
4. Got rid of "'" (single quotes).
5. God rid of weird unicode character, "ÿ"

Finally, I replaced "," with " " (space) so that can use bash's built-in "read" function.

The script to read `code-to-bird.txt` and generate a script named `do-copies.sh` is pretty simple:

```
#!/usr/bin/env bash
echo "#!/usr/bin/env bash" > do-copies.sh
chmod +x do-copies.sh
echo "mkdir -p ../renamed-files" >> do-copies.sh
while read id name; do
    echo "cp -v ${id}.WAV ../renamed-files/${name}-${id}.WAV" >> do-copies.sh
done<code-to-bird.txt
```

The first 5 lines of the generated `do-copies.sh` file are:

```
#!/usr/bin/env bash
mkdir -p ../renamed-files
cp 70200.WAV ../renamed-files/Forestwagtail-70200.WAV
cp 178590.WAV ../renamed-files/Forestwagtail-178590.WAV
cp 207515.WAV ../renamed-files/RosyStarling-207515.WAV
```

