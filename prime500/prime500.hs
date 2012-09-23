-- Copyright (c) 2012 Jarosław Skrzypek

import System.Environment
import Debug.Trace
import Test.HUnit
import Common

main = do
  args <- getArgs
  runTestsOrInteractive args runTests runInteractive
  return ()

getPrimes :: (Show a, Integral a) => a -> [a]
getPrimes 1 = [2]
getPrimes 2 = [2,3]
getPrimes n =
  foldl (\primes i -> primes ++ [nextPrime primes]) (getPrimes 2) [2..n]

nextPrime :: (Show a, Integral a) => [a] -> a
--nextPrime primes | trace ("nextPrime " ++ show primes) False = undefined
nextPrime primes = let
    last_prime = last primes
  in
    head $ filter (isPrime primes) [last_prime + 2, last_prime + 4..]

isPrime :: (Integral a, Show a) => [a] -> a -> Bool
--isPrime primes n | trace ("isPrime " ++ show primes ++ " n " ++ show n) False = undefined
isPrime primes n = let
    sqrtN = ceiling . sqrt . fromIntegral $ n
    primesToCheck = takeWhile (<= sqrtN) primes
  in
    foldl (\acc prime -> (if n `mod` prime == 0 then False else acc)) True primesToCheck

runInteractive =
  print $ getPrimes 500

runTests = do
  runTestTT $ TestList [test1, test2, test500]
  return ()

test1 = TestCase $ assertEqual
  "First prime should be 2"
  2
  (last $ getPrimes 1)

test2 = TestCase $ assertEqual
  "Second prime should be 3"
  3
  (last $ getPrimes 2)

test500 = TestCase $ assertEqual
  "500 prime should be 3581"
  3581
  (last $ getPrimes 500)

