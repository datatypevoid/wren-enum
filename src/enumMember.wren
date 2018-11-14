/**
 * Class representing a member of an enumeration.
 */
class EnumMember {


  /*
   * Getters and Setters
   */

  /**
   * Returns the `name` of this `EnumMember` instance.
   * @type {Num|String}
   */
  name { _name }

  /**
   * Returns the `name` of the parent `Enum` instance.
   * @type {String}
   */
  parent { _parent }

  /**
   * Returns the type object of this `EnumMember` instance.
   * @type {Map}
   */
  type { _type }


  /**
  * Returns the `value` of this `EnumMember` instance.
  * @type {Num|String}
  */
  value { _value }


  /*
   * Methods
   */

  /**
   * Creates a new `EnumMember` instance.
   * Note: The `key` and `value` parameters are essentially interchangeable.
   * @constructor
   * @param {Num|String} key The value to assign as the `value` of this member instance.
   * @param {String} name The name of the parent `Enum` instance that this member belongs to.
   * @param {Num|String} value The `key` or `name` for this member instance.
   * @param {Map} type The object to use during equality checks, all members of a given `Enum`
   * instance will have the same `type`.
   */
  construct new (key, name, value, type) {

    if (key == null || (key is Num == false && key is String == false)) {
      Fiber.abort("'Num' or 'String' expected for 'key' parameter.")
    }

    if (name == null || name is String == false) {
      Fiber.abort("'String' expected for 'name' parameter.")
    }

    if (value == null || (value is Num == false && value is String == false)) {
      Fiber.abort("'Num' or 'String' expected for 'value' parameter.")
    }

    if (type == null || type is Map == false) {
      Fiber.abort("'Map' expected for 'type' parameter.")
    }

    _name = value
    _parent = name
    _type = type
    _value = key

  }


  /**
   * Returns a `String` representation of this `EnumMember` instance.
   * @return {String}
   */
  toString () {
    return "<%(_parent).%(_name): %(_value)>"
  }


  < (other) {
    Fiber.abort("'EnumMember' does not support the '<' operator.")
  }


  > (other) {
    Fiber.abort("'EnumMember' does not support the '>' operator.")
  }


  /**
   * Performs an equality check between two `EnumMember` instances.
   * Uses the type object and value of each to determine if they are
   * equal or not. Note: Does not perform reflection to see if they
   * are actually instances of the same class.
   * @param {EnumMember} other
   * @return {Bool}
   */
  == (other) {
    return _type == other.type && _value == other.value
  }


}
