/*
 * Imports
 */

import "../src/module" for Enum


/*
 * Example
 */

 // Define numeric values for each member in a `Map`.
 var City = Enum.new("City", {
   "Portland": 0,
   "Denver": 1,
   "Los Angeles": 2
 })

 // Output: `<enum 'City'>`
 System.print(City.toString())

 // Test 1
 // Output: `<City.Portland: 0>`
 System.print(City["Portland"].toString())

 // Test 2
 // Output: `Portland`
 System.print(City["Portland"].name)

 // Output: `0`
 System.print(City["Portland"].value)

 // Output: `true`
 System.print(City["Portland"] != City["Denver"])

 // Error: `'Enum' does not support the '<' operator.`
 // System.print(City["Portland"] < City["Denver"])

 // Output: `true`
 System.print(City[0] == City["Portland"])
