Holiday
---

[![Build Status](https://secure.travis-ci.org/tippenein/BankHoliday.png)](http://travis-ci.org/tippenein/BankHoliday)

A haskell library for holidays

[bank-holiday-usa on hackage](https://hackage.haskell.org/package/bank-holiday-usa)

----

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
  Reserve Banks and Branches will be closed the following Monday.

``` sh

# Configure & build the package.
stack build

# Test package.
stack test

```

Inspired by [this](https://hackage.haskell.org/package/bank-holidays-england)

