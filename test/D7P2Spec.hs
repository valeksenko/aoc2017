{-# LANGUAGE OverloadedStrings #-}

module D7P2Spec (
    tests
) where

import Test.Tasty
import Test.Tasty.HUnit

import D7P1
import D7P2


tests :: TestTree
tests = testGroup "Tests" [unitTests]

unitTests :: TestTree
unitTests = testGroup "Unit tests"
    [
        testCase "weightadj: gives correct answer to the original problem" $ do
            61 @=? (weightadj $ Level (Program {name = "tknk", weight = 41, above = ["ugml","padx","fwft"]}) [Level (Program {name = "ugml", weight = 60, above = ["gyxo","ebii","jptl"]}) [Level (Program {name = "gyxo", weight = 61, above = []}) [],Level (Program {name = "ebii", weight = 58, above = []}) [],Level (Program {name = "jptl", weight = 61, above = []}) []],Level (Program {name = "padx", weight = 45, above = ["pbga","havc","qoyq"]}) [Level (Program {name = "pbga", weight = 66, above = []}) [],Level (Program {name = "havc", weight = 66, above = []}) [],Level (Program {name = "qoyq", weight = 66, above = []}) []],Level (Program {name = "fwft", weight = 72, above = ["ktlj","cntj","xhth"]}) [Level (Program {name = "ktlj", weight = 57, above = []}) [],Level (Program {name = "cntj", weight = 57, above = []}) [],Level (Program {name = "xhth", weight = 57, above = []}) []]])
    ]
