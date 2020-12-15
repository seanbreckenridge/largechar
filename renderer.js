const { remote } = require("electron");

// get the width of an element
function get_el_width(el) {
  return el.getBoundingClientRect().width;
}

// get the font size of an element
function get_font_size(el) {
  return parseFloat(
    window.getComputedStyle(el, null).getPropertyValue("font-size")
  );
}

// set the font size of an element. accepts a float as fontSize
function set_font_size(el, fontSize) {
  el.style.fontSize = fontSize + "px";
}

// calculates the loop condition
// returns true while we have to increase/decrease
// target_el's width to reach want_width
function not_done(target_el, want_width, increase) {
  // don't have to check if they're equal
  // the fontSize can increase/decrease past the target some,
  // there's enough leeway
  let cur_width = get_el_width(target_el);
  console.log(`current width: ${cur_width}`);
  console.log(`want width: ${want_width}`);
  if (increase) {
    console.log("increasing...");
    return cur_width < want_width;
  } else {
    console.log("decreasing...");
    return cur_width > want_width;
  }
}

// target_el - target element to incrase/decrease
// increase (bool) - true/false, to specify whether to incrase
//                  or decrease the element size
// increase_type - true is multiplicative, false is additive increase
function loop(target_el, want_width, increase, increase_type) {
  let target_el_width = get_el_width(target_el);
  console.log("increase" + increase);
  while (not_done(target_el, want_width, increase)) {
    if (increase) {
      if (increase_type) {
        set_font_size(target_el, get_font_size(target_el) * 1.1);
      } else {
        set_font_size(target_el, get_font_size(target_el) + 0.25);
      }
    } else {
      if (increase_type) {
        set_font_size(target_el, get_font_size(target_el) * 0.9);
      } else {
        set_font_size(target_el, get_font_size(target_el) - 0.25);
      }
    }
  }
}

// converts a string to a array of
// span elements with classes
// that render colored text for non alphabetic
// characters
// if the newline character is given, gives
// that a newline class, which is rendered
// as a block element in style.css
//
// this also escapes the text
// display_text: string
// colorize: bool
function escape_text(display_text, colorize) {
  let span_els = [];
  let matchAlphabetic = /[a-zA-Z]/;
  for (let i = 0; i < display_text.length; i++) {
    let c = display_text.charAt(i);
    let s = document.createElement("span");
    let node = document.createTextNode(c); // escape text
    s.appendChild(node);
    if (colorize && !c.match(matchAlphabetic)) {
      s.classList.add("symbol");
    }
    if (c === "\n") {
      s.classList.add("newline");
    }
    span_els.push(s);
  }
  return span_els;
}

// increase the target element multiplicatively past target size
// and decrease it additively, or decrease it multiplicatively
// and increase it additively
// This is just to speed up the process of getting it to
// the correct size, do multiplication first, then adjust
// with addition
//
// display_text: string to display to user
function main(display_text, colorize) {
  const want_width = Math.round(document.body.clientWidth * 0.85);
  let target = document.querySelector("#target");
  target.innerHTML = "";
  // escape, colorize, and add to target element
  escape_text(display_text, colorize).forEach((el) => target.appendChild(el));
  console.log("Starting multiplicative...");
  loop(target, want_width, get_el_width(target) < want_width, true);
  console.log("Starting additive...");
  loop(target, want_width, get_el_width(target) < want_width, false);
}

// parses the argument list into an object.
// --help is handled by the shell code wrapper
// -c/--colorize: colorizes the display
function parse_args(args) {
  let argv = args.slice(3);
  let options = {
    colorize: false,
    text: "error getting text to display",
  };
  while (argv.length > 0) {
    let arg = argv.shift();
    if (arg === "--colorize" || arg === "-c") {
      options.colorize = true;
    } else {
      options.text = arg;
    }
  }
  return options;
}

let options = parse_args(remote.process.argv);
main(options.text, options.colorize);
