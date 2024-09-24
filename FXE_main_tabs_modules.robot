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
${TEST_PROJECT_NAME}    Test-Project_C

${test_project_dir}    c:\\QA\\TestProjects\\Test-Project_C
${backup_dir}    c:\\QA\\Backup\\Test-Project_C


*** Test Cases ***
Preparations
    Check Projects Common Folder Exists
    Copy Test Project Folder From Backup    ${test_project_dir}    ${backup_dir}
    Open Existing Project    ${TEST_PROJECTS_PATH}    ${TEST_PROJECT_NAME}


Project Tab
     Project Tab Project Information Subtab
    # Project Tab Communication Settings Subtab
    #  Project Tab Communication Settings Subtab Arguments-6
    #  ...    ip_address=10.100.1.200    
    #  ...    plc_type=9    
    #  ...    ftp_passw=demodemo    
    #  ...    connect=1    
    #  ...    username=system    
    #  ...    password=24680
#     #    plc_type 10 = 3000X, 9=3000C   
#     #    [Arguments]    ${ip_address}    ${plc_type}    ${ftp_passw}    ${connect}    ${username}    ${password}
     Project Tab Hardware Configuration Subtab
     Project Tab Hardware Configuration Subtab New Module Arguments-3
     ...    port=4    
     ...    address=20    
     ...    module_type=2
     Project Tab Hardware Configuration Subtab Add Modbus Address
     Project Tab Hardware Configuration Subtab Add Modbus Device    
     Project Tab Point Settings Subtab
     Project Tab Settings Subtab

Modules Tab

    Modules Tab Select
    Modules Tab Points Binding Argument-1    1
    Modules Tab Points Disconnect Argument-1    5
    # Modules Tab Points Binding Argument-1    1
    # Modules Tab Points Disconnect Argument-1    1




History Tab
    History Tab Select
    History Tab Resize
    History Tab New History Group Create Agrument-1    111
    History Tab New History Group Create RMB Drag-n-Drop Argument-1    222
    History Tab Delete All Groups

    History Tab Open Report Form
    History Tab Report Form Group Create Agrument-1    333
    History Tab Report Form Delete Selected Group
    
    History Tab Report Form Group Create Agrument-1    444
    History Tab Report Form Report Wizard
    History Tab Report Form Report Delete

    History Tab Report Form Column Create Arguments-6    0    17    2    HEADER    0    2&3
    #    [Arguments]    ${column_type}    ${units}    ${decimals}    ${header}    ${graph}    ${compare_columns}
    History Tab Report Form Normalize Change
    History Tab Report Form Close Without Saving

Test Finish Without Saving
    
    Close Opened Project With Saving
    Splash Screen Check
    Current Window System Force Close X Button
    Splash Screen Check

