/*
 * Structures
 */

/**
 * Performs validation on user input values.
 * @param {Map} `Map` of key/values representing the enumeration. Keys and values can be either
 * a `String` or a `Num`.
 */
var ValidateMap = Fn.new { |values|

  if (values is Map == false) {
    Fiber.abort("'Map' expected for 'values' parameter.")
  }

  var found = {}

  var f
  var value

  for (key in values.keys) {

    value = values[key]

    if (value is String == false && value is Num == false) {
      Fiber.abort("Enumeration member 'keys' and 'values' must be of type 'String' or 'Num'.")
    }

    f = found[value]

    found[value] = f == null ? 1 : f + 1

  }

  for (key in found.keys) {

    value = found[key]

    if (value > 1) {
      Fiber.abort("Attempted to reuse key: %(key).")
    }

  }

}
