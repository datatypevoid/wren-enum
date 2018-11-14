/*
 * Imports
 */

import "../src/module" for Enum


/*
 * Example
 */

 // Member values can be `String`s as well.
 var Alias = Enum.new("Alias", {
   "Spiderman": "Peter Parker",
   "Ironman": "Tony Stark",
   "Hulk": "Bruce Banner"
 })

 // Output: `<enum 'Alias'>`
 System.print(Alias.toString())

 // Output: `<Alias.Spiderman: Peter Parker>`
 System.print(Alias["Spiderman"].toString())

 // Output: `Spiderman`
 System.print(Alias["Spiderman"].name)

 // Output: `Peter Parker`
 System.print(Alias["Spiderman"].value)

 // Output: `true`
 System.print(Alias["Spiderman"] != Alias["Ironman"])

 // Error: `'Enum' does not support the '<' operator.`
 // System.print(Alias["Spiderman"] < Alias["Ironman"])

 // Output: `true`
 System.print(Alias["Peter Parker"] == Alias["Spiderman"])
