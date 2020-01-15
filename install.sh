#!/usr/bin/env bash

# make sure yarn is installed
command -v yarn >/dev/null 2>&1 || { echo "Could not find 'yarn', install that and re-run install.sh" >&2; exit 1; }

# change to current dir
cd `dirname $BASH_SOURCE`
cur_dir=$(pwd)

# pull dependencies

yarn install

# Create wrapper script

script_name="${cur_dir}/largechar"

echo "#!/usr/bin/env sh" > "$script_name"
cat "./help.sh" >> "$script_name"
echo "yarn --cwd \"${cur_dir}\" start \"\$@\"" >> "$script_name"
chmod +x "$script_name"
echo "Copy ${script_name} to somewhere on your \$PATH"
