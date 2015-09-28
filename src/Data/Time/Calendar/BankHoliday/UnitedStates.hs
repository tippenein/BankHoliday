module Data.Time.Calendar.BankHoliday.UnitedStates
  (
    isBankHoliday
  , bankHolidays
  ) where

import Data.Time (Day, fromGregorian, toGregorian)
import Data.Time.Calendar (addDays)
import Data.Time.Calendar.Easter (gregorianEaster)

-- perhaps should newtype a Year data type?
bankHolidays :: Integer -> [Day]
bankHolidays = undefined

isBankHoliday :: Day -> Bool
isBankHoliday d = False
  where
    (yy,mm,dd)   = toGregorian d
    easterSunday = gregorianEaster yy

nthMondayIn :: Int -> Int -> Day
nthMondayIn n month = undefined

weeksBefore :: Integer -> Day -> Day
weeksBefore i = addDays ((-7) * i)

daysBefore :: Integer -> Day -> Day
daysBefore i = addDays ((-1) * i)

