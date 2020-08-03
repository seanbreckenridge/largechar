usage="Displays large characters on your screen
https://gitlab.com/seanbreckenridge/largechar

Usage:
  largechar [-h|--help]
  largechar <TEXT TO DISPLAY>
  largechar [-c|--colorize] <TEXT TO DISPLAY>

Examples:
  largechar youremail@somewhere.com
  largechar -c pr8dea7AvZoirx2S22TB # show a password to someone"

if [[ "$1" == "-h" || "$1" == "-help" || "$1" == "--help" ]]; then
	echo "$usage"
	exit 0
fi

# split args into arguments and options
declare -a ARGS TEXT
ARGS=()
TEXT=()
for arg in "$@"; do
	if [[ "$arg" == "-c" || "$arg" = "--colorize" ]]; then
		ARGS+=("-c")
	else
		TEXT+=("$arg")
	fi
done

if [[ "${#TEXT[@]}" == "0" ]]; then
	echo "No text recieved as arguments, reading from STDIN..."
	TEXTSTR="$(cat)" # read from stdin
else
	TEXTSTR="${TEXT[*]}" # convert arg array to text
fi

ARGS+=("$TEXTSTR")

