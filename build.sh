#!/bin/bash
# TODO: ALL!

DIRS=(hello_world euclid prime500)

for dir in "${DIRS[@]}"
do
  echo $dir
  cd $dir
  rm -f $dir $dir.o $dir.hi
  hlint $dir.hs
  ghc -i ../common/common.hs $dir.hs
  if [[ 'test' == $1 ]]
  then 
    time ./$dir test
  fi
  cd ..
done

