all:
	swift build

run:
	swift run

test:
	swift test 2>&1 > /dev/null | xcbeautify
