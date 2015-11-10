------------------------------------------------------------------------------
-- Module      : Data.Time.Calendar.BankHoliday.UnitedStates
-- Maintainer  : brady.ouren@gmail.com
------------------------------------------------------------------------------

module Data.Time.Calendar.BankHoliday
  ( isWeekend
  , isWeekday
  ) where

import Data.Time

{- | whether the given day is a weekend -}
isWeekend :: Day -> Bool
isWeekend d = toModifiedJulianDay d `mod` 7 `elem` [3,4]

{- | whether the given day is a weekday -}
isWeekday :: Day -> Bool
isWeekday = not . isWeekend

