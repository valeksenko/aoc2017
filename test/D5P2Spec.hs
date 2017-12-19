{-# LANGUAGE OverloadedStrings #-}

module D5P2Spec (
    tests
) where

import Test.Tasty
import Test.Tasty.HUnit

import qualified D5P2


tests :: TestTree
tests = testGroup "Tests" [unitTests]

unitTests :: TestTree
unitTests = testGroup "Unit tests"
    [
        testCase "numsteps: gives correct answer to the original problem" $ do
            1  @=? D5P2.numsteps [3]
            1  @=? D5P2.numsteps [-3]
            10 @=? D5P2.numsteps [0, 3, 0, 1, -3]
    ]
