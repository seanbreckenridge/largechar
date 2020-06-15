# largechar

Displays the passed string as the entire screen.

<img src="https://raw.githubusercontent.com/seanbreckenridge/largechar/master/.github/demo.gif" alt="largechar demo gif">

This is a replacement for Alfred's [LargeType](https://www.alfredapp.com/help/features/large-type/).

## Install

Requires: [`yarn`](https://yarnpkg.com/lang/en/docs/install/#debian-stable)

```
git clone https://gitlab.com/seanbreckenridge/largechar
cd largechar
./install
mv largechar /usr/local/bin # to somewhere on your $PATH
```

Note: This is an electron app, but it doesn't build as an application, I just run it from this directory. Installing creates a shell script that you can put somewhere on your `$PATH`, which references the directory you clone this into.

## Run

```
Displays large characters on your screen
https://gitlab.com/seanbreckenridge/largechar

Usage:
  largechar [-h|--help]
  largechar <TEXT TO DISPLAY>
  largechar [-c|--colorize] <TEXT TO DISPLAY>

Examples:
  largechar "youremail@somewhere.com"
  largechar -c "pr8dea7AvZoirx2S22TB" # show a password to someone
```

To quit, use whatever keyboard shortcut you use to quit/force-quit usually.

Made with [electron-quick-start](https://github.com/electron/electron-quick-start).
