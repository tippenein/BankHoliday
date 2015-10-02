{-# LANGUAGE OverloadedStrings #-}

module Data.Time.Calendar.BankHoliday.UnitedStatesSpec (spec) where

import Control.Applicative
import Control.Monad
import Data.Monoid
import Data.Time
import Test.Hspec
import Test.QuickCheck

import Data.Time.Calendar.BankHoliday.UnitedStates

spec :: Spec
spec = do
  describe "bankHolidays" $ do
    it "is always a weekday" $ property
      $ \yr -> not $ any (\d -> toModifiedJulianDay d `mod` 7 `elem` [3,4])
        $ bankHolidays yr

