module Data.Time.Calendar.Holiday where

import Util
import Data.Time.Calendar (addDays)
import Data.Time (Day, fromGregorian)

newYearsDayFor :: Integer -> Day
newYearsDayFor year = fromGregorian year 1 1

weeksBefore :: Integer -> Day -> Day
weeksBefore i = addDays ((-7) * i)

daysBefore :: Integer -> Day -> Day
daysBefore i = addDays ((-1) * i)

weeksAfter :: Integer -> Day -> Day
weeksAfter = undefined

daysAfter :: Integer -> Day -> Day
daysAfter = undefined

