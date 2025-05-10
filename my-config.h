#pragma once
#include "main_flash_layout.h"

#define JAVELIN_USE_EMBEDDED_STENO 1
#define JAVELIN_USE_USER_DICTIONARY 1
#define JAVELIN_USB_MILLIAMPS 100

#define JAVELIN_DEBOUNCE_MS 10
#define JAVELIN_BUTTON_MATRIX 1

constexpr uint8_t COLUMN_PINS[] = {23, 20, 22, 26, 27, 28, 3, 4, 5, 6, 7, 8};
constexpr uint8_t ROW_PINS[] = {21, 9, 29, 2, 1};

constexpr int8_t KEY_MAP[5][12] = {
  // top-left
  { 0, 1, 2, 3, 4, 5, -1, -1, -1, -1, -1, -1 },
  // top-right
  { -1, -1, -1, -1, -1, -1, 6, 7, 8, 9, 10, 11 },
  // bottom-left
  { 12, 13, 14, 15, 16, 17, -1, -1, -1, -1, -1, -1 },
  // bottom-right
  { -1, -1, -1, -1, -1, -1, 18, 19, 20, 21, 22, 23 },
  // thumbs
  { -1, -1, -1, -1, 24, 25, 26, 27, -1, -1, -1, -1 },
};

#define JAVELIN_SCRIPT_CONFIGURATION \
  R"({"name": "idk-what-to-name-this"},"layout":[{"x":0,"y":0},{"x":1,"y":0},{"x":2,"y":0},{"x":3,"y":0},{"x":4,"y":0},{"x":5,"y":0},{"x":8,"y":0},{"x":9,"y":0},{"x":10,"y":0},{"x":11,"y":0},{"x":12,"y":0},{"x":13,"y":0},{"x":0,"y":1},{"x":1,"y":1},{"x":2,"y":1},{"x":3,"y":1},{"x":4,"y":1},{"x":6,"y":1},{"x":8,"y":1},{"x":9,"y":1},{"x":10,"y":1},{"x":11,"y":1},{"x":12,"y":1},{"x":13,"y":1},{"x":4,"y":3},{"x":5,"y":3},{"x":8,"y":3},{"x":9,"y":3}])"

const size_t BUTTON_COUNT = 28;
const char *const MANUFACTURER_NAME = "LilleAila";
const char *const PRODUCT_NAME = "Some random steno keyboard (Javelin)";
// NOTE: This is a vendor ID from pid.codes, only meant for testing
// If this is to be actually released, get a proper vendor id!!!
const int VENDOR_ID = 0x1209;
// commented out in all examples from upstream, not sure why
// const int PRODUCT_ID = 0x0001;
