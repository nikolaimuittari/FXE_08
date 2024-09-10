*** Settings ***
Documentation       FXE start menu item walkthrough

Library             RPA.Desktop
Library             RPA.Windows
Library             OperatingSystem
Resource            ${CURDIR}\\resources\\common.resource
#Test Teardown        RPA.Desktop.Close Application    ${FXEditor_app}

*** Variables ***
#${FXEditor_app}     c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe
# ${FXE_TEST_PROJECT_PATH}    c:\\QA\\TestProjects\\


*** Test Cases ***
Start Menu Items Walkthrough
    Check Projects Common Folder Exists
    #Check And Delete Test Project
    #Open FXE
    Open Existing Project     FXE_TEST_PROJECT_PATH    TEST_PROJECT_NAME
    Close Opened Project Without Saving
    Splash Screen Check
    Current Window System Force Close X Button

    Log To Console    FXE_main_view_menu_items.robot is completed


*** Keywords ***
# Open Existing Project
#     Log To Console    ${FXE_TEST_PROJECT_PATH}\\${TEST_PROJECT_NAME}.fxp
#     RPA.Desktop.Open File    ${FXE_TEST_PROJECT_PATH}\\${TEST_PROJECT_NAME}.fxp
