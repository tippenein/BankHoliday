{-
- New Year's Day - January 1
- Inauguration Day - January 20
- Martin Luther King, Jr. Day - Third Monday in January
- George Washington's Birthday - Third Monday in February
- Memorial Day - Last Monday in May
- Independence Day - July 4
- Labor Day - First Monday in September
- Columbus Day - Second Monday in October
- Veterans Day - November 11
- Thanksgiving Day - 4th Thursday in November
- Christmas Day - December 25

- For holidays falling on Saturday, Federal Reserve Banks and Branches will be
  open the preceding Friday. For holidays falling on Sunday, all Federal
  Reserve Banks and Branches will be closed the following Monday.

-}

module Data.Time.Calendar.BankHoliday.UnitedStates
  (
    isBankHoliday
  , bankHolidays
  , isWeekday
  , isWeekend
  ) where

import Data.Time (Day, fromGregorian, toGregorian)
import Data.Time.Calendar (addDays, toModifiedJulianDay)

{- bank holidays for a given year -}
bankHolidays :: Integer -> [Day]
bankHolidays year = standardHolidays
  where
    [jan, feb, may, jun, sep, dec] = map (fromGregorian year) [1,2,5,6,9,12]
    standardHolidays = [
        newYearsDay
      , mlkDay
      , inaugurationDay
      , presidentsDay
      , memorialDay
      , christmas
      ]
    newYearsDay = case wd jan 1 of
      3 -> jan 3 -- Saturday
      4 -> jan 2 -- Sunday
      _ -> jan 1
    inaugurationDay = case wd jan 20 of
      3 -> jan 22  -- saturday
      4 -> jan 21  -- sunday
      _ -> jan 20
    mlkDay = 2 `weeksBefore` firstMondayIn feb
    presidentsDay = 2 `weeksAfter` firstMondayIn feb
    memorialDay = weekBefore (firstMondayIn jun)
    christmas = case wd dec 25 of
      3 -> dec 27  -- saturday
      4 -> dec 26  -- sunday
      _ -> dec 25

    firstMondayIn mm = addDays (negate $ wd mm 02) (mm 07)
    wd mm dd = toModifiedJulianDay (mm dd) `mod` 7

weeksBefore n = addDays (n * (-7))
weekBefore = weeksBefore 1

weeksAfter n = addDays (n * 7)
weekAfter = weeksAfter 1

isBankHoliday :: Day -> Bool
isBankHoliday d = d `elem` (bankHolidays year)
  where
    (year,_,_) = toGregorian d

isWeekend :: Day -> Bool
isWeekend d = toModifiedJulianDay d `mod` 7 `elem` [3,4]

isWeekday :: Day -> Bool
isWeekday = not . isWeekend

