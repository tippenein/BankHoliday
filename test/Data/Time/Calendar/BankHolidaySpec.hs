{-# LANGUAGE OverloadedStrings #-}

module Data.Time.Calendar.BankHolidaySpec (spec) where

import Data.Time
import Data.Time.Calendar.BankHoliday (isWeekday, isWeekend)
import Test.Hspec

spec :: Spec
spec = do
  describe "isWeekday" $ do
    it "is accurate" $ do
      all (\d -> isWeekday d) [
          (fromGregorian 2015 11 4)
        , (fromGregorian 1999 5 3)
        , (fromGregorian 1999 11 19)
        ]

  describe "isWeekend" $ do
    it "is accurate" $ do
      all (\d -> isWeekend d) [
          (fromGregorian 2015 11 14)
        , (fromGregorian 2015 11 15)
        , (fromGregorian 1999 11 20)
        ]
