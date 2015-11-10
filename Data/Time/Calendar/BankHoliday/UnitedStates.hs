------------------------------------------------------------------------------
-- Module      : Data.Time.Calendar.BankHoliday.UnitedStates
-- Maintainer  : brady.ouren@gmail.com
------------------------------------------------------------------------------

module Data.Time.Calendar.BankHoliday.UnitedStates
  (
    isBankHoliday
  , bankHolidays
  ) where

import Data.Maybe
import Data.Time (Day, fromGregorian, toGregorian)
import Data.Time.Calendar (addDays, toModifiedJulianDay)
import Data.Time.Calendar.BankHoliday (isWeekday, isWeekend)

{- | bank holidays for a given year -}
bankHolidays :: Integer -> [Day]
bankHolidays year = filterHistoric standardHolidays
  where
    [jan, feb, jun, jul, sep, oct, nov, dec] = monthsMap
    monthsMap = map (fromGregorian year) [1,2,6,7,9,10,11,12]
    standardHolidays = [
        2 `weeksBefore` firstMondayIn feb  -- mlk Day
      , 2 `weeksAfter` firstMondayIn feb   -- presidents day
      , weekBefore (firstMondayIn jun)     -- memorial day
      , firstMondayIn sep                  -- labor day
      , weekAfter (firstMondayIn oct)      -- columbusDay
      , 3 `weeksAfter` firstThursdayIn nov -- thanksgiving
      ] ++ catMaybes [
        weekendHolidayFrom (jan 1)  -- newYearsDay
      , weekendHolidayFrom (jan 20) -- inaugurationDay
      , weekendHolidayFrom (jul 4)  -- independenceDay
      , weekendHolidayFrom (nov 11) -- veteransDay
      , weekendHolidayFrom (dec 25) -- christmas
      ]

{- | whether the given day is a bank holiday -}
isBankHoliday :: Day -> Bool
isBankHoliday d = d `elem` (bankHolidays year)
  where
    (year,_,_) = toGregorian d

-- | day federal bank holidays were announced in the United States
-- | March 9th 1933
filterHistoric = filter (\d -> d > marchNinth1933)
  where marchNinth1933 = fromGregorian 1933 3 9

weekendHolidayFrom :: Day -> Maybe Day
weekendHolidayFrom d = case weekIndex d of
  3 -> Nothing            -- saturday
  4 -> Just (addDays 1 d) -- sunday
  _ -> Just d

-- | relative day helper functions
weekIndex day = toModifiedJulianDay day `mod` 7
firstMondayIn month = addDays (negate $ weekIndex (month 02)) (month 07)
firstThursdayIn month = addDays 3 (firstMondayIn month)
weeksBefore n = addDays (n * (-7))
weekBefore = weeksBefore 1
weeksAfter n = addDays (n * 7)
weekAfter = weeksAfter 1
