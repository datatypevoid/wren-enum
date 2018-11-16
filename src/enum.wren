/*
 * Structures
 */

class Enum {


  /*
   * Getters and Setters
   */

  /**
   * Return the 'name' of the 'Enum' instance when invoked.
   * @return {String}
   */
  name { _name }


  /*
   * Methods
   */

  /**
   * Creates a new 'Enum' instance, using the provided class for member instances.
   * @constructor
   * @param {String} name Name of this 'Enum' instance.
   * @param {List|Map} values If given a List, uses the items contained within as the keys for the
   * new `Enum` instance. If given a `Map`, keys are keys and values are values. Keys/values within
   * any `Maps/Lists` must be either of type `String` or `Num`.
   * @param {EnumMember} memberClass Class to use when instantiating member instances. Is generally an
   * instance or derivative of the `EnumMember` class unless mocking during tests.
   * @param {Fn} validatorFn Function used to validate an instance's keys/values.
   * @param {Fn} transformFn If a 'List' is provided for the `values` parameter, this function transforms
   * it, mapping `List` items to numeric values. Called before the `validatorFn` and `mapFn`.
   * @param {Fn} mapFn Function which processes mapped key/values to member instances.
   */
  construct new (name, values, memberClass, validatorFn, transformFn, mapFn) {

    _name = name

    _enums = {}

    // Empty map is used for type. Two `EnumMember`s from the same `Enum` will have the same reference.
    _type = {}

    if (values is List) {
      values = transformFn.call(values)
    } else if (values is Map == false) {
      Fiber.abort("'List' or 'Map' expected for 'values' parameter when constructing 'Enum'.")
    }

    if (values is Map) {

      validatorFn.call(values)

      _enums = mapFn.call(memberClass, values, name, _type)

    } else {
      Fiber.abort("'List' or 'Map' expected for 'values' parameter when constructing 'Enum'.")
    }

  }


  /**
   * Checks if there is a member associated with the given index.
   * Throws an error if the index is not a `Num` or `String`.
   * @param  {Num|String} index
   * @return {Boolean} Returns `true` if a member was found; `false` otherwise.
   */
  has (index) {

    if (index is Num || index is String) return _enums[index] != null

    Fiber.abort("Expected 'String' or 'Num' for 'index' parameter.")

  }


  /**
   * Returns a `String` representation of an `Enum` instance.
   * @return {String}
   */
  toString () {
    return "<enum '%(_name)'>"
  }


  /**
   * Attempts to retrieve a value mapped to the given key. If none is found, calls `Fiber.abort`.
   * @param {String|Num} index The index of the `Enum` member to attempt to retrieve.
   * @return {EnumMember}
   */
  [index] {

    var e = _enums[index]

    if (e == null) {
      Fiber.abort("Invalid enum member: %(index)")
    }

    return e

  }


  [index] = (value) {
    Fiber.abort("Cannot set enumerated value.")
  }


  < (other) {
    Fiber.abort("'Enum' does not support the '<' operator.")
  }


  > (other) {
    Fiber.abort("'Enum' does not support the '>' operator.")
  }


  == (other) {
    Fiber.abort("'Enum' does not support the '==' operator.")
  }


}
