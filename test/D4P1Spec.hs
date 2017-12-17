{-# LANGUAGE OverloadedStrings #-}

module D4P1Spec (
    tests
) where

import Test.Tasty
import Test.Tasty.HUnit

import qualified D4P1


tests :: TestTree
tests = testGroup "Tests" [unitTests]

unitTests :: TestTree
unitTests = testGroup "Unit tests"
    [
        testCase "checkpass: gives correct answer to the original problem" $ do
            True  @=? D4P1.checkpass "aa bb cc dd ee"
            False @=? D4P1.checkpass "aa bb cc dd aa"
            True  @=? D4P1.checkpass "aa bb cc dd aaa"
    ]
