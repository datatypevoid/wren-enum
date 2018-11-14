/*
 * Imports
 */

import "../src/enumMember" for EnumMember
import "../wren_modules/wren-test/dist/module" for Expect, Suite


/*
 * Structures
 */

var EnumMemberTest = Suite.new("EnumMember") { |it|


  it.suite("construct new (key, name, value, type)") { |it|


    it.should("construct a new EnumMember using a 'Num' for the 'key' and a 'String' for the 'value'.") {

      var type = {}

      var member = EnumMember.new(0, "Color", "Red", type)

      Expect.call(member).toBe(EnumMember)

      Expect.call(member.name).toEqual("Red")
      Expect.call(member.parent).toEqual("Color")
      Expect.call(member.type).toEqual(type)
      Expect.call(member.value).toEqual(0)

    }


    it.should("construct a new EnumMember using a 'String' for the 'key' and a 'String' for the 'value'.") {

      var type = {}

      var member = EnumMember.new("FFFFFF", "Color", "White", type)

      Expect.call(member).toBe(EnumMember)

      Expect.call(member.name).toEqual("White")
      Expect.call(member.parent).toEqual("Color")
      Expect.call(member.type).toEqual(type)
      Expect.call(member.value).toEqual("FFFFFF")

    }


    it.should("construct a new EnumMember using a 'String' for the 'key' and a 'Num' for the 'value'.") {

      var type = {}

      var member = EnumMember.new("FFFFFF", "Color", 1, type)

      Expect.call(member).toBe(EnumMember)

      Expect.call(member.name).toEqual(1)
      Expect.call(member.parent).toEqual("Color")
      Expect.call(member.type).toEqual(type)
      Expect.call(member.value).toEqual("FFFFFF")

    }


    it.should("throw an error if given a 'null' value for the 'key' parameter.") {

      Expect.call(
        Fiber.new {
          var member = EnumMember.new(null, "Color", "Red", {})
        }
      ).toBeARuntimeError("'Num' or 'String' expected for 'key' parameter.")

    }


    it.should("throw an error if not given a 'String' or 'Num' for the 'key' parameter.") {

      var ErrorMsg = "'Num' or 'String' expected for 'key' parameter."

      Expect.call(
        Fiber.new {
          var member = EnumMember.new({}, "Color", "Red", {})
        }
      ).toBeARuntimeError(ErrorMsg)

      Expect.call(
        Fiber.new {
          var member = EnumMember.new([], "Color", "Red", {})
        }
      ).toBeARuntimeError(ErrorMsg)

    }


    it.should("throw an error if given a 'null' value for the 'name' parameter.") {

      Expect.call(
        Fiber.new {
          var member = EnumMember.new(0, null, "Red", {})
        }
      ).toBeARuntimeError("'String' expected for 'name' parameter.")

    }


    it.should("throw an error if not given a 'String' for the 'name' parameter.") {

      var ErrorMsg = "'String' expected for 'name' parameter."

      Expect.call(
        Fiber.new {
          var member = EnumMember.new(0, {}, "Red", {})
        }
      ).toBeARuntimeError(ErrorMsg)

      Expect.call(
        Fiber.new {
          var member = EnumMember.new(0, [], "Red", {})
        }
      ).toBeARuntimeError(ErrorMsg)

    }


    it.should("throw an error if given a 'null' value for the 'value' parameter.") {

      Expect.call(
        Fiber.new {
          var member = EnumMember.new(0, "Color", null, {})
        }
      ).toBeARuntimeError("'Num' or 'String' expected for 'value' parameter.")

    }


    it.should("throw an error if not given a 'String' or 'Num' for the 'value' parameter.") {

      var ErrorMsg = "'Num' or 'String' expected for 'value' parameter."

      Expect.call(
        Fiber.new {
          var member = EnumMember.new(0, "Color", {}, {})
        }
      ).toBeARuntimeError(ErrorMsg)

      Expect.call(
        Fiber.new {
          var member = EnumMember.new(0, "Color", [], {})
        }
      ).toBeARuntimeError(ErrorMsg)

      Expect.call(
        Fiber.new {
          var member = EnumMember.new(0, "Color", true, {})
        }
      ).toBeARuntimeError(ErrorMsg)

    }


    it.should("throw an error if given a 'null' value for the 'type' parameter.") {

      Expect.call(
        Fiber.new {
          var member = EnumMember.new(0, "Color", "Red", null)
        }
      ).toBeARuntimeError("'Map' expected for 'type' parameter.")

    }


    it.should("throw an error if not given a 'Map' for the 'type' parameter.") {

      var ErrorMsg = "'Map' expected for 'type' parameter."

      Expect.call(
        Fiber.new {
          var member = EnumMember.new(0, "Color", "Red", [])
        }
      ).toBeARuntimeError(ErrorMsg)

      Expect.call(
        Fiber.new {
          var member = EnumMember.new(0, "Color", "Red", 0)
        }
      ).toBeARuntimeError(ErrorMsg)

      Expect.call(
        Fiber.new {
          var member = EnumMember.new(0, "Color", "Red", "string value")
        }
      ).toBeARuntimeError(ErrorMsg)

      Expect.call(
        Fiber.new {
          var member = EnumMember.new(0, "Color", "Red", true)
        }
      ).toBeARuntimeError(ErrorMsg)

    }


  }


  it.suite("toString ()") { |it|


    it.should("return a string representation of an 'EnumMember' instance with a 'Num' for the 'key' and a 'String' for the 'value'.") {

      var member = EnumMember.new(0, "Color", "Red", {})
      var result = member.toString()

      Expect.call(result).toBe(String)
      Expect.call(result).toEqual("<Color.Red: 0>")

    }


    it.should("return a string representation of an 'EnumMember' instance with a 'String' for the 'key' and a 'String' for the 'value'.") {

      var member = EnumMember.new("FFFFFF", "Color", "White", {})
      var result = member.toString()

      Expect.call(result).toBe(String)
      Expect.call(result).toEqual("<Color.White: FFFFFF>")

    }


    it.should("return a string representation of an 'EnumMember' instance with a 'String' for the 'key' and a 'Num' for the 'value'.") {

      var member = EnumMember.new("FFFFFF", "Color", 1, {})
      var result = member.toString()

      Expect.call(result).toBe(String)
      Expect.call(result).toEqual("<Color.1: FFFFFF>")

    }


  }


  it.suite("< (other)") { |it|

    it.should("throw an error if the '<' operator is invoked.") {

      Expect.call(
        Fiber.new {
          EnumMember.new("FFFFFF", "Color", 1, {}) < 42
        }
      ).toBeARuntimeError("'EnumMember' does not support the '<' operator.")

    }

  }


  it.suite("> (other)") { |it|

    it.should("throw an error if the '>' operator is invoked.") {

      Expect.call(
        Fiber.new {
          EnumMember.new("FFFFFF", "Color", 1, {}) > 42
        }
      ).toBeARuntimeError("'EnumMember' does not support the '>' operator.")

    }

  }


  it.suite("== (other)") { |it|


    var member

    it.beforeEach {
      member = EnumMember.new("FFFFFF", "Color", "White", {})
    }


    it.should("return a boolean value of 'true' when comparing two equal 'EnumMember' instances.") {
      Expect.call(member == member).toBeTrue
    }


    it.should("return a boolean value of 'false' when comparing two inequal 'EnumMember' instances.") {

      var other = EnumMember.new("000000", "Color", "Black", {})

      Expect.call(member == other).toBeFalse

    }


  }


  it.suite("!= (other)") { |it|


    var member

    it.beforeEach {
      member = EnumMember.new("FFFFFF", "Color", "White", {})
    }


    it.should("return a boolean value of 'false' when comparing two equal 'EnumMember' instances.") {
      Expect.call(member != member).toBeFalse
    }


    it.should("return a boolean value of 'true' when comparing two inequal 'EnumMember' instances.") {

      var other = EnumMember.new("000000", "Color", "Black", {})

      Expect.call(member != other).toBeTrue

    }


  }


}
