/*
 * Imports
 */

import "../wren_modules/wren-test/dist/module" for ConsoleReporter
import "./enum" for EnumTest
import "./enumMember" for EnumMemberTest
import "./transform" for TransformListTest
import "./validate" for ValidateMapTest


/*
 * Structures
 */

// Store test suites in List.
var tests = [
  EnumTest,
  EnumMemberTest,
  TransformListTest,
  ValidateMapTest
]


// Execute tests.
for (test in tests) {
  test.run(ConsoleReporter.new())
}
