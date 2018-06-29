#!/usr/bin/env bash
echo "#!/usr/bin/env bash" > do-copies.sh
chmod +x do-copies.sh
echo "mkdir -p ../renamed-files" >> do-copies.sh
while read id name; do
    echo "cp -v ${id}.WAV ../renamed-files/${name}-${id}.WAV" >> do-copies.sh
done<code-to-bird.txt
