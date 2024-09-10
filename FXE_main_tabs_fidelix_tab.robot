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


#Resource            ${CURDIR}\\resources\\common.resource
#Test Teardown        RPA.Desktop.Close Application    ${FXEditor_app}

*** Variables ***
#${FXEditor_app}     c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe
${TEST_PROJECTS_PATH}    c:\\QA\\TestProjects\\
${TEST_PROJECT_NAME}    Test-Project_1

${test_project_dir}    c:\\QA\\TestProjects\\Test-Project_1
${backup_dir}    c:\\QA\\Backup\\Test-Project_1

*** Test Cases ***
Fidelix Tab

    Check Projects Common Folder Exists
    Copy Test Project Folder From Backup    ${test_project_dir}    ${backup_dir}
    Open Existing Project    ${TEST_PROJECTS_PATH}    ${TEST_PROJECT_NAME}

    Fidelix Tab Select
    
    Fidelix Tab Right Panel Connect Button Argument-1    1
    # [Argument] 1= connect, other=disconnect
    Fidelix Tab Left Panel Backup PLC Argument-1    5
    Fidelix Tab Left Panel Watchdog
    Fidelix Tab Left Panel Add Files Argument-1    C:\\QA\\TestProjects\\Test-Project_1\\Log.txt
    
    # Fidelix Tab Left Panel FX Folder Upload Argument-1    www
    # Fidelix Tab Right Panel FX Folder Copy Argument-1    www
    # Fidelix Tab Left Panel FX Folder Copy Argument-1    www
    Fidelix Tab Right Panel Connect Button Argument-1    0


    Close Opened Project With Saving
    Splash Screen Check
    Current Window System Force Close X Button
    Splash Screen Check

