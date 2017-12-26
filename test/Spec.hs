import Test.Tasty
import qualified D1P1Spec
import qualified D1P2Spec
import qualified D2P1Spec
import qualified D2P2Spec
import qualified D3P1Spec
import qualified D4P1Spec
import qualified D4P2Spec
import qualified D5P1Spec
import qualified D5P2Spec
import qualified D6Spec
import qualified D7P1Spec
import qualified D7P2Spec

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "Tests"
    [
        D1P1Spec.tests
      , D1P2Spec.tests
      , D2P1Spec.tests
      , D2P2Spec.tests
      , D3P1Spec.tests
      , D4P1Spec.tests
      , D4P2Spec.tests
      , D5P1Spec.tests
      , D5P2Spec.tests
      , D6Spec.tests
      , D7P1Spec.tests
      , D7P2Spec.tests
    ]
