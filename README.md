Holiday
---

A haskell library for holidays

----

- New Year's Day - Jan 1
- Martin Luther King, Jr. Day - 3rd monday of Jan
- Presidents' Day - 3rd Monday of Feb
- Memorial Day - last monday of May
- Independence Day - July 4th *
- Labor Day - first monday in september
- Columbus Day - 2nd monday of October
- Veterans' Day - Nov 11 *
- Thanksgiving Day - 4th Thursday of Nov
- Christmas Day - Dec 25

* For holidays falling on Saturday, Federal Reserve Banks and Branches will be open the preceding Friday. For holidays falling on Sunday, all Federal Reserve Banks and Branches will be closed the following Monday. Expanded schedule can be found at: Federal Reserve System Holidays

``` sh
# Update Cabal's list of packages.
cabal update

# Initialize a sandbox and install the package's dependencies.
make install

# Configure & build the package.
make build

# Test package.
make test

# Run executable.
make run

# Start REPL.
make repl
```
