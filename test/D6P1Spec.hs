{-# LANGUAGE OverloadedStrings #-}

module D6P1Spec (
    tests
) where

import Test.Tasty
import Test.Tasty.HUnit

import qualified D6P1


tests :: TestTree
tests = testGroup "Tests" [unitTests]

unitTests :: TestTree
unitTests = testGroup "Unit tests"
    [
        testCase "numcycles: gives correct answer to the original problem" $ do
            5  @=? D6P1.numcycles [ 0, 2, 7, 0]
    ]
