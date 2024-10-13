# iOS Launch Pad

This repository serves as a comprehensive starter kit for iOS app development, providing a solid foundation and essential features to kickstart your app development process.

## Important Notes

1. **Tuist**: The project is configured to use [Tuist](https://tuist.io/), a command-line tool that helps you generate, maintain, and interact with Xcode projects. Make sure you have it installed before proceeding.

2. **Modular Architecture**: The project is structured using a modular approach, allowing for better code organization and scalability. There is some customization with certain module types (`App`, `UI`, and `Service`), but you can easily customize the project to fit your needs (see `Tools/new-module.py`).

3. **Dependencies**: You can add new dependencies in `Tuist/Package.swift`.

4. **Sample App**: Includes a sample app (`CounterApp`) and UI (`CounterUI`) module to demonstrate the modular architecture. These modules are made to be deleted!

This starter kit provides a robust foundation for building iOS apps, with a focus on modularity, modern Swift practices, and developer productivity. It's designed to be flexible and can be easily customized to fit your specific project requirements.


## How to Use

1. **Clone the Repository**: Start by cloning this repository to your local machine.

   ```
   git clone https://github.com/vdsingh/ios-launch-pad.git
   cd ios-launch-pad
   ```

2. **Install Tuist**: If you haven't already, install Tuist by following the instructions on the [official Tuist website](https://docs.tuist.io/).

3. **Install Dependencies and Generate Xcode Project**: Use Tuist to install package dependencies and generate the Xcode project.

   ```
   tuist install && tuist generate
   ```

4. **Run the sample app**: The `tuist generate` command should open Xcode. Try running the `CounterApp` target.

5. **Create New Modules**: Once you're ready, create a new module using the provided script:

   ```
   make new-module
   ```

6. **Remove Sample Modules**: Once you're familiar with the structure, you can remove the sample `CounterApp` and `CounterUI` modules and replace them with your own app modules.