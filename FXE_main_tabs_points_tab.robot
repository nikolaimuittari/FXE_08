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
${TEST_PROJECT_NAME}    Test-Project_C_EMPTY

${test_project_dir}    c:\\QA\\TestProjects\\Test-Project_C_EMPTY
${backup_dir}    c:\\QA\\Backup\\Test-Project_C_EMPTY


*** Test Cases ***
Points Tab

    Check Projects Common Folder Exists
    # Recreate Test Projects folder    c:\\QA\\TestProjects\\
    # Open FXE
    # New Project Wizard    Test-Project_1    FX3000C

    Copy Test Project Folder From Backup    ${test_project_dir}    ${backup_dir}

    # New Project Wizard    Test-Project_1    FX3000C
    Open Existing Project    ${TEST_PROJECTS_PATH}    ${TEST_PROJECT_NAME}


    Points Tab Select
    Left Panel Resize
    Points Tab Select Filter Create All Kinds Of Points
    State Text Edit Form    save
    Alarm Group Edit Form
    
    # Button Press Upload Alarmgroup To PLC
    # Button Press Upload State Text To PLC
    # Button Press Upload Changed Points To PLC
    # Button Press Upload Displayed Points To PLC
    # Button Press Upload Selected Points To PLC
    Button Press Points Panel Resize
 
    Left Panel Auto Resize Button
    Right Panel Auto Resize Button
    
    Points Tab Left Panel ALARM Right Button Edit Argument-1    TE01_H
    Points Filter Name Filter Clear And De-Select
    
    Points Tab Left Panel AI Right Button Edit Arguments-2   TE01_M    1
    Points Filter Name Filter Clear And De-Select
         
    Points Tab Left Panel DI Right Button Edit Argument-1    TE01_I
    Points Filter Name Filter Clear And De-Select

    Points Tab Left Panel DO Right Button Edit Argument-1    TE01_O
    Points Filter Name Filter Clear And De-Select
    
    Points Tab Left Panel AO Right Button Edit Arguments-2   TE01_A    1
    Points Filter Name Filter Clear And De-Select

    Points Tab Left Panel CONTROL Right Button Edit Argument-1    TE01_C
    Points Filter Name Filter Clear And De-Select
    
    Points Tab Left Panel TIMETABLE Right Button Edit Argument-1    TE01_T
    Points Filter Name Filter Clear And De-Select

    Points Tab Left Panel LOOKUP Right Button Edit Argument-1    TE01_L
    Points Filter Name Filter Clear And De-Select

    # Points Right Panel Import Filter Edit Form
    # Points Right Panel Button Bar Add Filter Button
    # Points Right Panel Button Bar Copy Selected Filter
    # Points Filter Name Filter Field
    # Points Filter Point Type Filter

    # Points Right Panel Import Filter Edit Form NO Save
    Close Opened Project With Saving
    Splash Screen Check
    Current Window System Force Close X Button
    Splash Screen Check

