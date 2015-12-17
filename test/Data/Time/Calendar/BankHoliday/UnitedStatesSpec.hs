{-# LANGUAGE OverloadedStrings #-}

module Data.Time.Calendar.BankHoliday.UnitedStatesSpec (spec) where

import Data.Time
import Test.Hspec
import Test.QuickCheck

import Data.Time.Calendar.BankHoliday (isWeekday)
import Data.Time.Calendar.BankHoliday.UnitedStates

spec :: Spec
spec = do
  describe "bankHolidays" $ do
    it "are always a weekday" $ property
      $ \yr -> all (\d -> isWeekday d) (bankHolidays yr)

    it "do not include dates before the inception of bank holidays" $ do
      (bankHolidays 1932) `shouldBe` []

    it "falling on a sunday are delegated to following monday" $ do
      (bankHolidays 2017) `shouldContain` [fromGregorian 2017 1 2]

    it "falling on a saturday are open the preceding friday" $ do
      (bankHolidays 2011) `shouldNotContain` [fromGregorian 2011 12 31]

  describe "isBankHoliday" $ do
    it "returns true for the days we expect" $ do
      let christmas = fromGregorian 2015 12 25
      let newYears = fromGregorian 2014 1 1
      let fourth = fromGregorian 2014 7 4
      all isBankHoliday [christmas, newYears, fourth]

