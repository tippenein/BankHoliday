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

import Data.Maybe
import Data.Time (Day, fromGregorian, toGregorian)
import Data.Time.Calendar (addDays, toModifiedJulianDay)

{- bank holidays for a given year -}
bankHolidays :: Integer -> [Day]
bankHolidays year = filterHistoric standardHolidays
  where
    [jan, feb, jun, jul, sep, oct, nov, dec] = map (fromGregorian year) [1,2,6,7,9,10,11,12]
    standardHolidays = [
        2 `weeksBefore` firstMondayIn feb  -- mlk Day
      , 2 `weeksAfter` firstMondayIn feb   -- presidents day
      , weekBefore (firstMondayIn jun)     -- memorial day
      , firstMondayIn sep                  -- labor day
      , weekAfter (firstMondayIn oct)      -- columbusDay
      , thanksgiving
      ] ++ mapMaybe id [
        weekendHolidayFrom (jan 1)  -- newYearsDay
      , weekendHolidayFrom (jan 20) -- inaugurationDay
      , weekendHolidayFrom (jul 4)  -- independenceDay
      , weekendHolidayFrom (nov 11) -- veteransDay
      , weekendHolidayFrom (dec 25) -- christmas
      ]

    thanksgiving = 3 `weeksAfter` (addDays 3 (firstMondayIn nov)) -- 4th thursday in nov

filterHistoric = filter (\d -> d > minimumDay)

firstMondayIn :: Num a => (a -> Day) -> Day
firstMondayIn month = addDays (negate $ weekIndex (month 02)) (month 07)

weekIndex day = toModifiedJulianDay day `mod` 7

weekendHolidayFrom :: Day -> Maybe Day
weekendHolidayFrom d = case weekIndex d of
  3 -> Nothing            -- saturday
  4 -> Just (addDays 1 d) -- sunday
  _ -> Just d

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

minimumDay :: Day
minimumDay = fromGregorian 1933 3 9
