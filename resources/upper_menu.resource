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

*** Variables ***



*** Keywords ***
Upper Menu File Submenu Walkthrough
    Wait For Element    alias:FXE_main_upper_menu    timeout=30
    RPA.Desktop.Click With Offset    alias:FXE_main_upper_menu    x=-85    y=0    action=click    # File submenu

    Wait For Element    alias:FXE_main_upper_file_menu_list    timeout=10
    
    Move Mouse    alias:FXE_main_upper_file_menu_list
    Move Mouse    offset:0,-290    # New project

    Move Mouse    alias:FXE_main_upper_file_menu_list
    Move Mouse    offset:0,-250    # New group project

    Move Mouse    alias:FXE_main_upper_file_menu_list
    Move Mouse    offset:0,-210    # Open group / project

    Move Mouse    alias:FXE_main_upper_file_menu_list
    Move Mouse    offset:0,-170    # Load template

    Move Mouse    alias:FXE_main_upper_file_menu_list
    Move Mouse    offset:0,-120    # Save

    Move Mouse    alias:FXE_main_upper_file_menu_list
    Move Mouse    offset:0,-90    # Save As

    Move Mouse    alias:FXE_main_upper_file_menu_list
    Move Mouse    offset:0,-50    # Save selected points

    Move Mouse    alias:FXE_main_upper_file_menu_list
    Move Mouse    offset:0,0    # Load points from file

    Move Mouse    alias:FXE_main_upper_file_menu_list
    Move Mouse    offset:0,30    # Make template

    Move Mouse    alias:FXE_main_upper_file_menu_list
    Move Mouse    offset:0,70    # Import

    Move Mouse    alias:FXE_main_upper_file_menu_list
    Move Mouse    offset:100,70    # Import point text file

    Move Mouse    alias:FXE_main_upper_file_menu_list
    Move Mouse    offset:0,120    # Close project

    Move Mouse    alias:FXE_main_upper_file_menu_list
    Move Mouse    offset:0,160    # Settings

    Move Mouse    alias:FXE_main_upper_file_menu_list
    Move Mouse    offset:0,200    # Explore programdata

    Move Mouse    alias:FXE_main_upper_file_menu_list
    Move Mouse    offset:0,250    # Print

    Move Mouse    alias:FXE_main_upper_file_menu_list
    Move Mouse    offset:0,280    # Exit

    Wait For Element    alias:FXE_main_upper_menu    timeout=30
    RPA.Desktop.Click With Offset    alias:FXE_main_upper_menu    x=-85    y=0    action=click    # File submenu
    


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



