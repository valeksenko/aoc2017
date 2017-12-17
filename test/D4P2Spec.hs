{-# LANGUAGE OverloadedStrings #-}

module D4P2Spec (
    tests
) where

import Test.Tasty
import Test.Tasty.HUnit

import qualified D4P2


tests :: TestTree
tests = testGroup "Tests" [unitTests]

unitTests :: TestTree
unitTests = testGroup "Unit tests"
    [
        testCase "checkanagrams: gives correct answer to the original problem" $ do
            True  @=? D4P2.checkanagrams "abcde fghij"
            False @=? D4P2.checkanagrams "abcde xyz ecdab"
            True  @=? D4P2.checkanagrams "a ab abc abd abf abj"
            True  @=? D4P2.checkanagrams "iiii oiii ooii oooi oooo"
            False @=? D4P2.checkanagrams "oiii ioii iioi iiio"
    ]
