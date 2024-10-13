import os

module_types = ["UI", "Service", "Other"]

def get_module_name():
    return input("Enter the name of the new module: ")

def determine_module_type(module_name):
    if module_name.endswith("UI"):
        return "UI"
    elif module_name.endswith("Service"):
        return "Service"
    else:
        return "Other"

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

def create_project_swift(module_path, module_name, module_type):
    template_path = os.path.join("Templates", "Project.swift")
    project_swift_path = os.path.join(module_path, "Project.swift")
    
    try:
        with open(template_path, 'r') as template_file:
            content = template_file.read()
        
        # Replace the placeholders with the actual module name and type
        content = content.replace("{{ModuleName}}", module_name)
        content = content.replace("{{ModuleType}}", module_type)
        
        with open(project_swift_path, 'w') as project_file:
            project_file.write(content)
        
        print(f"Created Project.swift at: {project_swift_path}")
    except FileNotFoundError:
        print(f"Template file not found: {template_path}")
    except Exception as e:
        print(f"An error occurred while creating Project.swift: {e}")

def create_tests_swift(module_path, module_name):
    template_path = os.path.join("Templates", "Tests.swift")
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
    template_path = os.path.join("Templates", "View.swift")
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
    template_path = os.path.join("Templates", "Service.swift")
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

def main():
    module_name = get_module_name()
    module_type = determine_module_type(module_name)
    module_path = create_module_path(module_name)
    create_module_folder(module_path)
    create_project_swift(module_path, module_name, module_type)
    create_tests_swift(module_path, module_name)
    if module_type == "UI":
        create_view_swift(module_path, module_name)
    elif module_type == "Service":
        create_service_swift(module_path, module_name)

if __name__ == "__main__":
    main()
