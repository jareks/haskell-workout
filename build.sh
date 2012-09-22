#!/bin/bash
# TODO: ALL!

DIRS=(hello_world euclid prime500)

for dir in "${DIRS[@]}"
do
  echo $dir
  cd $dir
  ghc $dir.hs
  if [[ 'test' == $1 ]]
  then 
    ./$dir test
  fi
  cd ..
done

