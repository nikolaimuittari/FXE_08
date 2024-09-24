*** Settings ***
Documentation       FXE main view tabs walkthrough

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
Resource            resources/upper_menu.resource

#Resource            ${CURDIR}\\resources\\common.resource
#Test Teardown        RPA.Desktop.Close Application    ${FXEditor_app}

*** Variables ***
#${FXEditor_app}     c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe
${TEST_PROJECTS_PATH}    c:\\QA\\TestProjects
${TEST_PROJECT_NAME}    Test-Project_C
${TEST_PROJECT_NAME_2}    Test-Project_X
${TEST_GROUP_NAME}    Test-Group_1
${test_project_dir}    c:\\QA\\TestProjects\\Test-Project_C
${backup_dir}    c:\\QA\\Backup\\Test-Project_C

*** Test Cases ***

Upper Menu Walkthrough
    # Copy Project From    ${TEST_PROJECT_NAME}    c:\\QA\\Backup\\    ${TEST_PROJECTS_PATH}
    # Check And Delete Folder    ${TEST_PROJECTS_PATH}${TEST_PROJECT_NAME}
    # OperatingSystem.Remove Directory    ${TEST_PROJECTS_PATH}\\${TEST_PROJECT_NAME_2}\\    recursive=${True}
    # OperatingSystem.Should Not Exist    ${TEST_PROJECTS_PATH}\\${TEST_PROJECT_NAME_2}\\
    #    Log To Console    ${TEST_PROJECTS_PATH}\\${TEST_PROJECT_NAME_2}\\
    # Delete Group    ${TEST_PROJECTS_PATH}    ${TEST_GROUP_NAME}
    Recreate Test Projects folder    ${TEST_PROJECTS_PATH}
    Copy Test Project Folder From Backup    
    ...    c:\\QA\\TestProjects\\Test-Project_C    
    ...    c:\\QA\\Backup\\Test-Project_C

    Copy Test Project Folder From Backup    
    ...    c:\\QA\\TestProjects\\Test-Project_1    
    ...    c:\\QA\\Backup\\Test-Project_1

    Copy Test Project Folder From Backup    
    ...    c:\\QA\\TestProjects\\Test-Project_X    
    ...    c:\\QA\\Backup\\Test-Project_X
    
    Open Existing Project    ${TEST_PROJECTS_PATH}    ${TEST_PROJECT_NAME}

    Upper Menu File Submenu Open Template
    # Upper Menu File Submenu Save
    Upper Menu File Submenu Save As    Test-Project_Saved_As
    Upper Menu File Submenu Save Selected Points    Test-Project_Saved_As
    Upper Menu File Submenu Load Points    Test-Project_Saved_As


    # Upper Menu File Submenu Walkthrough
    # Upper Menu Edit Submenu Walkthrough
    # Upper Menu Fidelix Submenu Walkthrough
    # Upper Menu Points Submenu Walkthrough
    # Upper Menu Tools Submenu Walkthrough

    # Upper Menu File New Project    2    ${TEST_PROJECT_NAME_2}
    # Upper Menu File New Group    2    ${TEST_PROJECTS_PATH}    ${TEST_GROUP_NAME}    

    Close Opened Project Without Saving
    Splash Screen Check
    Current Window System Force Close X Button
    Splash Screen Check
    Log To Console    FXE_main_upper_menu.robot is completed
