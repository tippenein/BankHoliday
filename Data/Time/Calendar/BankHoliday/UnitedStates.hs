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

> For holidays falling on Saturday, Federal Reserve Banks and Branches will be
  open the preceding Friday. For holidays falling on Sunday, all Federal
  Reserve Banks and Branches will be closed the following Monday. Expanded
  schedule can be found at: Federal Reserve System Holidays

-}
module Data.Time.Calendar.BankHoliday.UnitedStates
  (
    isBankHoliday
  , bankHolidays
  ) where

import Data.Time (Day, fromGregorian, toGregorian)
import Data.Time.Calendar (addDays, toModifiedJulianDay)
import Data.Time.Calendar.Easter (gregorianEaster)

-- perhaps should newtype a Year data type?
bankHolidays :: Integer -> [Day]
bankHolidays yy = standardHolidays
  where
    standardHolidays = [ ]-- firstMondayIn may ]

firstMondayIn mm = addDays (negate $ wd mm 02) (mm 07)
wd mm dd = toModifiedJulianDay (mm dd) `mod` 7

isBankHoliday :: Day -> Bool
isBankHoliday d = False
  where
    (yy,mm,dd)   = toGregorian d
    easterSunday = gregorianEaster yy

weeksBefore :: Integer -> Day -> Day
weeksBefore i = addDays ((-7) * i)

