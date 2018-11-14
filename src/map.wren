/*
 * Structures
 */

/**
 * Creates a new instance of `memberClass` for each `key/value` pair in `values`. Note that the key and
 * value is mapped to the given `memberClass` instance.
 * @param {EnumMember} memberClass The class to use when creating new enum members.
 * @param {Map} values A `Map` containing the `key/value` pairs comprising an `Enum`.
 * @param {String} name The name of the parent `Enum` instance.
 * @param {Map} typeType object of the parent `Enum` instance.
 * @return Key/value `Map` containing created enum members.
 */
var MapEnum = Fn.new { |memberClass, values, name, type|

  var enums = {}

  var value

  for (key in values.keys) {

    value = values[key]

    var enum = memberClass.new(value, name, key, type)

    enums[key] = enum
    enums[value] = enum

  }

  return enums

}
