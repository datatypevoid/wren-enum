/*
 * Imports
 */

import "../wren_modules/wren-test/dist/module" for Expect, Suite, ConsoleReporter
import "../src/validate" for ValidateMap


/*
 * Structures
 */

var Test = Suite.new("ValidateMap") { |it|


  it.suite("ValidateMap (values)") { |it|


    it.should("reject anything other than a 'Map' for the 'values' parameter.") {

      var testFn = Fn.new { |value|

        Expect.call(
          Fiber.new {
            ValidateMap.call(value)
          }
        ).toBeARuntimeError("'Map' expected for 'values' parameter.")

      }

      testFn.call(true)

      testFn.call("0xdeadf411")

      testFn.call(2 << 16)

      testFn.call(2..64)

      testFn.call(2046...4098)

      testFn.call(
        Fn.new { |args|
          return args
        }
      )

      testFn.call([])

    }


    it.should("reject a 'Map' which has 'keys' or 'values' that are not of type 'String' or 'Num'.") {

      var testFn = Fn.new { |value|

        Expect.call(
          Fiber.new {
            ValidateMap.call(value)
          }
        ).toBeARuntimeError("Enumeration member 'keys' and 'values' must be of type 'String' or 'Num'.")

      }

      testFn.call({
        "bad": ["value"]
      })

      testFn.call({
        "bad": {
          "test": ["values"]
        }
      })

      testFn.call({
        "good": "value",
        "another": 0,
        "bad": null
      })

      testFn.call({
        "bad": true
      })

      testFn.call({
        "bad": Fn.new { |args|
          return args
        }
      })

    }


    it.should("accept a properly formed 'Map' parameter.") {

      var testFn = Fn.new { |value|

        Expect.call(
          Fiber.new {
            ValidateMap.call(value)
          }
        ).not.toBeARuntimeError

      }

      testFn.call({
        "Boise": "Idaho",
        "Fort Stevens": "Colorado",
        "Anchorage": "Alaska"
      })

      testFn.call({
        "Apples": 12,
        "Oranges": 2,
        "Mangos": 2 << 3,
        "Peaches": -32
      })

      testFn.call({
        32: "Hank Hill",
        72: "Bill Dauterive",
        8: "Jeffrey Boomhauer III"
      })

    }


    it.should("reject a 'Map' which contains duplicate 'values'.") {

      Expect.call(
        Fiber.new {
          ValidateMap.call({
            "Silver": "0xc0c0c0",
            "Gray": "0x808080",
            "Black": "0x000000",
            "White": "0xc0c0c0"
          })
        }
      ).toBeARuntimeError("Attempted to reuse key: 0xc0c0c0.")

    }


  }


}

Test.run(ConsoleReporter.new())
