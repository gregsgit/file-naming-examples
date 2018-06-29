# File Renaming Examples

Given a list of (oldname, newname) pairs in a file, how do we go
through a folder and rename files according to those pairs?

Suppose the renaming file is named `file-rename-list.txt` and contains:

```
oldname1, newname1
oldname2, newname2
oldname3, newname3
```

And suppose you have a folder containing the following files:

```
oldname1 randomfile1 oldname2 randomefile2 oldname3
```

The simplest approach, assuming you have access to a command line that
understands commands such as `mv oldname newname`, is to generate a
script that is simply a list of commands, such as:

```
mv oldname1 newname1
mv oldname2 newname2
mv oldname3 newname3
```

Suppose the generated script is named `do-renames.sh`. Then at a
linux/unix command prompt, you do:

```
cd <wherever your files are>
chmod +x do-renames.sh
./do-renames.sh
```

The three lines above do:

1. make your "current working directory" where your
   files-to-be-renamed live. For example, if your files live in a
   folder called `Downloads` under your home folder, you would type:

   ```
   cd ~/Downloads
   ```

2. Make the script `do-renames.sh` "executable" according to the shell

3. Invoke the script.


