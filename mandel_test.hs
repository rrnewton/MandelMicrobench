{-# LANGUAGE BangPatterns #-}

import Data.Complex

mandel :: Int -> Complex Double -> Int
mandel max_depth c = loop 0 0
  where   
   loop i !z
     | i == max_depth     = i
     | magnitude z >= 2.0 = i
     | otherwise          = loop (i+1) (z*z + c)

main = print$ mandel (5 * 1000 * 1000) (0.1 :+ 0.1)

