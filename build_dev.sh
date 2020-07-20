#!/bin/sh
#git pull origin main
rm -rf www/dev
mkdir www/dev
mkdir www/dev/en
rm -rf _build/html
make html
cp -r _build/html/* www/dev/en/
cat LANG | while read ligne ; do
    echo $ligne
    rm -rf _build/html
    make -e SPHINXOPTS="-D language='$ligne'" html
    mkdir www/dev/$ligne
    cp -r _build/html/* www/dev/$ligne/
done

