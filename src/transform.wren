/*
 * Structures
 */

/**
 * Given a `List`, takes each item and maps it to a `Num` value. There are no guarantees made on the
 * values that will be used as far as order, contiguousness, etc, only that they will be a `Num`.
 * Throws an error if there are duplicate values found in the given 'List'.
 * @param {List} list `List` to transform.
 * @return {Map}
 */
var TransformList = Fn.new { |list|

  var mapped = {}

  var iter

  var value

  while (iter = list.iterate(iter)) {

    value = list.iteratorValue(iter)

    if (mapped[value] != null) Fiber.abort("Duplicate key found in 'List': %(value)")

    mapped[value] = iter

  }

  return mapped

}
