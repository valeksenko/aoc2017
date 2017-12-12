{-# LANGUAGE OverloadedStrings #-}

module D2P2Spec (
    tests
) where

import Test.Tasty
import Test.Tasty.HUnit

import qualified D2P2


tests :: TestTree
tests = testGroup "Tests" [unitTests]

unitTests :: TestTree
unitTests = testGroup "Unit tests"
    [
        testCase "divsum: gives correct answer to the original problem" $ do
            9 @=? D2P2.divsum  [[5, 9, 2, 8], [9, 4, 7, 3], [3, 8, 6, 5]]
    ]
