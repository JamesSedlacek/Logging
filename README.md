# Logging

[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![GitHub stars](https://img.shields.io/github/stars/JamesSedlacek/Logging.svg)](https://github.com/JamesSedlacek/Logging/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/JamesSedlacek/Logging.svg?color=blue)](https://github.com/JamesSedlacek/Logging/network)
[![GitHub contributors](https://img.shields.io/github/contributors/JamesSedlacek/Logging.svg?color=blue)](https://github.com/JamesSedlacek/Logging/network)
<a href="https://github.com/JamesSedlacek/Logging/pulls"><img src="https://img.shields.io/github/issues-pr/JamesSedlacek/Logging" alt="Pull Requests Badge"/></a>
<a href="https://github.com/JamesSedlacek/Logging/issues"><img src="https://img.shields.io/github/issues/JamesSedlacek/Logging" alt="Issues Badge"/></a>

## Description
`Logging` is a Swift Macro library for handling logging. <br>

<br>

## Requirements

- **iOS**: 15.0 or later.
- **macOS**: 12.0 or later.
- **tvOS**: 15.0 or later.
- **watchOS**: 8.0 or later.

<br>

## Installation

You can install `Logging` using the Swift Package Manager.

1. In Xcode, select "File" > "Add Package Dependencies".
2. Copy & paste the following into the "Search or Enter Package URL" search bar.
```
https://github.com/JamesSedlacek/Logging.git
```
4. Xcode will fetch the repository & the "Logging" library will be added to your project.

<br>

## Example Usage
1. Add `import Logging` to the top of any Swift file
2. Add `@Logging` to any struct, class, or actor
3. Use `logger` to log anything

```swift
import Logging

@Logging
struct SomeObject {
    let someProperty: String

    func someMethod() {
        logger.log("Hello, world!")
    }
}
```

## Expanded Macro
```swift
struct SomeObject {
    let someProperty: String

    private let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "Default Subsystem",
                                category: String(describing: Self.self))

    func someMethod() {
        logger.log("Hello, world!")
    }
}
```

<br>

## Author

James Sedlacek, find me on [X/Twitter](https://twitter.com/jsedlacekjr) or [LinkedIn](https://www.linkedin.com/in/jamessedlacekjr/)

<br>

## License

<details>
  <summary><strong>Logging is available under the MIT license.</strong></summary>
  <br>

Copyright (c) 2023 James Sedlacek

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

</details>



