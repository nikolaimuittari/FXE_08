*** Settings ***
Documentation       FXE main view tabs walkthrough
                    # Project Tab tests

Library             RPA.Desktop
Library             RPA.Windows
Library             OperatingSystem

Resource            resources/fidelix_tab.resource
Resource            resources/common.resource
Resource            resources/project_tab.resource
Resource            resources/points_tab_point_edit.resource
Resource            resources/points_tab.resource
Resource            resources/browser_tab.resource
Resource            resources/label_list_tab.resource
Resource            resources/modules_tab.resource
Resource            resources/documents_tab.resource
Resource            resources/history_tab.resource
Resource            resources/fxonline_tab.resource
Resource            resources/st_edit_tab.resource


Test Setup            Open Existing Project    ${TEST_PROJECTS_PATH}    ${TEST_PROJECT_NAME}

#Resource            ${CURDIR}\\resources\\common.resource
#Test Teardown        RPA.Desktop.Close Application    ${FXEditor_app}

*** Variables ***
#${FXEditor_app}     c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe
${TEST_PROJECTS_PATH}    c:\\QA\\TestProjects\\
${TEST_PROJECT_NAME}    Test-Project_C

*** Test Cases ***
 
#  Open Existing Project
#      Open Existing Project

Preparations
    Check Projects Common Folder Exists
    Open Existing Project    ${TEST_PROJECTS_PATH}    ${TEST_PROJECT_NAME}

Project Tab

    # Check Projects Common Folder Exists
    # Recreate Test Projects folder    c:\\QA\\TestProjects\\
    # Open FXE
    # New Project Wizard    Test-Project_1    FX3000C

    Project Tab Project Information Subtab
    Project Tab Communication Settings Subtab
    # Project Tab Communication Settings Subtab Arguments-6    10.100.1.200    9    demodemo    1    system    24680
    # #    plc_type 10 = 3000X, 9=3000C   
    # #    [Arguments]    ${ip_address}    ${plc_type}    ${ftp_passw}    ${connect}    ${username}    ${password}
    # Project Tab Hardware Configuration Subtab
    # Project Tab Hardware Configuration Subtab New Module
    
    # Project Tab Hardware Configuration Subtab Add Modbus Address

    # Project Tab Hardware Configuration Subtab Add Modbus Device
    
    # Project Tab Point Settings Subtab
    # Project Tab Settings Subtab
    Close Opened Project With Saving
    Current Window System Force Close X Button
    Splash Screen Check
    Current Window System Force Close X Button
    Log To Console    FXE_main_tabs_project_tab.robot is completed
