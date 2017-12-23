module D7P1 (
    bottomname
  , Program(..)
) where

import Data.List

data Program =
    Program {
        name   :: String
      , weight :: Integer
      , above  :: [String]
    } deriving(Show, Eq)

data Tower a
    = Level a [Tower a]
    | Name String
    deriving(Show, Eq)

addAbove :: Program -> ([Tower Program], [Tower Program]) -> [Tower Program]
addAbove p (ns, t) = add $ span byName t
    where
        byName (Name n)       = (name p) /= n
        byName (Level _ ns)   = all byName ns
        add (l, [])           = (Level p ns):l
        add (l, e:l')         = (toTower e):l ++ l'
        toTower (Name n)      = if (name p) == n then (Level p ns) else (Name n)
        toTower (Level p' ns) = Level p' $ map toTower ns

addBelow :: [Tower Program] -> [String] -> ([Tower Program], [Tower Program])
addBelow t = foldr add ([], t)
    where
        add n (ns, l)            = toTower n ns $ span (byName n) l
        byName n (Level p _)     = (name p) /= n
        byName _ _               = True
        toTower n ns (l', [])    = ((Name n):ns, l')
        toTower _ ns (l', e:l'') = (e:ns, l' ++ l'')

bottomname :: [Program] -> String
bottomname [] = error "no bottom"
bottomname  l = name . bottom . head $ foldr build [] l
    where
        bottom (Level p _) = p
        build p t          = addAbove p . addBelow t $ above p

{-
http://adventofcode.com/2017/day/7

--- Day 7: Recursive Circus ---

Wandering further through the circuits of the computer, you come upon a tower of programs that have gotten themselves into a bit of trouble. A recursive algorithm has gotten out of hand, and now they're balanced precariously in a large tower.

One program at the bottom supports the entire tower. It's holding a large disc, and on the disc are balanced several more sub-towers. At the bottom of these sub-towers, standing on the bottom disc, are other programs, each holding their own disc, and so on. At the very tops of these sub-sub-sub-...-towers, many programs stand simply keeping the disc below them balanced but with no disc of their own.

You offer to help, but first you need to understand the structure of these towers. You ask each program to yell out their name, their weight, and (if they're holding a disc) the names of the programs immediately above them balancing on that disc. You write this information down (your puzzle input). Unfortunately, in their panic, they don't do this in an orderly fashion; by the time you're done, you're not sure which program gave which information.

For example, if your list is the following:

pbga (66)
xhth (57)
ebii (61)
havc (66)
ktlj (57)
fwft (72) -> ktlj, cntj, xhth
qoyq (66)
padx (45) -> pbga, havc, qoyq
tknk (41) -> ugml, padx, fwft
jptl (61)
ugml (68) -> gyxo, ebii, jptl
gyxo (61)
cntj (57)
...then you would be able to recreate the structure of the towers that looks like this:

                gyxo
              /     
         ugml - ebii
       /      \     
      |         jptl
      |        
      |         pbga
     /        /
tknk --- padx - havc
     \        \
      |         qoyq
      |             
      |         ktlj
       \      /     
         fwft - cntj
              \     
                xhth
In this example, tknk is at the bottom of the tower (the bottom program), and is holding up ugml, padx, and fwft. Those programs are, in turn, holding up other programs; in this example, none of those programs are holding up any other programs, and are all the tops of their own towers. (The actual tower balancing in front of you is much larger.)

Before you're ready to help them, you need to make sure your information is correct. What is the name of the bottom program?


-}