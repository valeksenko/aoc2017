{-# LANGUAGE OverloadedStrings #-}

module D2P1Spec (
    tests
) where

import Test.Tasty
import Test.Tasty.HUnit

import qualified D2P1


tests :: TestTree
tests = testGroup "Tests" [unitTests]

unitTests :: TestTree
unitTests = testGroup "Unit tests"
    [
        testCase "checksum: gives correct answer to the original problem" $ do
            18 @=? D2P1.checksum [[5, 1, 9, 5], [7, 5, 3], [2, 4, 6, 8]]
    ]
