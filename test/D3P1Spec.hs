{-# LANGUAGE OverloadedStrings #-}

module D3P1Spec (
    tests
) where

import Test.Tasty
import Test.Tasty.HUnit

import qualified D3P1


tests :: TestTree
tests = testGroup "Tests" [unitTests]

unitTests :: TestTree
unitTests = testGroup "Unit tests"
    [
        testCase "numsteps: gives correct answer to the original problem" $ do
            0 @=? D3P1.numsteps 1
            3 @=? D3P1.numsteps 12
            2 @=? D3P1.numsteps 23
            31 @=? D3P1.numsteps 1024
    ]
