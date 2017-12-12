{-# LANGUAGE OverloadedStrings #-}

module D1P1Spec (
    tests
) where

import Test.Tasty
import Test.Tasty.HUnit

import qualified D1P1


tests :: TestTree
tests = testGroup "Tests" [unitTests]

unitTests :: TestTree
unitTests = testGroup "Unit tests"
    [
        testCase "captcha: gives correct answer to the original problem" $ do
            3 @=? D1P1.captcha [1, 1, 2, 2]
            4 @=? D1P1.captcha [1, 1, 1, 1]
            0 @=? D1P1.captcha [1, 2, 3, 4]
            9 @=? D1P1.captcha [9, 1, 2, 1, 2, 1, 2, 9]
    ]
