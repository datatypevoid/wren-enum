/*
 * Imports
 */

import "./enum" for Enum
import "./enumMember" for EnumMember
import "./map" for MapEnum
import "./transform" for TransformList
import "./validate" for ValidateMap


/*
 * Structures
 */

/**
 * Factory class which produces instances of the `Enum` class. The factory pattern is used for a
 * simple and convenient way to decouple logic and allow for easy testing, while also exposing only
 * what is deemed the public API of this module.
 */
class EnumFactory {


  /**
   * Returns a new factory instance which uses the default modules for constructing
   * `Enum` instances.
   * @constructor
   */
  construct create () {
    _type = EnumMember
    _validatorFn = ValidateMap
    _transformFn = TransformList
    _mapFn = MapEnum
  }


  /**
   * Returns a new factory instance which uses the given modules for constructing
   * `Enum` instances. Note that `null` can be given for any parameter, which
   * will cause the default module to be used.
   * @constructor
   * @param {Map} type Type object for all members of an `Enum`.
   * @param {Fn|null} validatorFn Function which validates the data provided to the `Enum`
   * for construction.
   * @param {Fn|null} transformFn If given a `List` containing the `Enum` data, this
   * function transforms it into a `Map`.
   * @param {Fn|null} mapFn Function which performs the construction and mapping of the
   * `Enum` members.
   */
  construct create (type, validatorFn, transformFn, mapFn) {
    _type = type == null ? EnumMember : type
    _validatorFn = validatorFn == null ? ValidateMap : validatorFn
    _transformFn = transformFn == null ? TransformList : transformFn
    _mapFn = mapFn == null ? MapEnum : mapFn
  }


  /**
   * Mirrors `Enum.new`, masking the fact that this is a factory during use. Creates a new `Enum` instance
   * using the stored modules for construction.
   * @param {String} name The name to use for the `Enum` instance.
   * @param {List|Map} values A `List` or `Map` of keys/values to use for the `Enum` members.
   * @return {Enum} The constructed `Enum` instance.
   */
  new (name, values) {
    return Enum.new(name, values, _type, _validatorFn, _transformFn, _mapFn)
  }


}
