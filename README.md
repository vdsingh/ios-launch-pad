# iOS Launch Pad

A starter kit + toolkit for streamlining modular iOS app development. Parts of this project use [Tuist](https://tuist.io/), [The Composable Architecture](https://github.com/pointfreeco/swift-composable-architecture), and [Factory](https://github.com/hmlongco/Factory).

## Features

### **Project Generation with Tuist**
[Tuist](https://tuist.io/) is used for streamlining project generation.

How to use: 
1. Install tuist (follow the instructions on their [website](https://tuist.io/))
2. Run `tuist edit` from the project root to adjust tuist-specific configuration. To add a new package dependency, see `Tuist/Package.swift`
3. Run `make new-module` to create a new app module. See [Modular Architecture](#modular-architecture) for more info on modules
4. Run `tuist install` to install package dependencies
5. Run `tuist generate` to generate the project

### **Modular Architecture**
Modularization allows for better code organization and scalability. There is some auto-generation for built-in module types, which you can try out by running `make new-module` and entering a module name that ends with `App`, `UI`, or `Service`. You can add custom module types to fit your needs (see `Tools/new-module.py`). App modules (or "micro-features") should be located in the `Modules` folder.

Notes:
- All modules need a `Project.swift` file that is used by Tuist, which you can edit to change the target configuration (e.g. declaring module dependencies, adding info.plist values, etc.)
- Non-`App` modules come with an example app target which you can delete if you don't need it
- You need to declare module dependencies in the `Project.swift` file for any given module

### **Xcode Templates**
Within the `Templates` folder, there are some custom Xcode templates to streamline the development process by providing boilerplate code for common shapes.
How to use:
1. Remove any templates that you don't want to use (or add more!)
2. Move the Templates folder to `~/Library/Developer/Xcode/`
3. Restart Xcode
4. You can use the templates by going to File -> New -> (one of the templates)

### **Pre-built Services**
Within the `Modules` folder are implementations of common services that you can leverage for app features (e.g., Device Location Service). [Factory](https://github.com/hmlongco/Factory) is used by default for dependency injection, though this can be easily swapped by making adjustments to your Service module's `Accessors.swift` file. Remove any services you don't need.

## In the Pipeline:

- Keychain Service
- User Defaults Service
- API Client
- Simple Design System Implementation
- More tools for automation (e.g., scripts to automate declaration of dependencies)