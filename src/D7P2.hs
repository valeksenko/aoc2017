module D7P2 (
    weightadj
  , Weight(..)
) where

import Data.Function (on)
import Data.Ord (comparing)
import Data.List
import Data.Maybe
import D7P1

data Weight =
    Weight {
        discW  :: Integer
      , totalW :: Integer
    } deriving(Show, Eq)


discWeight :: Tower Weight -> Integer
discWeight (Level d _) = (discW d) + (totalW d)

unbalancedSibling :: [Tower Weight] -> Maybe (Tower Weight)
unbalancedSibling = findU . groupBy ((==) `on` discWeight) . sortBy (comparing discWeight)
    where
        findU [_] = Nothing
        findU l   = find sizeOne l >>= Just . head
        sizeOne x = length x == 1

unbalancedTower :: Tower Weight -> Maybe (Tower Weight, Integer)
unbalancedTower (Level w l) = unbalancedSibling l >>= lastU
    where
        lastU u@(Level w' l') = maybe (Just (u, balancedW u)) (Just . id) $ unbalancedTower u
        balancedW u           = discWeight . head $ delete u l

weightTower :: Tower Program -> Tower Weight
weightTower (Level p l) = Level (Weight (weight p) (foldr total 0 l)) $ map weightTower l
    where
        total (Level p' l') t = foldr total (t + (weight p')) l'
   
weightadj :: Tower Program -> Integer
weightadj = maybe 0 adj . unbalancedTower . weightTower 
    where
        adj (Level u _, bw) = bw - (totalW u)        
        
{-
http://adventofcode.com/2017/day/7

--- Part Two ---

The programs explain the situation: they can't get down. Rather, they could get down, if they weren't expending all of their energy trying to keep the tower balanced. Apparently, one program has the wrong weight, and until it's fixed, they're stuck here.

For any program holding a disc, each program standing on that disc forms a sub-tower. Each of those sub-towers are supposed to be the same weight, or the disc itself isn't balanced. The weight of a tower is the sum of the weights of the programs in that tower.

In the example above, this means that for ugml's disc to be balanced, gyxo, ebii, and jptl must all have the same weight, and they do: 61.

However, for tknk to be balanced, each of the programs standing on its disc and all programs above it must each match. This means that the following sums must all be the same:

ugml + (gyxo + ebii + jptl) = 68 + (61 + 61 + 61) = 251
padx + (pbga + havc + qoyq) = 45 + (66 + 66 + 66) = 243
fwft + (ktlj + cntj + xhth) = 72 + (57 + 57 + 57) = 243
As you can see, tknk's disc is unbalanced: ugml's stack is heavier than the other two. Even though the nodes above ugml are balanced, ugml itself is too heavy: it needs to be 8 units lighter for its stack to weigh 243 and keep the towers balanced. If this change were made, its weight would be 60.

Given that exactly one program is the wrong weight, what would its weight need to be to balance the entire tower?
-}