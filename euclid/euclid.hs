import System.Environment
import Test.HUnit
import Common

main = do
  args <- getArgs
  runTestsOrInteractive args runTests runInteractive
  return ()

gcd2 :: (Integral num) => num -> num -> num
gcd2 m n = 
   let r = m `mod` n
   in if r == 0 
    then n
    else gcd2 n r 
     
runInteractive = do
  putStrLn "Enter m"
  lineM <- getLine
  putStrLn "Enter n"
  lineN <- getLine
  let 
    m = read lineM :: Int
    n = read lineN :: Int

  --putStrLn (show (gcd2 m n))
  -- putStrLn $ show (gcd2 m n)
  print $ gcd2 m n
  return ()

testGcd = TestCase $ assertEqual 
  "GCD for 60 and 45 should be 15" 
  15 
  (gcd2 60 45)

testGcd2 = TestCase $ assertEqual 
  "GCD for 45 and 60 should be 15" 
  15 
  (gcd2 45 60)

testGcd3 = TestCase $ assertEqual 
  "GCD for 11 and 7 should be 1" 
  1 
  (gcd2 11 7)

runTests = do 
  runTestTT $ TestList [testGcd, testGcd2, testGcd3]
  return ()
  

