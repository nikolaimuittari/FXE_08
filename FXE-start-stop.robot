*** Settings ***
Documentation       FXE start menu item walkthrough

# Library             RPA.Desktop
# Library             RPA.Windows
# Library             OperatingSystem
Library             BuiltIn
Library             Process
#Resource            ${CURDIR}\\resources\\common.resource
Resource            resources/common.resource
Resource            resources/start_menu.resource

#Test Teardown        RPA.Desktop.Close Application    ${FXEditor_app}

*** Variables ***
#${FXEditor_app}     c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe


*** Test Cases ***
Start Stop
    Check Projects Common Folder Exists

    Start Screen Recording

    Sleep    10s

    Stop Screen Recording

    Log To Console    FXE_start_stop.robot is completed

    # Display Dialog and Wait for User Action

