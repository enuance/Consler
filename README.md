# Consler

## A convenient console input-output library.

___

### -- About --

The Consler is a library containing methods for easily formatting console output in various colors, weights, and new lines. It also contains a way to get Console input. Consler is able to output to both the Standard and Standard Error Output and automates handling format compatibility for various contexts, such as TTY, Dumb Terminal, and File Stream.

The common use case for this library would be to assist with building Command Line Tools where formatted text output (ie color, weight, or text positioning) is desired. Common use cases for formatted output can include bold red text for errors, yellow text for warnings, and ASCII art / Colored logos.

___
### -- Requirements --

This package uses `swift-tools-version:5.1` as a minimum requirement to build and install.

Check to see that you have Swift 5.1 or greater to meet the requirements
```zsh
% swift --version
```

Supported OS:
- macOS Catalina v10.15.1 or greater

___
### -- Installation --

The Swift Package Manager is supported for this library, but you can also Copy/Paste if needed.

- In your Package Manifest provide the following dependency
```swift

let package = Package(
    name: "your_Package_Name",
    dependencies: [
        // Add Consler for styled outputs to the Console
        // Make sure to add the version number you prefer to use
        .package(url: "https://github.com/enuance/consler", from: "your_prefered_min_version")
    ],
    targets: [
        // Add the Consler to the dependencies list of your targets 
        .target(
            name: "your_Target_Name",
            dependencies: ["Consler"],
        .testTarget(
            name: "your_Target_Name_Tests",
            dependencies: ["Consler"]),
    ]
)

```
___
### -- Usage --


You can use Consler directly without any formatting supplied.
```swift
Consler.output("Hello World")

// Resulting Console Output 
// -> Hello World
```

However many would want to supply formatting for the output
```swift
Consler.output(

    // The first param `values` is variadic and takes an arbitrary amount of Strings
    "Error: ", "An error occured during the process", 
    
    // The second param `descriptors` is an array of `OutputDescriptor` which describes how the
    // values in the first param should be formatted. The descriptor will be applied to the value
    // that matches it's index. Values without a descriptor will default to `.normal`
    descriptors: [.red(.bold)], 
    
    // The last param is the type of output either .standard or .error
    type: .error)

// Resulting Console Output 
// -> Error: An error occured during the process
```

The end of the output terminates with a new line, but you can further specify that any section begins on a new line.
```swift
Consler.output("Hi", "", "Hi again!", descriptors: [.endsLine, .endsLine])

// Resulting Console Output 
// -> Hi
// -> 
// -> Hi again!
```

Sometimes it's easier to pass around the values and descriptors together and output them at a different time.
```swift

func getSuccessMessage() -> ConslerOutput {
    return ConslerOutput("", "Sucsess: ", "Save Transaction Finished")
    .describedBy(.endsLine, .green(.bold), .green)
}

let successOutput = getSuccessMessage()

Consler.output(successOutput)

// Resulting Console Output 
// -> 
// -> "Sucsess: Save Transaction Finished"
```

For more complex formatting tasks such a logos, you can use the AppliedDescriptor type
```swift

func getLogoOutput() -> ConslerOutput {
    return ConslerOutput(
        #"   ______________________________________________"#,
        #"   __    __ "#, #" ______   ______   ______     ______ "#,
        #"    \    /  "#, #"|  ____| | ____ | | ____ \   | _____|"#,
        #"     \  /   "#, #"| |      | |  | | | |   \ \  | |     "#,
        #"      \/    "#, #"| |      | |  | | | |    \ | | |____ "#,
        #"      /\    "#, #"| |      | |  | | | |    / | |  ____|"#,
        #"     /  \   "#, #"| |____  | |__| | | |___/ /  | |____ "#,
        #"   _/_  _\_ "#, #"|______| |______| |______/   |______|"#,
        #"                                                 "#,
        #"   ______________________________________________"#,
        #"   CLEANER ULTRA-MAX 2000+                       "#,
        #"   ______________________________________________"#,
        #"                                                 "#,
        #"                                                 "#
    ).describedBy(
    
        // AppliedDescriptors use indices to select which values to apply the specified descriptor
        // All invalid indices are ignored. Repeated indices will be overwritten by the last 
        // descriptor containing the repeated index.
        .redEndsLine([.bold], at: 0, 16, 18), 
        .red([.bold], at: 1, 3, 5, 7, 9, 11, 13),
        .redEndsLine(at: 2, 4, 6, 8, 10, 12, 14), 
        .cyanEndsLine([.bold], at: 17), 
        .endsLine(15, 19, 20)
    )
    
}

let logoOutput = getLogoOutput()

Consler.output(logoOutput)

// Resulting Console Output 
// ->   ______________________________________________
// ->   __    __  ______   ______   ______     ______ 
// ->    \    /  |  ____| | ____ | | ____ \   | _____|
// ->     \  /   | |      | |  | | | |   \ \  | |     
// ->      \/    | |      | |  | | | |    \ | | |____ 
// ->      /\    | |      | |  | | | |    / | |  ____|
// ->     /  \   | |____  | |__| | | |___/ /  | |____ 
// ->   _/_  _\_ |______| |______| |______/   |______|
// ->                                                 
// ->   ______________________________________________
// ->   CLEANER ULTRA-MAX 2000+                       
// ->   ______________________________________________
// ->                                                 
// ->                                                 
```

You can also read input from the Console
```swift
Consler.input()
```

Supported Console Formats include:

For both text and background colors
- Normal
- Red / Light Red
- Green / Light Green
- Yellow / Light Yellow
- Blue / Light Blue
- Magenta / Light Magenta
- Cyan / Light Cyan
- White / Black
- Gray / Dark Gray

- 256 XTerm Colors, specified as 0 - 255.
See https://jonasjacek.github.io/colors/ for reference

- Bold
- Dim
- Underlined
- Blinking
- Inverted
- Hidden
