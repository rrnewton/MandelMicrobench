  
import Data.Complex

-- This should be the biggest representable double:
big :: Double
big = 1.7976931348623157e308

-- This uses OCaml's approach at overflow-avoidance:
mag :: Complex Double -> Double
mag (x:+y) = 
    if      r == 0 then i
    else if i == 0 then r   
    else if r >= i then let q = i / r in r * sqrt(1 + q*q)
    else                let q = r / i in i * sqrt(1 + q*q)
  where r = abs x
        i = abs y  

t0 = mag (big :+ big) -- Inf
t1 = mag (0 :+ big) 
t2 = mag (big :+ 0) 

t3 = magnitude (big :+ big)  -- Inf (has to be)

biggish = big / 2
t4 = magnitude (biggish :+ biggish) 
t5 = mag       (biggish :+ biggish) 

t6 = sqrt (biggish * biggish + biggish * biggish)

------------------------------------------------------------
-- Scrap

maxNonInfiniteFloat :: RealFloat a => a -> a
maxNonInfiniteFloat a = encodeFloat m n where
    b = floatRadix a
    e = floatDigits a
    (_, e') = floatRange a
    m = b ^ e - 1
    n = e' - e
    
minPositiveFloat :: RealFloat a => a -> a
minPositiveFloat a = encodeFloat 1 $ fst (floatRange a) - floatDigits a    
