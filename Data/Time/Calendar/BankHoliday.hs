------------------------------------------------------------------------------
-- Module      : Data.Time.Calendar.BankHoliday
-- Maintainer  : brady.ouren@gmail.com
------------------------------------------------------------------------------

module Data.Time.Calendar.BankHoliday
  ( isWeekend
  , isWeekday
  , yearFromDay
  ) where

import Data.Time

{- | whether the given day is a weekend -}
isWeekend :: Day -> Bool
isWeekend d = toModifiedJulianDay d `mod` 7 `elem` [3,4]

{- | whether the given day is a weekday -}
isWeekday :: Day -> Bool
isWeekday = not . isWeekend

yearFromDay :: Day -> Integer
yearFromDay = fst' . toGregorian
  where
    fst' :: (a,b,c) -> a
    fst' (x,_,_) = x
