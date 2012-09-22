-- Copyright (c) 2012 Jarosław Skrzypek

module Common where

import System.Environment
  
runTestsOrInteractive args tests interactive =
  if null args || head args /= "test"
  then interactive
  else tests
