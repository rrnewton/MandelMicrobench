{-# LANGUAGE BangPatterns #-}

import Data.Complex

mandel :: Int -> Complex Double -> Int
mandel max_depth c = loop 0 0
 where   
  loop i !z
     | i == max_depth     = i
     | mag3 z >= 2.0 = i
     | otherwise          = loop (i+1) (z*z + c)

  -- This shaves it down to 870ms:
  mag :: (RealFloat a) => Complex a -> a
  mag (x:+y) = scaleFloat k (sqrt (sqr (scaleFloat mk x) + 
                                   sqr (scaleFloat mk y)))
                 where k  = max (exponent x) (exponent y)
                       mk = - k
                       sqr z = z * z
  
  -- This collapses the running time to a mere 38ms:
  mag2 :: Complex Double -> Double
  mag2 (x:+y) = sqrt (sqr x + sqr y)
  sqr z = z * z
                   
  -- This uses OCaml's approach at overflow-avoidance:
  mag3 :: Complex Double -> Double
  mag3 (x:+y) = 
      if      r == 0 then i
      else if i == 0 then r   
      else if r >= i then let q = i / r in r * sqrt(1 + q*q)
      else                let q = r / i in i * sqrt(1 + q*q)
    where r = abs x
          i = abs y  
          
main = print$ mandel (5 * 1000 * 1000) (0.1 :+ 0.1)

