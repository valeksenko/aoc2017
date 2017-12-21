{-# LANGUAGE OverloadedStrings #-}

module D6Spec (
    tests
) where

import Test.Tasty
import Test.Tasty.HUnit

import qualified D6


tests :: TestTree
tests = testGroup "Tests" [unitTests]

unitTests :: TestTree
unitTests = testGroup "Unit tests"
    [
        testCase "numcycles: gives correct answer to the original problem" $ do
            5  @=? D6.numcycles [ 0, 2, 7, 0]

      , testCase "loopsize: gives correct answer to the original problem" $ do
            4  @=? D6.loopsize [ 0, 2, 7, 0]
    ]
