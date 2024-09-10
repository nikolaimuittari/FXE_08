*** Settings ***
Documentation       FXE start menu item walkthrough

Library             RPA.Desktop
Library             RPA.Windows
Library             OperatingSystem
#Resource            ${CURDIR}\\resources\\common.resource
Resource            resources/common.resource
Resource            resources/start_menu.resource

#Test Teardown        RPA.Desktop.Close Application    ${FXEditor_app}

*** Variables ***
#${FXEditor_app}     c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe


*** Test Cases ***
Start Menu Items Walkthrough
    Check Projects Common Folder Exists
    # Check And Delete Project Folder Argument-1    c:\\QA\\TestProjects\\Test-Project_1
    # Check And Delete Project Folder Argument-1    c:\\QA\\TestProjects\\Test-Project_2
    # Check And Delete Test Group
    # Clear Test Projects Folder Arguments-2    c:\\QA\\TestProjects\\    Test-Group
    # Recreate Test Projects folder    c:\\QA\\TestProjects\\
    
    ${app_instance}=    Open FXE                                                                                
    Splash Screen Check
   
    # New Project Wizard Arguments-1    Test-Project_1
    # Close Opened Project Without Saving
    # New Project Wizard Arguments-1    Test-Project_2
    # Close Opened Project Without Saving
    # Start Page New Group Project Wizard Open Close
    
    Start Page Settings Form
    Start Page Settings Project Tab Walkthrough
    Start Page Explore FX-Editor Data Button
    # Start Page Tools Button
    Start Page Explore FX-Editor Data Button
    Start Page License Button
    Start Page Fideilx Manual Button
    Move Mouse    alias:FXE_start_logo_img
    Start Page FX-Editor Manual Button
    Move Mouse    alias:FXE_start_logo_img
    Start Page OpenPCS Manual Button
     Move Mouse    alias:FXE_start_logo_img
    Start Page Version Up To Date Button
    Start Page Update History Button
    Start Page Import New PLC Firmware Button Arguments-2    2    V123010
    Start Page Import New PLC Firmware Button Arguments-2    1    fidelix-fx3000x-20.0.43-prod.raucb
    Start Logo Screen
    Splash Screen Check
    Log To Console    Start Menu Items Walkthrough Done
    Current Window System Force Close X Button    
    Splash Screen Check

    Log To Console    FXE_start_menu_items.robot is completed

    # Display Dialog and Wait for User Action

