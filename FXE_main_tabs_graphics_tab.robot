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
Resource            resources/graphics_tab.resource
Resource            resources/graphics_tab_objects.resource


# Test Setup        Open Existing Project    ${TEST_PROJECTS_PATH}    ${TEST_PROJECT_NAME}

#Resource            ${CURDIR}\\resources\\common.resource
# Test Teardown        RPA.Desktop.Close Application    ${FXEditor_app}
# Suite Teardown        Terminate All Processes    kill=True

*** Variables ***
#${FXEditor_app}     c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe
${TEST_PROJECTS_PATH}    c:\\QA\\TestProjects\\
${TEST_PROJECT_NAME}    Test-Project_C

${test_project_dir}    c:\\QA\\TestProjects\\Test-Project_C
${backup_dir}    c:\\QA\\Backup\\Test-Project_C

*** Test Cases ***
 
# Open Existing Project
#     Open Existing Project    ${TEST_PROJECTS_PATH}    ${TEST_PROJECT_NAME}

Preparations
    Check Projects Common Folder Exists
    Copy Test Project Folder From Backup    ${test_project_dir}    ${backup_dir}
    Open Existing Project    ${TEST_PROJECTS_PATH}    ${TEST_PROJECT_NAME}


Graphics Tab Features
    # ${app_instance} =    Start Process    c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe
    # Open Existing Project    ${TEST_PROJECTS_PATH}    ${TEST_PROJECT_NAME}

    Graphics Tab Select

    # Graphics Tab Detach Attach

    Graphics Tab Editor Upper Buttons Hovering

    Delete File If Exists    ${TEST_PROJECTS_PATH}${TEST_PROJECT_NAME}\\Fidelix\\www\\new.htm
    Delete File If Exists    ${TEST_PROJECTS_PATH}${TEST_PROJECT_NAME}\\Fidelix\\www\\new_1.htm

    Graphics Tab New HTML    new 
    Graphics Tab Close HTML    save=1

    Graphics Tab HTML Editor Left Buttons Hovering

    Graphics Tab Right Panel Subtabs

    Graphics Tab Right Panel Files Subtab Buttons
    Graphics Tab Right Panel Files Subtab Upper Buttons Hovering
    Graphics Tab Right Panel Files Subtab Buttons Expand - Collapse
    Graphics Tab Right Panel Files Subtab Buttons Select All
    Graphics Tab Right Panel Files Subtab Refresh F5
    Graphics Tab Right Panel Files Subtab Buttons Select All Included
    Graphics Tab Right Panel Files Subtab Buttons Open Selected
    Graphics Tab Right Panel Files Subtab Buttons Upload Files


    Graphics Tab Right Panel Settings Subtab    
    ...    screen_type=1280
    ...    background_color=c    
    ...    symbol_folder=local    
    ...    grid=2    
    ...    snap=2

    Graphics Tab New HTML    new_1

    # Delete File If Exists    ${TEST_PROJECTS_PATH}${TEST_PROJECT_NAME}\\Fidelix\\www\\new_2.htm
    # Graphics Tab New HTML    new_2 

    # Delete File If Exists    ${TEST_PROJECTS_PATH}${TEST_PROJECT_NAME}\\Fidelix\\www\\new_3.htm
    # Graphics Tab New HTML    new_3

    # Delete File If Exists    ${TEST_PROJECTS_PATH}${TEST_PROJECT_NAME}\\Fidelix\\www\\new_4.htm
    # Graphics Tab New HTML    new_4 

    # Delete File If Exists    ${TEST_PROJECTS_PATH}${TEST_PROJECT_NAME}\\Fidelix\\www\\new_5.htm
    # Graphics Tab New HTML    new_5


    Graphics Tab Text Create    
    ...    pointname=POINT_01_DI
    ...    text=123-value-Text
    ...    left=100
    ...    top=100

    Graphics Tab Text Create    
    ...    pointname=POINT_02_DI
    ...    text=456-value-Text
    ...    left=100    
    ...    top=200

    Graphics Tab Valuebox Create    
    ...    pointname=POINT_01_AI
    ...    left=100
    ...    top=300

    Graphics Tab Valuebox Create    
    ...    pointname=POINT_02_AI
    ...    left=100
    ...    top=350
    
    Graphics Tab Button Create    
    ...    pointname=POINT_01_DI
    ...    text=Text_BUTTON
    ...    left=300
    ...    top=100

    Graphics Tab Bar Create    
    ...    pointname=POINT_01_DI
    ...    left=400
    ...    top=100

    Graphics Tab Right Panel Settings Symbols Folder    2023

    Graphics Tab Symbol Create    
    ...    pointname=POINT_01_ALM
    ...    left=500
    ...    top=400

    # Graphics Tab Close All HTMLs
    Graphics Tab Close HTML    save=1

    # Graphics Tab Close HTML    save=0
    # Sleep    1s
    # Graphics Tab Close HTML
    # Graphics Tab Close HTML
    # Graphics Tab Close HTML
    # Graphics Tab Close HTML


    # Check And Close Connection Fail Form

    Log To Console    FXE_main_tabs_graphics_tab.robot is completed
    Close Opened Project Without Saving
    
    Access Violation Form Check

    Current Window System Force Close X Button


*** Keywords ***
