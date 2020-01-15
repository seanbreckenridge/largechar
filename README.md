# largechar

Displays the passed string as the entire screen.

<img src="https://raw.githubusercontent.com/seanbreckenridge/largechar/master/.github/demo.gif" alt="largechar demo gif">

This is a replacement for Alfred's [LargeType](https://www.alfredapp.com/help/features/large-type/).

## Install

Requires: `yarn`

```
git clone https://github.com/seanbreckenridge/largechar
cd largechar
./install.sh
mv largechar /usr/local/bin # to somewhere on your $PATH
```

Note: This is an electron app, but it doesn't build as an application, I just run it from this directory. Installing creates a shell script that you can put somewhere on your `$PATH`, which references the directory you clone this into.

## Run

```
Displays large characters on your screen
https://github.com/seanbreckenridge/largechar

Usage:
  largechar [-h|--help]
  largechar <TEXT TO DISPLAY>
  largechar [-c|--colorize] <TEXT TO DISPLAY>

Examples:
  largechar "youremail@somewhere.com"
  largechar -c "pr8dea7AvZoirx2S22TB" # show a password to someone
```

Made with [electron-quick-start](https://github.com/electron/electron-quick-start)

