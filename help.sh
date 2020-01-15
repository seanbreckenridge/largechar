
usage="Displays large characters on your screen
https://github.com/seanbreckenridge/largechar

Usage:
  largechar [-h|--help]
  largechar <TEXT TO DISPLAY>
  largechar [-c|--colorize] <TEXT TO DISPLAY>

Examples:
  largechar youremail@somewhere.com
  largechar -c pr8dea7AvZoirx2S22TB # show a password to someone"

if [ "$1" = "-h" ] || [ "$1" = "-help" ] || [ "$1" = "--help" ] || [ -z "$1" ]; then
	echo "$usage"
	exit 0
fi

