usage="Displays large characters on your screen
https://github.com/seanbreckenridge/largechar

Usage:
  largechar [-h|--help]
  largechar <TEXT TO DISPLAY>
  largechar [-c|--colorize] <TEXT TO DISPLAY>

Examples:
  largechar youremail@somewhere.com
  largechar -c pr8dea7AvZoirx2S22TB # show a password to someone"

if [[ "$1" =~ ^[-]{1,2}h(elp)?$ ]]; then
	echo "$usage"
	exit 0
fi

# split args into arguments and options
declare -a ARGS TEXT
ARGS=()
TEXT=()
for arg in "$@"; do
	if [[ "$arg" == '-c' || "$arg" == '--colorize' ]]; then
		ARGS+=("-c")
	else
		TEXT+=("$arg")
	fi
done

if [[ "${#TEXT[@]}" == "0" ]]; then
	echo "No text received as arguments, reading from STDIN..."
	ARGS+=("$(cat)") # read from stdin
else
	ARGS+=("${TEXT[*]}") # convert arg array to text
fi
