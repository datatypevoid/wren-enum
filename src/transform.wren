/*
 * Structures
 */

/**
 * Given a `List`, takes each item and maps it to a `Num` value. There are no guarantees made on the
 * values that will be used as far as order, contiguousness, etc, only that they will be a `Num`.
 * @param {List} list `List` to transform.
 * @return {Map}
 */
var TransformList = Fn.new { |list|

  var mapped = {}

  var iter

  while (iter = list.iterate(iter)) {
    mapped[list.iteratorValue(iter)] = iter
  }

  return mapped

}
