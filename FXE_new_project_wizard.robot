*** Settings ***
Documentation       FXE new project with wizard
Library             RPA.Desktop
Library             RPA.Windows
Library             OperatingSystem
Resource            resources/common.resource
Resource            resources/start_menu.resource

*** Variables ***
#${FXEditor_app}     c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe


*** Test Cases ***
New Project Uisng Wizard    
    Check Projects Common Folder Exists
    Recreate Test Projects folder    c:\\QA\\TestProjects\\
    Open FXE
    # ${app_instance} =   Run Process    
    # ...    powershell    -Command    
    # ...    Start-Process 'c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe' -WindowStyle Maximized

    New Project Wizard    Test-Project_1    FX3000C
    Close Opened Project With Saving
    New Project Wizard    Test-Project_2    FX3000X
    Close Opened Project With Saving
    
    Start Page New Group Project Wizard Open Close
    
    Start Page Add Delete Favorites

    Current Window System Force Close X Button
    Splash Screen Check
    Sleep    3s

    # Current Window System Force Close X Button
    # Splash Screen Check

    Log To Console    FXE_new_project_wizard.robot is completed
