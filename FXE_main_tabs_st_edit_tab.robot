*** Settings ***
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

*** Variables ***
#${FXEditor_app}     c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe
${TEST_PROJECTS_PATH}    c:\\QA\\TestProjects\\
${TEST_PROJECT_NAME}    Test-Project_C

${test_project_dir}    c:\\QA\\TestProjects\\Test-Project_C
${backup_dir}    c:\\QA\\Backup\\Test-Project_C



*** Test Cases ***
ST-Edit Tab
    
    Check Projects Common Folder Exists

    Copy Test Project Folder From Backup    ${test_project_dir}    ${backup_dir}

    # New Project Wizard    Test-Project_1    FX3000C
    Open Existing Project    ${TEST_PROJECTS_PATH}    ${TEST_PROJECT_NAME}

    ST-Edit Tab Select
    # ST-Edit Tab Separate Window Operations
    
    ST-Edit Tab Import POE File    1
    
    ST-Edit Tab New ST Function Random Name
    Close Opened ST File
    ST-Edit Tab ST Functioin Delete

    ST-Edit Tab New ST Function Block Random Name
    Close Opened ST File
    ST-Edit Tab ST Functioin Block Delete

    ST-Edit Tab New ST Program Random Name
    Close Opened ST File
    ST-Edit Tab ST Program Delete
    ST-Edit Tab New ST Program Random Name
    ST-Edit Tab ST Program Modification
    ST-Edit Tab Clean Unused Variables
    ST-Edit Tab Syntax Check
    # ST-Edit Tab Search Arguments-1    Variable
    Close Opened ST File
    ST-Edit Tab ST Program Delete
    Sleep    2s

Test Finish Without Saving
    
    Close Opened Project Without Saving
    Splash Screen Check
    Current Window System Force Close X Button
    Splash Screen Check

    Log To Console    FXE_main_tabs_st_edit_tab.robot is completed
