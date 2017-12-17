module D4P1 (
    checkpass
) where

checkpass :: String -> Bool
checkpass = alluniq . words
    where 
        alluniq [] = True
        alluniq (x:xs) = all (/=x) xs && alluniq xs
{-
http://adventofcode.com/2017/day/4

--- Day 4: High-Entropy Passphrases ---

A new system policy has been put in place that requires all accounts to use a passphrase instead of simply a password. A passphrase consists of a series of words (lowercase letters) separated by spaces.

To ensure security, a valid passphrase must contain no duplicate words.

For example:

aa bb cc dd ee is valid.
aa bb cc dd aa is not valid - the word aa appears more than once.
aa bb cc dd aaa is valid - aa and aaa count as different words.
The system's full passphrase list is available as your puzzle input. How many passphrases are valid?
-}