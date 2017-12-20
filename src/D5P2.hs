module D5P2 (
    numsteps
) where

import Data.List

type Offset = Int

data Jump =
    Jump {
        cnt    :: Int
      , offset :: Offset
      , left   :: [Offset]
      , right  :: [Offset]
    }

go :: Jump -> Int
go (Jump c o l r)
    |  o > (length r) = c
    | -o > (length l) = c
    | o == 0          = go $! Jump (c + 1) (o + 1) l r
    | o < 0           =
        let
            (l', (o':r'')) = splitAt (length l + o) l
            r' =  concat [r'', [o + 1], r]
        in
            go $! Jump (c + 1) o' l' r'
    | otherwise       =
        let
            (l'', (o':r')) = splitAt (o - 1) r
            o'' = if o > 2 then o - 1 else o + 1 
            l' = concat [l, [o''], l'']
        in
            go $! Jump (c + 1) o' l' r'

numsteps :: [Offset] -> Int
numsteps []     = 0
numsteps (x:xs) = go $ Jump 1 x [] xs


{-
http://adventofcode.com/2017/day/5

--- Part Two ---

Now, the jumps are even stranger: after each jump, if the offset was three or more, instead decrease it by 1. Otherwise, increase it by 1 as before.

Using this rule with the above example, the process now takes 10 steps, and the offset values after finding the exit are left as 2 3 2 3 -1.

How many steps does it now take to reach the exit?
-}