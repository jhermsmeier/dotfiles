#!/usr/bin/env bash
PREVIOUS_PWD=$(pwd)
echo

if [[ ! -d "$(pwd)/config" ]]; then
  echo "Not in repository root, exiting"
  exit 1
fi

echo "Changing directory to '$(pwd)/config'"
cd "$(pwd)/config"

STATUS=0

for file in ./*; do
  if [ -d "$file" ]; then
    echo "Stowing $(basename $file)..."
    stow --restow --ignore='.DS_Store' --target=$HOME $(basename $file)
    EXIT_CODE=$?
    if [[ $EXIT_CODE -ne 0 ]]; then
      STATUS=$EXIT_CODE
    fi
  fi
done

echo "Changing directory to '$PREVIOUS_PWD'"
cd $PREVIOUS_PWD

exit $STATUS
