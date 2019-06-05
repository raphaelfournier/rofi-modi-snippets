# rofi-modi-snippets

A modi to use with [rofi](https://github.com/davatorium/rofi). It presents a
list of named snippets (keys) and simulate a user keyboard input of a
corresponding value. Key/value pairs are stored in a `mysnippets` config file.

# Dependencies

- xdotool

# Installation

1. Clone the repo.
1. Modify the `snippets.sh` file to point the SNIPFILE variable to the actual
location of the mysnippet file on your computer.
1. Add your own snippets.
1. Start `rofi` as follows:

    rofi -show snip -modi snip:/home/raph/Code/langageBash/rofi-modi-snippets/snippets.sh


# Features 

Snippets are strings of text, which are written with `xdotool` in the window
with focus. Snippets starting by *cmd* are passed through `eval` and the written
string is the result of the evaluation. See the `cmddate` and `cmdepoch`
examples.

# Remark

You may change the separator used in the `mysnippet` config file.

