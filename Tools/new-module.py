import os
from enum import Enum

TEMPLATES_PATH = "./Tools/Templates"

class ModuleType(Enum):
    UI = "UI"
    SERVICE = "Service"
    APP = "App"
    OTHER = "Other"

def get_module_name():
    return input("Enter the name of the new module: ")

def determine_module_type(module_name):
    if module_name.endswith("UI"):
        return ModuleType.UI
    elif module_name.endswith("Service"):
        return ModuleType.SERVICE
    elif module_name.endswith("App"):
        return ModuleType.APP
    else:
        return ModuleType.OTHER

def create_module_path(module_name):
    return os.path.join("./Modules", module_name)

def create_module_folder(module_path):
    try:
        os.makedirs(module_path)
        print(f"Created new module folder: {module_path}")
        
        # Create Sources and Tests folders
        os.makedirs(os.path.join(module_path, "Sources"))
        os.makedirs(os.path.join(module_path, "Tests"))
        print(f"Created Sources and Tests folders in: {module_path}")
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
    template_path = os.path.join(TEMPLATES_PATH, template_file_name)
    project_swift_path = os.path.join(module_path, "Project.swift")
    
    try:
        with open(template_path, 'r') as template_file:
            content = template_file.read()
        
        # Replace the placeholders with the actual module name and type
        content = content.replace("{{ModuleName}}", module_name)
        content = content.replace("{{ModuleType}}", module_type.value)
        
        with open(project_swift_path, 'w') as project_file:
            project_file.write(content)
        
        print(f"Created Project.swift at: {project_swift_path}")
    except FileNotFoundError:
        print(f"Template file not found: {template_path}")
    except Exception as e:
        print(f"An error occurred while creating Project.swift: {e}")

def create_tests_swift(module_path, module_name):
    template_path = os.path.join(TEMPLATES_PATH, "Tests.swift")
    tests_swift_path = os.path.join(module_path, "Tests", f"{module_name}Tests.swift")
    
    try:
        with open(template_path, 'r') as template_file:
            content = template_file.read()
        
        # Replace the placeholder with the actual module name
        content = content.replace("{{ModuleName}}", module_name)
        
        with open(tests_swift_path, 'w') as tests_file:
            tests_file.write(content)
        
        print(f"Created {module_name}Tests.swift at: {tests_swift_path}")
    except FileNotFoundError:
        print(f"Template file not found: {template_path}")
    except Exception as e:
        print(f"An error occurred while creating {module_name}Tests.swift: {e}")

def create_view_swift(module_path, module_name):
    template_path = os.path.join(TEMPLATES_PATH, "View.swift")
    view_swift_path = os.path.join(module_path, "Sources", f"{module_name}View.swift")
    
    try:
        with open(template_path, 'r') as template_file:
            content = template_file.read()
        
        # Replace the placeholder with the actual module name
        content = content.replace("{{ModuleName}}", module_name)
        
        with open(view_swift_path, 'w') as view_file:
            view_file.write(content)
        
        print(f"Created {module_name}View.swift at: {view_swift_path}")
    except FileNotFoundError:
        print(f"Template file not found: {template_path}")
    except Exception as e:
        print(f"An error occurred while creating {module_name}View.swift: {e}")

def create_service_swift(module_path, module_name):
    template_path = os.path.join(TEMPLATES_PATH, "Service.swift")
    service_swift_path = os.path.join(module_path, "Sources", f"{module_name}.swift")
    
    try:
        with open(template_path, 'r') as template_file:
            content = template_file.read()
        
        # Replace the placeholder with the actual module name
        content = content.replace("{{ModuleName}}", module_name)
        
        with open(service_swift_path, 'w') as service_file:
            service_file.write(content)
        
        print(f"Created {module_name}Service.swift at: {service_swift_path}")
    except FileNotFoundError:
        print(f"Template file not found: {template_path}")
    except Exception as e:
        print(f"An error occurred while creating {module_name}Service.swift: {e}")

def create_app_swift(module_path, module_name):
    template_path = os.path.join(TEMPLATES_PATH, "App.swift")
    app_swift_path = os.path.join(module_path, "Sources", f"{module_name}.swift")
    
    try:
        with open(template_path, 'r') as template_file:
            content = template_file.read()
        
        # Replace the placeholder with the actual module name
        content = content.replace("{{ModuleName}}", module_name)
        
        with open(app_swift_path, 'w') as app_file:
            app_file.write(content)
        
        print(f"Created {module_name}.swift at: {app_swift_path}")
    except FileNotFoundError:
        print(f"Template file not found: {template_path}")
    except Exception as e:
        print(f"An error occurred while creating {module_name}App.swift: {e}")

def create_placeholder_swift(module_path):
    placeholder_swift_path = os.path.join(module_path, "Sources", "Placeholder.swift")
    
    try:
        with open(placeholder_swift_path, 'w') as placeholder_file:
            placeholder_file.write("")  # Create an empty file
        
        print(f"Created Placeholder.swift at: {placeholder_swift_path}")
    except Exception as e:
        print(f"An error occurred while creating Placeholder.swift: {e}")

def main():
    module_name = get_module_name()
    module_type = determine_module_type(module_name)
    module_path = create_module_path(module_name)
    create_module_folder(module_path)
    create_tests_swift(module_path, module_name)
    if module_type == ModuleType.UI:
        create_project_swift("Feature_Project.swift", module_path, module_name, module_type)
        create_view_swift(module_path, module_name)
    elif module_type == ModuleType.SERVICE:
        create_project_swift("Feature_Project.swift", module_path, module_name, module_type)
        create_service_swift(module_path, module_name)
    elif module_type == ModuleType.APP:
        create_project_swift("App_Project.swift", module_path, module_name, module_type)
        create_app_swift(module_path, module_name)
    elif module_type == ModuleType.OTHER:
        create_project_swift("Feature_Project.swift", module_path, module_name, module_type)
        create_placeholder_swift(module_path)

if __name__ == "__main__":
    main()
