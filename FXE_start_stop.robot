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
    # Check And Delete Project Folder Argument-1    c:\\QA\\TestProjects\\Test-Project_1
    # Check And Delete Project Folder Argument-1    c:\\QA\\TestProjects\\Test-Project_2
    # Check And Delete Test Group
    # Clear Test Projects Folder Arguments-2    c:\\QA\\TestProjects\\    Test-Group
    # Recreate Test Projects folder    c:\\QA\\TestProjects\\
    
    # ${app_instance}=    Open FXE
    
    
    # ${process_id} =    Start Process    cmd    /c    start    /max    "c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe"
    
    #2024.08.12
    ${process_id} =    Start Process    c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe
    # ${process_id} =    Run Process    
    # ...    powershell    -Command    
    # ...    Start-Process 'c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe' -WindowStyle Maximized
    
    Splash Screen Check
   
    Sleep    5s
   
    # ${pid} =    Get Process Id    FxEditor.exe
    # Terminate Process    ${pid}

    Terminate Process    ${process_id}
    
    Splash Screen Check
    Log To Console    FXE_start_stop.robot is completed

    # Display Dialog and Wait for User Action

*** Keywords ***
# Kill Custom App
#     [Arguments]    ${app_name}
#     ${result} =    Run Process    taskkill //F //IM ${app_name}
#     Should Contain    ${result.stdout}    SUCCESS
