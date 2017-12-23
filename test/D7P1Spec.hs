{-# LANGUAGE OverloadedStrings #-}

module D7P1Spec (
    tests
) where

import Test.Tasty
import Test.Tasty.HUnit

import D7P1


tests :: TestTree
tests = testGroup "Tests" [unitTests]

unitTests :: TestTree
unitTests = testGroup "Unit tests"
    [
        testCase "bottomname: gives correct answer to the original problem" $ do
            "tknk" @=? bottomname [Program "pbga" 66 [], Program "xhth" 57 [], Program "ebii" 61 [], Program "havc" 66 [], Program "ktlj" 57 [], Program "fwft" 72 ["ktlj", "cntj", "xhth"], Program "qoyq" 66 [], Program "padx" 45 ["pbga", "havc", "qoyq"], Program "tknk" 41 ["ugml", "padx", "fwft"], Program "jptl" 61 [], Program "ugml" 68 ["gyxo", "ebii", "jptl"], Program "gyxo" 61 [], Program "cntj" 57 []]
    ]
