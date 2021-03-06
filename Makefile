
# Copyright 2021 John Hanley. MIT licensed.

all: ci

ci:
	flake8

prepare:
	conda env update

fix-imports: isort
isort:
	isort --ff=yes grid_map

EXCLUDE = '/\.(git|idea)/|LICENSE'
L = --files-without-match
C2021 = 'Copyright 2021 John Hanley\. MIT licensed\.'
audit:
	find . -type f | egrep -v $(EXCLUDE) | sort | xargs egrep $(L) $(C2021)
