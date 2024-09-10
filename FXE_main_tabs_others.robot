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

*** Test Cases ***
Preparations
    Check Projects Common Folder Exists
    Open Existing Project    ${TEST_PROJECTS_PATH}    ${TEST_PROJECT_NAME}

Browser Tab

    # Project Tab Communication Settings Subtab Arguments-6    10.100.1.198    11    demodemo    1    system    24680
    # #     [Arguments]    ${ip_address}    ${plc_type}    ${ftp_passw}    ${connect}    ${username}    ${password}
    # Browser Tab Select
    # Browser Tab Home Button Argument-1    11


    # Project Tab Communication Settings Subtab Arguments-6    10.100.1.200    9    demodemo    1    system    24680
    # #    plc_type 10 = 3000X, 9 = 3000C   
    # #    [Arguments]    ${ip_address}    ${plc_type}    ${ftp_passw}    ${connect}    ${username}    ${password}
    
    Browser Tab Select
    Browser Tab Home Button Argument-1    9


Label List Tab
   Label List Tab Select
   Label List Save List To File Arguments-5    -    BB    ROW_1    ROW_2    ROW_3
#     [Arguments]    ${point_separator}    ${label_separator}    ${labelrow_1}    ${labelrow_2}    ${labelrow_3}    ${labelrow_1}

Documents Tab
    Documents Tab Select
    Documents Tab New Folder Create And Delete

Fxonline Tab
    Fxonline Tab Select
    Fxonline Tab Resize
    Project Tab Communication Settings Subtab Arguments-6    10.100.1.200    9    demodemo    1    system    24680    
    # [Arguments]    ${ip_address}    ${plc_type}    ${ftp_passw}    ${connect}    ${username}    ${password}
    Fxonline Tab Select
    Fxonline Tab Resize
    Fxonline Tab Connect-Disconnect


Test Finish Without Saving
    
    Close Opened Project Without Saving
    Splash Screen Check
    Current Window System Force Close X Button
    Splash Screen Check

    Log To Console    FXE_main_tabs_others.robot is completed

