import Debug.Trace

main = do
  print (get_primes 500) 
  return ()

get_primes :: (Show a, Integral a) => a -> [a]
get_primes 1 = [2]
get_primes 2 = [2,3]
get_primes n = 
  foldl (\primes i -> primes ++ [(next_prime primes)]) (get_primes 2) [2..n]

next_prime :: (Show a, Integral a) => [a] -> a
--next_prime primes | trace ("next_prime " ++ show primes) False = undefined
next_prime primes = let
    last_prime = last primes
  in
    head $ filter (\num -> is_prime primes num) [last_prime, last_prime + 2..]

is_prime :: (Integral a) => (Show a) => [a] -> a -> Bool
is_prime primes n =
  foldl (\acc prime -> (if n `mod` prime == 0 then False else acc)) True primes
    
  
