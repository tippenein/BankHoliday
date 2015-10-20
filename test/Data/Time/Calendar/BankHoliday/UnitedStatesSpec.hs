{-# LANGUAGE OverloadedStrings #-}

module Data.Time.Calendar.BankHoliday.UnitedStatesSpec (spec) where

import Data.Time
import Test.Hspec
import Test.QuickCheck

import Data.Time.Calendar.BankHoliday.UnitedStates

spec :: Spec
spec = do
  describe "bankHolidays" $ do
    it "is always a weekday" $ property
      $ \yr -> all (\d -> isWeekday d) (bankHolidays yr)

    it "does not include dates before the inception of bank holidays" $ do
      (bankHolidays 1932) `shouldBe` []

    -- it "falling on a sunday are delegated to following monday" $ do

    -- it "falling on a saturday are open the preceding friday" $ property

