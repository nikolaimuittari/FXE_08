*** Settings ***
Library    Process
# Resource            resources/common.resource


*** Test Cases ***
Run Child Robot Files
    Run Process    robot    FXE_start_menu_items.robot
    # Log To Console    Start menu items robot passed

    Run Process    robot    FXE_new_project_wizard.robot
    # Log To Console    New project wizard robot passed
    
    Run Process    robot    FXE_main_upper_menu.robot
    # Log To Console    Upper Menu robot passed

    Run Process    robot    FXE_main_tabs_project_tab.robot
    # Log To Console    Project Tab robot passed

    Run Process    robot    FXE_main_points.robot
    # Log To Console    Points Tab robot passed

    Run Process    robot    FXE_main_modules.robot
    # Log To Console    Modules and History Tab robot passed

    Run Process    robot    FXE_main_tabs_others.robot
    # Log To Console    Other Tabs robot passed

    # Run Process    robot    FXE_main_template.robot
    # Log To Console   Template robot passed
    
    # Display Dialog and Wait for User Action