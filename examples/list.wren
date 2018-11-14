/*
 * Imports
 */

import "../src/module" for Enum


/*
 * Example
 */

 // Create an `Enum` from a `List`, automatically generating the value
 // of each member.
 var Color = Enum.new("Color", ["Red", "Green", "Blue"])

 // Output: `<enum 'Color'>`
 System.print(Color.toString())

 // Output: `<Color.Red: 0>`
 System.print(Color["Red"].toString())

 // Output: `Red`
 System.print(Color["Red"].name)

 // Output: `0`
 System.print(Color["Red"].value)

 // Output: `true`
 System.print(Color["Red"] != Color["Blue"])

 // Error: `'Enum' does not support the '<' operator.`
 // System.print(Color["Red"] < Color["Blue"])

 // Output: `true`
 System.print(Color[0] == Color["Red"])
