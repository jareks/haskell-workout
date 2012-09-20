import Debug.Trace

main = do
  print (is_prime [] 2)
  print (is_prime [2] 3)
  print (is_prime [2,3] 4)

  print (get_primes 500 [3]) 
  return ()

get_primes :: (Show a) => (Integral a) => a -> [a] -> [a]
--get_primes n primes | trace ("get_primes " ++ show primes ++ " " ++ show n) False = undefined
get_primes 0 primes = primes
get_primes n primes = 
  get_primes (n - 1) (primes++[(next_prime primes)])

next_prime :: (Show a) => (Integral a) => [a] -> a
--next_prime primes | trace ("next_prime " ++ show primes) False = undefined
next_prime primes = let
    c = (last primes) + 2
  in
    if is_prime primes c
    then
      c
    else
      next_prime_after primes c

next_prime_after :: (Show a) => (Integral a) => [a] -> a -> a
--next_prime_after primes c | trace ("next_prime_after " ++ show primes ++ " " ++ show c) False = undefined
next_prime_after primes c = 
  if is_prime primes (c + 2)
  then
    c + 2
  else
    next_prime_after primes (c + 2)

is_prime :: (Integral a) => (Show a) => [a] -> a -> Bool
is_prime primes n =
  foldl (\acc prime -> 
   -- trace 
   --   ("mod "  ++ show n ++ " mod " ++ show prime ++ " = "++ show (n `mod` prime)) 
        (if n `mod` prime == 0 then False else acc)
      ) 
      True primes
    
  
