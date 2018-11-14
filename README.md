# wren-enum

This module simulates [enumerated  types](https://en.wikipedia.org/wiki/Enumerated_type) in `wren`.

It takes inspiration from the [Python Enum API](https://docs.python.org/3/library/enum.html).


## Getting Started

The [source](https://github.com/datatypevoid/wren-enum/blob/develop/src) files should be dropped into an existing project and the top module imported:

```wren
import "./relative/path/to/wren-enum/module" for Enum
```

Alternatively, if utilizing [wrenpm](https://github.com/brandly/wrenpm) for package management in your project, you can add `wren-enum` to your `package.toml` file and install `wren-enum` from within your project root directory with:

```bash
$ wrenpm install
```


## Usage

```wren
import "./relative/path/to/wren-enum/module" for Enum

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

// --------------------------------------------------------------------

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

// --------------------------------------------------------------------

var Flag = Enum.new("Flag", {
  "Read": 1 << 0,
  "Write": 1 << 1
})

// Output: `<enum 'Flag'>`
System.print(Flag.toString())

// Output: `<Flag.Read: 1>`
System.print(Flag["Read"].toString())

// Output: `Read`
System.print(Flag["Read"].name)

// Output: `1`
System.print(Flag["Read"].value)

// Output: `true`
System.print(Flag["Read"] != Flag["Write"])

// Error: `'Enum' does not support the '<' operator.`
// System.print(Flag["Read"] < Flag["Write"])

// Output: `true`
System.print(Flag[1 << 0] == Flag["Read"])

// --------------------------------------------------------------------

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

```


### Dependencies

-	*wren* - The best way to get `wren` up and running on your machine is to build from source. You can find more details [here](http://wren.io/getting-started.html).
- *git* - Get `git` [from here](http://git-scm.com/download/mac).


### Testing

Test scripts utilize the [wren-test](https://github.com/gsmaverick/wren-test) framework and are stored in the `tests/` [directory](https://github.com/datatypevoid/wren-enum/tree/develop/tests). You can launch the tests with:

```bash
$ wren ./tests/module.wren
```


### Examples

Examples live in the `examples/` [directory](https://github.com/datatypevoid/wren-enum/tree/develop/examples). You can run an example with:

```bash
# `file` is the filename of the example you'd like to run.
$ wren ./tests/file.wren
```


## Wren

### Use a Wren-aware editor

We have good experience using these editors:

-	[Atom](https://atom.io/) with the [Wren language package](https://github.com/munificent/wren-atom)


## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [releases on this repository](https://github.com/datatypevoid/wren-enum/releases).


## Authors

* **David Newman** - *Initial development and ongoing maintenance* - [datatypevoid](https://github.com/datatypevoid)

See also the list of [contributors](https://github.com/datatypevoid/wren-enum/blob/develop/contributors.toml) who participated in this project.


## License

This project is licensed under the ISC License - see the [LICENSE](https://github.com/datatypevoid/wren-enum/blob/develop/LICENSE) file for details


## Acknowledgments

* Thanks to [Bob](https://github.com/munificent) and [friends](https://github.com/munificent/wren/graphs/contributors) for giving us [Wren](https://github.com/munificent/wren).
