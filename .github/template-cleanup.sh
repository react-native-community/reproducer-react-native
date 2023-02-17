#!/bin/bash

IFS='/' read -ra REPOARR <<< "$GITHUB_REPOSITORY"
echo "Repository: ${REPOARR[0]}"
echo "Repository: ${REPOARR[1]}"

rm README.md
mv .github/template-cleanup/README.md README.md
rm .github/workflows/cleanup.yml
rm .github/template-cleanup.sh
sed -i '' -e "s~%REPOSITORY%~$GITHUB_REPOSITORY~g" README.md
sed -i '' -e "s~%NAME%~${REPOARR[1]}~g" README.md