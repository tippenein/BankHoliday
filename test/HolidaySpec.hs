module HolidaySpec (spec) where

import Holiday

import Test.Hspec

spec :: Spec
spec =
  describe "main" $ do
    it "returns the unit" $
      main `shouldReturn` ()
