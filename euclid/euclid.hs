main = do
  putStrLn "Enter m"
  lineM <- getLine
  putStrLn "Enter n"
  lineN <- getLine
  let 
    m = read lineM :: Int
    n = read lineN :: Int

  --putStrLn (show (gcd2 m n))
  putStrLn $ show (gcd2 m n)
  return ()

gcd2 :: (Integral num) => num -> num -> num
gcd2 m n = 
   let r = m `mod` n
   in if r == 0 
    then n
    else gcd2 n r 
     
