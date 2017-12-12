{-# LANGUAGE OverloadedStrings #-}

module D1P2Spec (
    tests
) where

import Test.Tasty
import Test.Tasty.HUnit

import qualified D1P2


tests :: TestTree
tests = testGroup "Tests" [unitTests]

unitTests :: TestTree
unitTests = testGroup "Unit tests"
    [
        testCase "captcha: gives correct answer to the original problem" $ do
            6 @=? D1P2.captcha [1, 2, 1, 2]
            0 @=? D1P2.captcha [1, 2, 2, 1]
            4 @=? D1P2.captcha [1, 2, 3, 4, 2, 5]
            12 @=? D1P2.captcha [1, 2, 3, 1, 2, 3]
            4 @=? D1P2.captcha [1, 2, 1, 3, 1, 4, 1, 5]
    ]
