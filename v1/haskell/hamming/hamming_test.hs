import Test.HUnit (Assertion, (@=?), runTestTT, Test(..), Counts(..))
import System.Exit (ExitCode(..), exitWith)
import Hamming (distance)

exitProperly :: IO Counts -> IO ()
exitProperly m = do
  counts <- m
  exitWith $ if failures counts /= 0 || errors counts /= 0 then ExitFailure 1 else ExitSuccess

testCase :: String -> Assertion -> Test
testCase label assertion = TestLabel label (TestCase assertion)

main :: IO ()
main = exitProperly $ runTestTT $ TestList
       [ TestList hammingDistanceTests ]

hammingDistanceTests :: [Test]
hammingDistanceTests =
  [ testCase "no difference between empty strands" $
    0 @=? distance "" ""
  , testCase "no difference between identical strands" $
    0 @=? distance "GGACTGA" "GGACTGA"
  , testCase "complete hamming distance in small strand" $
    3 @=? distance "ACT" "GGA"
  , testCase "small hamming distance in middle somewhere" $
    1 @=? distance "GGACG" "GGTCG"
  , testCase "larger distance" $
    2 @=? distance "ACCAGGG" "ACTATGG"
  ]
