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
          (fromGregorian 1987 1 1)
        , (fromGregorian 1999 5 3)
        , (fromGregorian 1999 11 19)
        , (fromGregorian 2014 7 4)
        , (fromGregorian 2015 11 4)
        , (fromGregorian 2015 12 16)
        , (fromGregorian 2016 1 1)
        ]

  describe "isWeekend" $ do
    it "is accurate" $ do
      all (\d -> isWeekend d) [
          (fromGregorian 1987 1 10)
        , (fromGregorian 1999 11 20)
        , (fromGregorian 2015 11 15)
        , (fromGregorian 2015 12 12)
        , (fromGregorian 2015 7 4)
        , (fromGregorian 2015 12 13)
        , (fromGregorian 2015 11 14)
        ]
