/*
 * Imports
 */

import "../src/factory" for EnumFactory
import "../wren_modules/wren-test/dist/module" for Expect, Suite, Stub


/*
 * Structures
 */

class MockEnumMember {
  construct new (key, name, value, type) {}
}


var GetValidateStub = Fn.new {
  return Stub.new("ValidateMap", Fn.new { |values|
    // No-op
  })
}


var GetMapFnStub = Fn.new { |ret|
  return Stub.andReturnValue("MapEnum", ret)
}


var Enum = EnumFactory.create(MockEnumMember, GetValidateStub.call(), Stub.new("TransformList"), GetMapFnStub.call({}))


var EnumTest = Suite.new("Enum") { |it|


  it.suite("construct new (name, values, memberClass, validatorFn)") { |it|


    it.should("throw an error if the values parameter is not a 'List' or 'Map'.") {

      Expect.call(
        Fiber.new {
          Enum.new("Species", "Bird")
        }
      ).toBeARuntimeError("'List' or 'Map' expected for 'values' parameter when constructing 'Enum'.")

    }


    it.should("call the provided validation and map functions when given valid input.") {

      var validateStub = GetValidateStub.call()

      var mapStub = GetMapFnStub.call({
        "Portland": {},
        "Denver": {},
        "Los Angeles": {},
        0: {},
        1: {},
        2: {}
      })

      var transformStub = Stub.new("TransformList")

      // Enum with mocked dependencies.
      var enum = EnumFactory.create(MockEnumMember, validateStub, transformStub, mapStub)

      var city = enum.new("City", {
        "Portland": 0,
        "Denver": 1,
        "Los Angeles": 2
      })

      Expect.call(validateStub.called).toBeTrue
      Expect.call(mapStub.called).toBeTrue
      Expect.call(transformStub.called).toBeFalse

    }


    it.should("call the provided transform function when given a 'List' of values.") {

      var validateStub = GetValidateStub.call()

      var mapStub = GetMapFnStub.call({
        "Portland": {},
        "Denver": {},
        "Los Angeles": {},
        0: {},
        1: {},
        2: {}
      })

      var transformStub = Stub.andReturnValue("TransformList", {
        "Portland": 0,
        "Denver": 1,
        "Los Angeles": 2
      })

      // Enum with mocked dependencies.
      var enum = EnumFactory.create(MockEnumMember, validateStub, transformStub, mapStub)

      var city = enum.new("City", [
        "Portland",
        "Denver",
        "Los Angeles"
      ])

      Expect.call(validateStub.called).toBeTrue
      Expect.call(mapStub.called).toBeTrue
      Expect.call(transformStub.called).toBeTrue

    }


  }


  it.suite("name") { |it|


    it.should("return the 'name' property of the 'Enum' instance when invoked as a getter.") {

      var testFn = Fn.new { |name, values|

        var enum = Enum.new(name, values)

        var result = enum.name

        Expect.call(result).toBe(String)
        Expect.call(result).toEqual(name)

      }

      testFn.call("City", {
        "Boise": "Idaho",
        "Fort Stevens": "Colorado",
        "Anchorage": "Alaska"
      })

      testFn.call("Team", {
        32: "Hank Hill",
        72: "Bill Dauterive",
        8: "Jeffrey Boomhauer III"
      })

      testFn.call("Fruit", {
        "Apples": 12,
        "Oranges": 2,
        "Mangos": 2 << 3,
        "Peaches": -32
      })

    }


  }


  it.suite("has (index)") { |it|

    var validateStub = GetValidateStub.call()

    var mapStub = GetMapFnStub.call({
      "Portland": {},
      "Denver": {},
      "Los Angeles": {},
      0: {},
      1: {},
      2: {}
    })

    var transformStub = Stub.new("TransformList")

    // Enum with mocked dependencies.
    var enum = EnumFactory.create(MockEnumMember, validateStub, transformStub, mapStub)

    var city

    it.beforeEach {

      city = enum.new("City", {
        "Portland": 0,
        "Denver": 1,
        "Los Angeles": 2
      })

    }


    it.should("return a Bool value of 'true' if there is a member associated with an index.") {

      var hasMember = city.has("Portland")

      Expect.call(hasMember).toBe(Bool)
      Expect.call(hasMember).toBeTrue

      hasMember = city.has(1)

      Expect.call(hasMember).toBe(Bool)
      Expect.call(hasMember).toBeTrue

    }


    it.should("return a Bool value of 'false' if there is a member associated with an index.") {

      var hasMember = city.has("New York")

      Expect.call(hasMember).toBe(Bool)
      Expect.call(hasMember).toBeFalse

      hasMember = city.has(42)

      Expect.call(hasMember).toBe(Bool)
      Expect.call(hasMember).toBeFalse

    }


    it.should("throw an error if the given index is not a 'String' or 'Num'.") {

      var testFn = Fn.new { |input|

        Expect.call(
          Fiber.new {
            var hasMember = city.has(input)
          }
        ).toBeARuntimeError("Expected 'String' or 'Num' for 'index' parameter.")

      }

      testFn.call({})

      testFn.call([])

      testFn.call(null)

    }


  }


  it.suite("toString ()") { |it|


    it.should("return a 'String' representation of an 'Enum' instance.") {

      var testFn = Fn.new { |name, values|

        var enum = Enum.new(name, values)

        var result = enum.toString()

        Expect.call(result).toBe(String)
        Expect.call(result).toEqual("<enum '%(name)'>")

      }

      testFn.call("City", {
        "Boise": "Idaho",
        "Fort Stevens": "Colorado",
        "Anchorage": "Alaska"
      })

      testFn.call("Team", {
        32: "Hank Hill",
        72: "Bill Dauterive",
        8: "Jeffrey Boomhauer III"
      })

      testFn.call("Fruit", {
        "Apples": 12,
        "Oranges": 2,
        "Mangos": 2 << 3,
        "Peaches": -32
      })

    }


  }


  it.suite("[index]") { |it|


    it.should("throw an error if a non-existent enum member is requested.") {

      Expect.call(
        Fiber.new {
          var flag = Enum.new("Flag", {
            "Read": 1 << 0,
            "Write": 1 << 1
          })["read"]
        }
      ).toBeARuntimeError("Invalid enum member: read")

    }


    it.should("return an enum for a valid index.") {

      var validateStub = GetValidateStub.call()

      var transformStub = Stub.andReturnValue("TransformList", {
        "Portland": 0,
        "Denver": 1,
        "Los Angeles": 2
      })

      var mapResult = {
        "Portland": {},
        "Denver": {},
        "Los Angeles": {},
        0: {},
        1: {},
        2: {}
      }

      var mapStub = GetMapFnStub.call(mapResult)

      // Enum with mocked dependencies.
      var enum = EnumFactory.create(MockEnumMember, validateStub, transformStub, mapStub)

      var city = enum.new("City", [
        "Portland",
        "Denver",
        "Los Angeles"
      ])

      Expect.call(
        city["Portland"]
      ).toEqual(mapResult["Portland"])

      Expect.call(
        city[0]
      ).toEqual(mapResult[0])

      Expect.call(validateStub.called).toBeTrue
      Expect.call(mapStub.called).toBeTrue
      Expect.call(transformStub.called).toBeTrue

    }


  }


  it.suite("[index] = (value)") { |it|


    it.should("throw an error if the '=' operator is invoked.") {

      Expect.call(
        Fiber.new {
          Enum.new("City", {
            "Boise": "Idaho",
            "Fort Stevens": "Colorado",
            "Anchorage": "Alaska"
          })["Miami"] = "Florida"
        }
      ).toBeARuntimeError("Cannot set enumerated value.")

    }


  }


  it.suite("< (other)") { |it|


    it.should("throw an error if the '<' operator is invoked.") {

      Expect.call(
        Fiber.new {
          Enum.new("Fruit", {
            "Apples": 12,
            "Oranges": 2,
            "Mangos": 2 << 3,
            "Peaches": -32
          }) < 42
        }
      ).toBeARuntimeError("'Enum' does not support the '<' operator.")

    }


  }


  it.suite("> (other)") { |it|


    it.should("throw an error if the '>' operator is invoked.") {

      Expect.call(
        Fiber.new {
          var isGreaterThan = Enum.new("City", {
            "Boise": "Idaho",
            "Fort Stevens": "Colorado",
            "Anchorage": "Alaska"
          }) > 42
        }
      ).toBeARuntimeError("'Enum' does not support the '>' operator.")

    }


  }


  it.suite("== (other)") { |it|


    it.should("throw an error if the '==' operator is invoked.") {

      var enum = Enum.new("Fruit", {
        "Apples": 12,
        "Oranges": 2,
        "Mangos": 2 << 3,
        "Peaches": -32
      })

      var other = Enum.new("Fruit", {
        "Apples": 12,
        "Oranges": 2,
        "Mangos": 2 << 3,
        "Peaches": -32
      })

      Expect.call(
        Fiber.new {
          var areEqual = enum == other
        }
      ).toBeARuntimeError("'Enum' does not support the '==' operator.")

    }


  }


}
