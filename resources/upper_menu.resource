*** Settings ***
Documentation       Common resource file
# Display parameters:
# Physical resolution: 1920 * 1080
# Windows scaling: 100%

Library             RPA.Desktop
Library             RPA.Windows
# Library             RPA.Assistant
# Library             RPA.Dialogs
Library             OperatingSystem
Library             RPA.FileSystem

Resource    common.resource
Resource    points_tab.resource

*** Variables ***



*** Keywords ***
Upper Menu File Submenu Walkthrough
    # Wait For Element    alias:FXE_main_upper_menu    timeout=30
    # RPA.Desktop.Click With Offset    alias:FXE_main_upper_menu    x=-85    y=0    action=click    # File submenu

    # Wait For Element    alias:FXE_main_upper_file_menu_list    timeout=10

    # Upper Menu File Submenu New Project

    # Wait For Element    alias:FXE_main_upper_menu    timeout=30
    # RPA.Desktop.Click With Offset    alias:FXE_main_upper_menu    x=-85    y=0    action=click    # File submenu

    Upper Menu File Submenu New Group Project    Test-Group
    # ${PROJECTS_PATH} =    Set Variable    "c:\\QA\\TestProjects\\Test-Project_1\\Test-Project_1.fxp"
    # Upper Menu File Submenu Open Project    ${PROJECTS_PATH}

    # Move Mouse    alias:FXE_main_upper_file_menu_list
    # Move Mouse    offset:0,-290    # New project

    # Move Mouse    alias:FXE_main_upper_file_menu_list
    # Move Mouse    offset:0,-250    # New group project

    # Move Mouse    alias:FXE_main_upper_file_menu_list
    # Move Mouse    offset:0,-210    # Open group / project

    # Move Mouse    alias:FXE_main_upper_file_menu_list
    # Move Mouse    offset:0,-170    # Load template

    # Move Mouse    alias:FXE_main_upper_file_menu_list
    # Move Mouse    offset:0,-120    # Save

    # Move Mouse    alias:FXE_main_upper_file_menu_list
    # Move Mouse    offset:0,-90    # Save As

    # Move Mouse    alias:FXE_main_upper_file_menu_list
    # Move Mouse    offset:0,-50    # Save selected points

    # Move Mouse    alias:FXE_main_upper_file_menu_list
    # Move Mouse    offset:0,0    # Load points from file

    # Move Mouse    alias:FXE_main_upper_file_menu_list
    # Move Mouse    offset:0,30    # Make template

    # Move Mouse    alias:FXE_main_upper_file_menu_list
    # Move Mouse    offset:0,70    # Import

    # Move Mouse    alias:FXE_main_upper_file_menu_list
    # Move Mouse    offset:100,70    # Import point text file

    # Move Mouse    alias:FXE_main_upper_file_menu_list
    # Move Mouse    offset:0,120    # Close project

    # Move Mouse    alias:FXE_main_upper_file_menu_list
    # Move Mouse    offset:0,160    # Settings

    # Move Mouse    alias:FXE_main_upper_file_menu_list
    # Move Mouse    offset:0,200    # Explore programdata

    # Move Mouse    alias:FXE_main_upper_file_menu_list
    # Move Mouse    offset:0,250    # Print

    # Move Mouse    alias:FXE_main_upper_file_menu_list
    # Move Mouse    offset:0,280    # Exit

    # Wait For Element    alias:FXE_main_upper_menu    timeout=30
    # RPA.Desktop.Click With Offset    alias:FXE_main_upper_menu    x=-85    y=0    action=click    # File submenu
    


Upper Menu File Submenu New Project
    Wait For Element    alias:FXE_main_upper_file_menu_list    timeout=10
    
    RPA.Desktop.Click With Offset    alias:FXE_main_upper_file_menu_list    x=0    y=-290    action=click    # New project
    Wait For Element    alias:FXE_main_upper_new_project_form    timeout=10

    # New project form
    # 0    -20    New window
    # 0    +20    Existing
    # 0    +100    Cancel

    RPA.Desktop.Click With Offset    alias:FXE_main_upper_new_project_form    x=0    y=-20    action=click    # New window
    Splash Screen Check
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    # Project wizard
    Wait For Element    alias:FXE_new_wizard_close_wizard_btn    timeout=30

    RPA.Desktop.Click    alias:FXE_new_wizard_close_wizard_btn    action=click
    Current Window System Force Close X Button
    Splash Screen Check

    Wait For Element    alias:FXE_main_upper_menu    timeout=30
    RPA.Desktop.Click With Offset    alias:FXE_main_upper_menu    x=-85    y=0    action=click    # File submenu

    Wait For Element    alias:FXE_main_upper_file_menu_list    timeout=10
    RPA.Desktop.Click With Offset    alias:FXE_main_upper_file_menu_list    x=0    y=-290    action=click    # New project
    Wait For Element    alias:FXE_main_upper_new_project_form    timeout=10

    RPA.Desktop.Click With Offset    alias:FXE_main_upper_new_project_form    x=0    y=20    action=click    # Existing window
    Splash Screen Check
    # Project wizard
    Wait For Element    alias:FXE_new_wizard_close_wizard_btn    timeout=30

    RPA.Desktop.Click    alias:FXE_new_wizard_close_wizard_btn    action=click
    RPA.Desktop.Wait For Element    alias:FXE_start_right_down_logo    timeout=40

    Current Window System Force Close X Button
    Open Existing Project    ${TEST_PROJECTS_PATH}    ${TEST_PROJECT_NAME}

    Wait For Element    alias:FXE_main_upper_menu    timeout=30
    RPA.Desktop.Click With Offset    alias:FXE_main_upper_menu    x=-85    y=0    action=click    # File submenu

    Wait For Element    alias:FXE_main_upper_file_menu_list    timeout=10
    RPA.Desktop.Click With Offset    alias:FXE_main_upper_file_menu_list    x=0    y=-290    action=click    # Cancel
    Wait For Element    alias:FXE_main_upper_new_project_form    timeout=10
    RPA.Desktop.Click With Offset    alias:FXE_main_upper_new_project_form    x=0    y=100    action=click    # Cancel


Upper Menu File Submenu New Group Project
    [Arguments]    ${group_name}
    Wait For Element    alias:FXE_main_upper_menu    timeout=30
    RPA.Desktop.Click With Offset    alias:FXE_main_upper_menu    x=-85    y=0    action=click    # File submenu
    
    Wait For Element    alias:FXE_main_upper_file_menu_list    timeout=10

    # Move Mouse    offset:0,-250    # New group project
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_upper_file_menu_list    
    ...    x=0    
    ...    y=-250    
    ...    action=click    # New group project
    
    Sleep    3s

    Wait For Element    alias:FXE_start_create_a_new_group_name_form    timeout=10
    RPA.Desktop.Click    alias:FXE_start_create_a_new_group_name_form    action=click
    RPA.Desktop.Type Text    ${group_name}

    Wait For Element    alias:FXE_start_create_a_new_group_project_save_btn    timeout=10
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_start_create_a_new_group_project_save_btn    
    ...    x=0    
    ...    y=0    
    ...    action=click    # Save

    Wait For Element    alias:FXE_start_create_group_select_all    timeout=10
    RPA.Desktop.Click    alias:FXE_start_create_group_select_all    action=click

    Wait For Element    alias:FXE_main_ADD_form_btn    timeout=10
    RPA.Desktop.Click    alias:FXE_start_create_group_select_all    action=click

    Wait For Element    alias:FXE_group_upper_menu    timeout=10
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_group_upper_menu    
    ...    x=20    
    ...    y=0    
    ...    action=click    # File menu

    Wait For Element    alias:FXE_group_upper_menu_file_menu    timeout=10
        
    #	x		y		FXE_group_upper_menu_file_menu
    #	0		-70		New project
    #	0		-45		Open project
    #	0		-25		Save group
    #	0		0		Scan for project
    #	0		+20		Explore FX editor
    #	0		45		Close group	
    #	0		75		Exit
    
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_group_upper_menu_file_menu    
    ...    x=0    
    ...    y=75    
    ...    action=click    # Exit

    Wait For Element    alias:FXE_group_close_changed_form    timeout=10
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_group_close_changed_form    
    ...    x=-20    
    ...    y=50    
    ...    action=click    # Yes

    Splash Screen Check
    Log To Console    Group ${group_name} has been created, saved and closed


Upper Menu File Submenu Open Project
    [Arguments]    ${PROJECTS_PATH}

    Wait For Element    alias:FXE_main_upper_menu    timeout=30
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_upper_menu    
    ...    x=-85    
    ...    y=0    
    ...    action=click    # File submenu
    
    Wait For Element    alias:FXE_main_upper_file_menu_list    timeout=10

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_upper_file_menu_list    
    ...    x=0    
    ...    y=-210    
    ...    action=click    # Open group / project

    Wait For Element    alias:FXE_start_create_a_new_group_name_form    timeout=10
    RPA.Desktop.Click    alias:FXE_start_create_a_new_group_name_form    action=click
    
    RPA.Desktop.Type Text    ${PROJECTS_PATH}
    Sleep    2s
    Wait For Element    alias:FXE_main_upper_file_open_project_form_open_btn    timeout=10
    RPA.Desktop.Click    alias:FXE_main_upper_file_open_project_form_open_btn    action=click
    
    # Open in new window
    Wait For Element    alias:FXE_main_upper_file_open_project_new_wndw_form    timeout=10
    # RPA.Desktop.Click With Offset    
    # ...    alias:FXE_main_upper_file_open_project_new_wndw_form    
    # ...    x=-25    
    # ...    y=40    
    # ...    action=click    # Yes button
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Press Keys    enter
    Sleep    2s
    Splash Screen Check
    Sleep    5s
    Wait For Element    alias:FXE_main_upper_menu    timeout=30
    Log To Console    Project is opened



Upper Menu File Submenu Open Template

    Wait For Element    alias:FXE_main_upper_menu    timeout=30
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_upper_menu    
    ...    x=-85    
    ...    y=0    
    ...    action=click    # File submenu
    
    Wait For Element    alias:FXE_main_upper_file_menu_list    timeout=10

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_upper_file_menu_list    
    ...    x=0    
    ...    y=-170    
    ...    action=click    # Open template

    ${filter_form}=    Run Keyword And Return Status    Wait For Element    alias:FXE_main_template_filter_select_form    timeout=10
    IF    $filter_form == ${TRUE}
        RPA.Desktop.Click With Offset    
        ...    alias:FXE_main_template_new_modify_form    
        ...    x=50    
        ...    y=40
        ...    action=click    # OK button
    END

    Wait For Element    alias:FXE_main_template_browser_form_filled    timeout=10

    Log To Console    Template form visible
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_template_browser_form_filled    
    ...    x=370    
    ...    y=-270    
    ...    action=click    # Windows Close Cross 


Upper Menu File Submenu Save

    Wait For Element    alias:FXE_main_upper_menu    timeout=30
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_upper_menu    
    ...    x=-85    
    ...    y=0    
    ...    action=click    # File submenu
    
    Wait For Element    alias:FXE_main_upper_file_menu_list    timeout=10

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_upper_file_menu_list    
    ...    x=0    
    ...    y=-120    
    ...    action=click    # Save


Upper Menu File Submenu Save As
    [Arguments]    ${save_as_name}

    Wait For Element    alias:FXE_main_upper_menu    timeout=30
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_upper_menu    
    ...    x=-85    
    ...    y=0    
    ...    action=click    # File submenu
    
    Wait For Element    alias:FXE_main_upper_file_menu_list    timeout=10
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_upper_file_menu_list    
    ...    x=0    
    ...    y=-90    
    ...    action=click    # Save As.. button

    Wait For Element    alias:FXE_system_filename_prompt    timeout=10
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_system_filename_prompt    
    ...    x=30    
    ...    y=0    
    ...    action=click    # Filename prompt

    RPA.Desktop.Type Text    ${save_as_name}
    Wait For Element    alias:FXE_system_save_cancel_btns    timeout=10
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_system_save_cancel_btns    
    ...    x=-30    
    ...    y=0    
    ...    action=click    # System Save button

    Splash Screen Check
    ${folder_exists}=    Run Keyword And Return Status    
    ...    Directory Should Exist    ${TEST_PROJECTS_PATH}\\${save_as_name}
    
    IF    ${folder_exists}
        Log To Console    Folder exists: ${TEST_PROJECTS_PATH}\\${save_as_name}
    ELSE
        Log To Console    NO folder: ${TEST_PROJECTS_PATH}\\${save_as_name}
    END

Upper Menu File Submenu Save Selected Points
    [Arguments]    ${save_as_name}

    Wait For Element    alias:FXE_main_upper_menu    timeout=30
    Points Tab Select

    # Wait For Element    alias:FXE_main_points_tab_add_btn    timeout=10
    # RPA.Desktop.Click With Offset    
    # ...    alias:FXE_main_points_tab_add_btn    
    # ...    x=0    
    # ...    y=55    
    # ...    action=click    # points table

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_points_tab_add_btn    
    ...    x=0    
    ...    y=55    
    ...    action=rightclick    # points table rightclick

    Wait For Element    alias:FXE_main_points_tab_RIGHT_BTN_menu    timeout=10
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_points_tab_RIGHT_BTN_menu    
    ...    x=0    
    ...    y=0    
    ...    action=click    # Select All points table


    Wait For Element    alias:FXE_main_upper_menu    timeout=30
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_upper_menu    
    ...    x=-85    
    ...    y=0    
    ...    action=click    # File submenu

    Wait For Element    alias:FXE_main_upper_file_menu_list    timeout=10
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_upper_file_menu_list    
    ...    x=0    
    ...    y=-50    
    ...    action=click    # Save selected points

    RPA.Desktop.Type Text    ${TEST_PROJECTS_PATH}\\${save_as_name}\\saved_points.xml

    Wait For Element    alias:FXE_system_save_cancel_btns    timeout=10
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_system_save_cancel_btns    
    ...    x=-30    
    ...    y=0    
    ...    action=click    # System Save button

    Wait For Element    alias:FXE_main_points_tab_XML_save_form    timeout=10
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_points_tab_XML_save_form    
    ...    x=150    
    ...    y=50    
    ...    action=click    # OK button

    ${file_exists}=    Run Keyword And Return Status    
    ...    File Should Exist    ${TEST_PROJECTS_PATH}\\${save_as_name}\\saved_points.xml
    
    IF    ${file_exists}
        Log To Console    File exists: ${TEST_PROJECTS_PATH}\\${save_as_name}\\saved_points.xml
    ELSE
        Log To Console    NO file: ${TEST_PROJECTS_PATH}\\${save_as_name}\\saved_points.xml
    END

Upper Menu File Submenu Load Points
    [Arguments]    ${save_as_name}

    Wait For Element    alias:FXE_main_upper_menu    timeout=30
    Points Tab Select

    Wait For Element    alias:FXE_main_upper_menu    timeout=30
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_upper_menu    
    ...    x=-85    
    ...    y=0    
    ...    action=click    # File submenu

    Wait For Element    alias:FXE_main_upper_file_menu_list    timeout=10
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_upper_file_menu_list    
    ...    x=0    
    ...    y=0    
    ...    action=click    # Load selected points

    # RPA.Desktop.Press Keys    delete

    Wait For Element    alias:FXE_system_filename_prompt    timeout=10
    RPA.Desktop.Click    alias:FXE_system_filename_prompt    action=click
    
    RPA.Desktop.Type Text    ${TEST_PROJECTS_PATH}\\${save_as_name}\\saved_points.xml

    Wait For Element    alias:FXE_system_open_cancel_btns    timeout=10
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_system_open_cancel_btns    
    ...    x=-30    
    ...    y=0    
    ...    action=click    # System Open button

    Wait For Element    alias:FXE_main_upper_search_replace_form    timeout=10
    Wait For Element    alias:FXE_main_CANCEL_form_btn    timeout=10

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_CANCEL_form_btn    
    ...    x=0    
    ...    y=0    
    ...    action=click    # Cancel button























Upper Menu Edit Submenu Walkthrough
    Wait For Element    alias:FXE_main_upper_menu    timeout=30
    RPA.Desktop.Click With Offset    alias:FXE_main_upper_menu    x=-55    y=0    action=click    # Edit submenu

    Wait For Element    alias:FXE_main_upper_edit_menu_list    timeout=10
    Move Mouse    alias:FXE_main_upper_edit_menu_list
    Move Mouse    offset:0,-20    # Search and replace

    # Move Mouse    alias:FXE_main_upper_edit_menu_list
    Move Mouse    offset:0,20    # Search and replace
    Move Mouse    offset:0,20    # Point Search / replace

    Wait For Element    alias:FXE_main_upper_menu    timeout=30
    RPA.Desktop.Click With Offset    alias:FXE_main_upper_menu    x=-55    y=0    action=click    # Edit submenu



Upper Menu Fidelix Submenu Walkthrough
    Wait For Element    alias:FXE_main_upper_menu    timeout=30
    RPA.Desktop.Click With Offset    alias:FXE_main_upper_menu    x=-20    y=0    action=click    # Fidelix submenu

    Wait For Element    alias:FXE_main_upper_fidelix_menu_list    timeout=10
    
    Move Mouse    alias:FXE_main_upper_fidelix_menu_list
    Move Mouse    offset:0,-280    # Stop PLC

    Move Mouse    alias:FXE_main_upper_fidelix_menu_list
    Move Mouse    offset:0,-240    # Start PLC

    Move Mouse    alias:FXE_main_upper_fidelix_menu_list
    Move Mouse    offset:0,-200    # Reboot PLC

    Move Mouse    alias:FXE_main_upper_fidelix_menu_list
    Move Mouse    offset:0,-160    # Restart PLC

    Move Mouse    alias:FXE_main_upper_fidelix_menu_list
    Move Mouse    offset:0,-120    # Cleasr PLC

    Move Mouse    alias:FXE_main_upper_fidelix_menu_list
    Move Mouse    offset:0,-90    # Watchdog

    Move Mouse    alias:FXE_main_upper_fidelix_menu_list
    Move Mouse    offset:0,-50    # Backup

    Move Mouse    alias:FXE_main_upper_fidelix_menu_list
    Move Mouse    offset:0,-10    # PLC status

    Move Mouse    alias:FXE_main_upper_fidelix_menu_list
    Move Mouse    offset:0,30    # Create XML

    Move Mouse    alias:FXE_main_upper_fidelix_menu_list
    Move Mouse    offset:0,30    # Create XML
    Sleep    2s
    
    Wait For Element    alias:FXE_main_upper_fidelix_XML_list    timeout=5
    Move Mouse    alias:FXE_main_upper_fidelix_XML_list
    Move Mouse    offset:0,-80    # Create XML -> Points

    Move Mouse    alias:FXE_main_upper_fidelix_XML_list
    Move Mouse    offset:0,-40    # Create XML -> State Text

    Move Mouse    alias:FXE_main_upper_fidelix_XML_list
    Move Mouse    offset:0,0    # Create XML -> Alarmgroups

    Move Mouse    alias:FXE_main_upper_fidelix_XML_list
    Move Mouse    offset:0,40    # Create XML -> Modules

    Move Mouse    alias:FXE_main_upper_fidelix_XML_list
    Move Mouse    offset:0,80    # Create XML -> Modbus devices

    Move Mouse    alias:FXE_main_upper_fidelix_menu_list
    Move Mouse    offset:0,70    # Get data from PLC

    Move Mouse    alias:FXE_main_upper_fidelix_menu_list
    Move Mouse    offset:0,120    # Create OPC list

    Move Mouse    alias:FXE_main_upper_fidelix_menu_list
    Move Mouse    offset:0,150    # Widequick export

    Move Mouse    alias:FXE_main_upper_fidelix_menu_list
    Move Mouse    offset:0,190    # Update PLC firmware

    Move Mouse    alias:FXE_main_upper_fidelix_menu_list
    Move Mouse    offset:0,230    # Activate PLC firmware

    Move Mouse    alias:FXE_main_upper_fidelix_menu_list
    Move Mouse    offset:0,270    # Import new PLC firmware

    Wait For Element    alias:FXE_main_upper_menu    timeout=30
    RPA.Desktop.Click With Offset    alias:FXE_main_upper_menu    x=-20    y=0    action=click    # Fidelix submenu



Upper Menu Points Submenu Walkthrough
    Wait For Element    alias:FXE_main_upper_menu    timeout=30
    RPA.Desktop.Click With Offset    alias:FXE_main_upper_menu    x=20    y=0    action=click    # Points submenu

    Wait For Element    alias:FXE_main_upper_points_menu_list    timeout=10
    Move Mouse    alias:FXE_main_upper_points_menu_list

    Wait For Element    alias:FXE_main_upper_menu    timeout=30
    RPA.Desktop.Click With Offset    alias:FXE_main_upper_menu    x=20    y=0    action=click    # Points submenu


Upper Menu Tools Submenu Walkthrough
    Wait For Element    alias:FXE_main_upper_menu    timeout=30
    RPA.Desktop.Click With Offset    alias:FXE_main_upper_menu    x=70    y=0    action=click    # Tools submenu

    Wait For Element    alias:FXE_main_upper_tools_menu_list    timeout=10
    Move Mouse    alias:FXE_main_upper_tools_menu_list
    Move Mouse    offset:0,-20    # HTML editor

    Move Mouse    alias:FXE_main_upper_tools_menu_list
    Move Mouse    offset:0,20    # OpenPCS

    Wait For Element    alias:FXE_main_upper_menu    timeout=30
    RPA.Desktop.Click With Offset    alias:FXE_main_upper_menu    x=70    y=0    action=click    # Tools submenu



Upper Menu File New Project
    [Arguments]    ${new_window}    ${project_name}
    
    # Preset: Opened FXE, opened project
    Wait For Element    alias:FXE_main_upper_menu    timeout=30
    RPA.Desktop.Click With Offset    alias:FXE_main_upper_menu    x=-85    y=0    action=click    # File submenu

    Wait For Element    alias:FXE_main_upper_file_menu_list    timeout=10
    
    Move Mouse    alias:FXE_main_upper_file_menu_list
    Move Mouse    offset:0,-290    # New project
    RPA.Desktop.Click

    Wait For Element    alias:FXE_main_upper_new_project_form    timeout=10
    IF    $new_window == 1
        RPA.Desktop.Click With Offset    alias:FXE_main_upper_new_project_form    x=0    y=-50    # New window option
    ELSE
        IF    $new_window == 2
            RPA.Desktop.Click With Offset    alias:FXE_main_upper_new_project_form    x=0    y=0    # Existing window option
        ELSE
            RPA.Desktop.Click With Offset    alias:FXE_main_upper_new_project_form    x=0    y=50    # Cancel option
        END
        
    END

    RPA.Desktop.Wait For Element    alias:FXE_new_project_wizard_next_btn    timeout=5
    RPA.Desktop.Click    alias:FXE_new_project_wizard_next_btn

    RPA.Desktop.Wait For Element    alias:FXE_main_new_project_no_name_form    timeout=5
    RPA.Desktop.Click    alias:FXE_main_OK_noicon_active_form_btn
    # RPA.Desktop.Click With Offset    alias:FXE_main_new_project_no_name_form    x=120    y=40    # Ok button

    # RPA.Desktop.Click    alias:FXE_new_project_wizard_location_folder_btn
    # Run Keyword And Continue On Failure    Check Projects Common Folder Exists
    # RPA.Desktop.Type Text     c:\QA\TestProjects\    # enter=true
    # RPA.Desktop.Press Keys    enter
    # RPA.Desktop.Press Keys    tab
    # RPA.Desktop.Press Keys    enter
    # RPA.Desktop.Click    alias:FXE_new_project_wizard_save_folder_btn
    # RPA.Desktop.Press Keys    tab
    RPA.Desktop.Type Text    ${project_name}
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Type Text    ${project_name}
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Type Text    1234

    RPA.Desktop.Click    alias:FXE_new_project_wizard_next_btn
    RPA.Desktop.Wait For Element    alias:FXE_new_project_wizard_next_btn    timeout=5   
    RPA.Desktop.Click    alias:FXE_new_project_wizard_next_btn
    RPA.Desktop.Wait For Element    alias:FXE_new_project_wizard_create_btn    timeout=5   
    RPA.Desktop.Click    alias:FXE_new_project_wizard_create_btn

Upper Menu File New Group
    [Arguments]    ${new_window}    ${group_path}    ${group_name}

    # Preset: Opened FXE, opened project
    
    Delete Group    ${group_path}    ${group_name}   

    Wait For Element    alias:FXE_main_upper_menu    timeout=30
    RPA.Desktop.Click With Offset    alias:FXE_main_upper_menu    x=-85    y=0    action=click    # File submenu

    Wait For Element    alias:FXE_main_upper_file_menu_list    timeout=10
    
    Move Mouse    alias:FXE_main_upper_file_menu_list
    Move Mouse    offset:0,-250    # New group
    RPA.Desktop.Click

    RPA.Desktop.Wait For Element    alias:FXE_start_create_a_new_group_name_form    timeout=10
    RPA.Desktop.Click    alias:FXE_start_create_a_new_group_name_form
    RPA.Desktop.Type Text    ${group_path}${group_name}
    # Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    # RPA.Desktop.Press Keys    tab
    # Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click    alias:FXE_start_create_a_new_group_project_save_btn
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Move Mouse    alias:FXE_start_create_group_select_all
    RPA.Desktop.Click With Offset    x=-30    y=0    action=click
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click    alias:FXE_start_group_project_add_btn
    RPA.Desktop.Type Text    Test Group name
    RPA.Desktop.Press Keys    tab 
    RPA.Desktop.Type Text    Test Group address
    RPA.Desktop.Press Keys    tab 
    RPA.Desktop.Type Text    123456
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    alt    F4
    ${folder_existed}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_start_group_save_form    timeout=10    # Saving changes form
    Run Keyword If    ${folder_existed}    RPA.Desktop.Click    alias:FXE_main_YES_noicon_form_inactive_btn    action=click
    Log To Console    Group has been saved OK



