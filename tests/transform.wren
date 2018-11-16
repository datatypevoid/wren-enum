/*
 * Imports
 */

import "../src/transform" for TransformList
import "../wren_modules/wren-test/dist/module" for Expect, Suite


/*
 * Structures
 */

var TransformListTest = Suite.new("TransformList") { |it|


  it.should("transform a 'List' to a 'Map' where 'List' items are 'Map' keys.") {

    var input = ["Red", "Blue", "Green"]

    var result = TransformList.call(input)

    var iter
    var key
    var value

    while (iter = input.iterate(iter)) {

      key = input.iteratorValue(iter)
      value = result[key]

      Expect.call(value).not.toBeNull
      Expect.call(input[value]).toEqual(key)

    }


  }


  it.should("throw an error if the input 'List' contains duplicate items.") {

    var input = ["Red", "Blue", "Green", "Red"]

    Expect.call(
      Fiber.new {
        var result = TransformList.call(input)
      }
    ).toBeARuntimeError("Duplicate key found in 'List': Red")

  }


}
