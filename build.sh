#!/bin/bash

# See https://packaging.python.org/en/latest/tutorials/packaging-projects/
# Uses file pyproject.toml and ~/.pypirc
#
# Chris Joakim, December 2024

rm -rf dist/

python3 -m build

if [ "$1" = "explode" ]
then
    # explode the tar file and list its contents
    cd dist/
    gunzip ageqrp-0.1.0.tar.gz
    tar tvf ageqrp-0.1.0.tar > ageqrp.tar.contents.txt
    tar xvf ageqrp-0.1.0.tar
    cat ageqrp.tar.contents.txt
    cd ..
else
    echo "next steps:"
    echo "  python3 -m twine upload --repository testpypi dist/*"
    echo "  python3 -m twine upload --repository pypi dist/*"
fi
