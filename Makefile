.PHONY: all build install repl run test

all: install build test

build:
	stack build

install:
	stack install

repl:
	stack exec ghci

run:
	stack exec holiday

test:
	stack test
