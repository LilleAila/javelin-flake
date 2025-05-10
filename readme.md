# javelin-flake

An experimental nix flake for [javelin-steno-pico](https://github.com/jthlim/javelin-steno-pico).

## Usage

1. Compile your regular javelin firmware using the [firmware builder](https://lim.au/#/software/javelin-steno). Add dictionaries, settings, etc. The target device does not matter.
2. Flash this to the keyboard
3. Build the firmware for your keyboard using this flake.
4. Flash this to the keyboard. It will not overwrite the data from the original flash.

(See [#3](https://github.com/jthlim/javelin-steno-pico/issues/3) and [#4](https://github.com/jthlim/javelin-steno-pico/issues/4) of upstream)
