{-# LANGUAGE OverloadedStrings #-}

module Data.Time.Calendar.BankHoliday.UnitedStatesSpec (spec) where

import Data.List (nub)
import Data.Time
import Test.Hspec
import Test.QuickCheck

import Data.Time.Calendar.BankHoliday (isWeekday, yearFromDay)
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

  describe "holidaysBetweenYears" $ do
    it "does not include dates outside of range" $ do
      let tooEarly = bankHolidays 1999
      let tooLate = bankHolidays 2017
      let justRight = holidaysBetweenYears 2000 2016
      justRight `shouldNotContain` tooEarly
      justRight `shouldNotContain` tooLate

    it "keeps them in order" $ do
      let oneYearRange = holidaysBetweenYears 2000 2001
      let f = yearFromDay $ head $ oneYearRange
      let l = yearFromDay $ head $ reverse $ oneYearRange
      f `shouldBe` 2000
      l `shouldBe` 2001

    it "does not duplicate if given the same year" $ do
      let sameYearRange = holidaysBetweenYears 2000 2000
      nub sameYearRange `shouldBe` sameYearRange


  describe "holidaysBetween" $ do
    it "does not include dates outside of range" $ do
      let (s, e) = (fromGregorian 2014 1 2, fromGregorian 2014 7 4)
      let theRange = holidaysBetween s e
      theRange `shouldNotContain` [fromGregorian 2014 1 1]
      theRange `shouldNotContain` [fromGregorian 2014 7 5]
      theRange `shouldContain` [e]
      theRange `shouldContain` [fromGregorian 2014 1 20]

