*** Settings ***
Documentation       FXE start menu item walkthrough

Library             BuiltIn
Library             Process
Resource            resources/common.resource
Resource            resources/start_menu.resource

#Test Teardown        RPA.Desktop.Close Application    ${FXEditor_app}

*** Variables ***
#${FXEditor_app}     c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe


*** Test Cases ***

Start Stop
    [Documentation]
    ...    FX-Editor shall be started inmaximized mode.
    ...    After new installation/update and before runniung test cases, open FX-Editor manually and maximize window. 
    ...    Then close the FX-Editor.

    Check Projects Common Folder Exists
    ${process_id} =    Start Process    c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe

    Splash Screen Check
    Sleep    5s

    Terminate Process    ${process_id}
    
    Splash Screen Check
    Log To Console    FXE_start_stop.robot is completed

*** Keywords ***