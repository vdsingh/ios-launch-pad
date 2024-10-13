# Import necessary modules
import os
from enum import Enum

# Define the path to the templates directory
TEMPLATES_PATH = "./Tools/Templates"

# Define an enumeration for different module types
class ModuleType(Enum):
    UI = "UI"
    SERVICE = "Service"
    APP = "App"
    OTHER = "Other"

    @property
    def supportsExampleApp(self):
        # All module types except APP support example apps
        return self != ModuleType.APP

def get_module_name():
    # Prompt the user to enter the name of the new module
    return input("Enter the name of the new module: ")

def determine_module_type(module_name):
    # Determine the module type based on the module name
    if module_name.endswith("UI"):
        return ModuleType.UI
    elif module_name.endswith("Service"):
        return ModuleType.SERVICE
    elif module_name.endswith("App"):
        return ModuleType.APP
    else:
        return ModuleType.OTHER

def create_module_path(module_name):
    # Create the path for the new module
    return os.path.join("./Modules", module_name)

def create_module_folder(module_path, module_type):
    try:
        # Create the main module folder
        os.makedirs(module_path)
        print(f"Created new module folder: {module_path}")
        
        # Create Sources and Tests folders
        os.makedirs(os.path.join(module_path, "Sources"))
        os.makedirs(os.path.join(module_path, "Tests"))
        print(f"Created Sources and Tests folders in: {module_path}")

        if module_type.supportsExampleApp:
            os.makedirs(os.path.join(module_path, "Example"))
            print(f"Created Example folder in: {module_path}")
    except FileExistsError:
        print(f"Module folder already exists: {module_path}")
    except Exception as e:
        print(f"An error occurred while creating the module folder: {e}")

def create_project_swift(
        template_file_name,
        module_path,
        module_name, 
        module_type
):
    # Create the Project.swift file from a template
    template_path = os.path.join(TEMPLATES_PATH, template_file_name)
    project_swift_path = os.path.join(module_path, "Project.swift")
    
    try:
        # Read the template file
        with open(template_path, 'r') as template_file:
            content = template_file.read()
        
        # Replace the placeholders with the actual module name and type
        content = content.replace("{{ModuleName}}", module_name)
        content = content.replace("{{ModuleType}}", module_type.value)
        
        # Write the modified content to the new Project.swift file
        with open(project_swift_path, 'w') as project_file:
            project_file.write(content)
        
        print(f"Created Project.swift at: {project_swift_path}")
    except FileNotFoundError:
        print(f"Template file not found: {template_path}")
    except Exception as e:
        print(f"An error occurred while creating Project.swift: {e}")

def create_tests_swift(module_path, module_name):
    # Create the Tests.swift file from a template
    template_path = os.path.join(TEMPLATES_PATH, "Tests.swift")
    tests_swift_path = os.path.join(module_path, "Tests", f"{module_name}Tests.swift")
    
    try:
        # Read the template file
        with open(template_path, 'r') as template_file:
            content = template_file.read()
        
        # Replace the placeholder with the actual module name
        content = content.replace("{{ModuleName}}", module_name)
        
        # Write the modified content to the new Tests.swift file
        with open(tests_swift_path, 'w') as tests_file:
            tests_file.write(content)
        
        print(f"Created {module_name}Tests.swift at: {tests_swift_path}")
    except FileNotFoundError:
        print(f"Template file not found: {template_path}")
    except Exception as e:
        print(f"An error occurred while creating {module_name}Tests.swift: {e}")

def create_view_swift(module_path, module_name):
    # Create the View.swift file from a template
    template_path = os.path.join(TEMPLATES_PATH, "View.swift")
    view_swift_path = os.path.join(module_path, "Sources", f"{module_name}View.swift")
    
    try:
        # Read the template file
        with open(template_path, 'r') as template_file:
            content = template_file.read()
        
        # Replace the placeholder with the actual module name
        content = content.replace("{{ModuleName}}", module_name)
        
        # Write the modified content to the new View.swift file
        with open(view_swift_path, 'w') as view_file:
            view_file.write(content)
        
        print(f"Created {module_name}View.swift at: {view_swift_path}")
    except FileNotFoundError:
        print(f"Template file not found: {template_path}")
    except Exception as e:
        print(f"An error occurred while creating {module_name}View.swift: {e}")

def create_service_swift(module_path, module_name):
    # Create the Service.swift file from a template
    template_path = os.path.join(TEMPLATES_PATH, "Service.swift")
    service_swift_path = os.path.join(module_path, "Sources", f"{module_name}.swift")
    
    try:
        # Read the template file
        with open(template_path, 'r') as template_file:
            content = template_file.read()
        
        # Replace the placeholder with the actual module name
        content = content.replace("{{ModuleName}}", module_name)
        
        # Write the modified content to the new Service.swift file
        with open(service_swift_path, 'w') as service_file:
            service_file.write(content)
        
        print(f"Created {module_name}Service.swift at: {service_swift_path}")
    except FileNotFoundError:
        print(f"Template file not found: {template_path}")
    except Exception as e:
        print(f"An error occurred while creating {module_name}Service.swift: {e}")

def create_app_swift(module_path, module_name):
    # Create the App.swift file from a template
    template_path = os.path.join(TEMPLATES_PATH, "App.swift")
    app_swift_path = os.path.join(module_path, "Sources", f"{module_name}.swift")
    
    try:
        # Read the template file
        with open(template_path, 'r') as template_file:
            content = template_file.read()
        
        # Replace the placeholder with the actual module name
        content = content.replace("{{ModuleName}}", module_name)
        
        # Write the modified content to the new App.swift file
        with open(app_swift_path, 'w') as app_file:
            app_file.write(content)
        
        print(f"Created {module_name}.swift at: {app_swift_path}")
    except FileNotFoundError:
        print(f"Template file not found: {template_path}")
    except Exception as e:
        print(f"An error occurred while creating {module_name}App.swift: {e}")

def create_placeholder_swift(module_path):
    # Create an empty Placeholder.swift file
    placeholder_swift_path = os.path.join(module_path, "Sources", "Placeholder.swift")
    
    try:
        # Create an empty file
        with open(placeholder_swift_path, 'w') as placeholder_file:
            placeholder_file.write("")  # Create an empty file
        
        print(f"Created Placeholder.swift at: {placeholder_swift_path}")
    except Exception as e:
        print(f"An error occurred while creating Placeholder.swift: {e}")

def create_example_app_swift(module_path, module_name):
    # Create the Example App.swift file from a template
    template_path = os.path.join(TEMPLATES_PATH, "App.swift")
    example_app_swift_path = os.path.join(module_path, "Example", f"{module_name}ExampleApp.swift")
    
    try:
        # Read the template file
        with open(template_path, 'r') as template_file:
            content = template_file.read()
        
        # Replace the placeholder with the actual module name
        content = content.replace("{{ModuleName}}", f"{module_name}Example")
        
        # Write the modified content to the new Example App.swift file
        with open(example_app_swift_path, 'w') as example_app_file:
            example_app_file.write(content)
        
        print(f"Created {module_name}ExampleApp.swift at: {example_app_swift_path}")
    except FileNotFoundError:
        print(f"Template file not found: {template_path}")
    except Exception as e:
        print(f"An error occurred while creating {module_name}ExampleApp.swift: {e}")

def main():
    # Get the module name from the user
    module_name = get_module_name()
    # Determine the module type based on the name
    module_type = determine_module_type(module_name)
    # Create the module path
    module_path = create_module_path(module_name)
    # Create the module folder structure
    create_module_folder(module_path, module_type)
    # Create the tests file
    create_tests_swift(module_path, module_name)
    
    # Create specific files based on the module type
    if module_type == ModuleType.UI:
        create_project_swift("Feature_Project.swift", module_path, module_name, module_type)
        create_view_swift(module_path, module_name)
        create_example_app_swift(module_path, module_name)
    elif module_type == ModuleType.SERVICE:
        create_project_swift("Feature_Project.swift", module_path, module_name, module_type)
        create_service_swift(module_path, module_name)
        create_example_app_swift(module_path, module_name)
    elif module_type == ModuleType.APP:
        create_project_swift("App_Project.swift", module_path, module_name, module_type)
        create_app_swift(module_path, module_name)
    elif module_type == ModuleType.OTHER:
        create_project_swift("Feature_Project.swift", module_path, module_name, module_type)
        create_placeholder_swift(module_path)
        create_example_app_swift(module_path, module_name)

# Entry point of the script
if __name__ == "__main__":
    main()
