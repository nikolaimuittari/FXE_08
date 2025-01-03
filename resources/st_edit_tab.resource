*** Settings ***
Documentation       Common resource file             

                    # Win+D Display the desktop.
                    # Win+M Minimize all windows.
                    # Win+Shift+M Restore minimized windows to the desktop.
                    # Win+↑ Maximize the window.
                    # Win+← Maximize the window to the left side of the screen.
                    # Win+→ Maximize the window to the right side of the screen.
                    # Win+↓ Minimize the window.
                    # Win+Home Minimize all but the active window.
                    # Win+Shift+↑ Stretch the window to the top and bottom of the screen.

Library             RPA.Desktop
Library             RPA.Windows
Library             OperatingSystem
Library             DateTime
Library             RPA.RobotLogListener
# Library             RPA.Dialogs

Resource            project_tab.resource
Resource            common.resource

*** Variables ***

${current_date}=    Get Current Date    result_format=%d.%m.%y

# ${SLEEP_TIMEOUT_DEFAULT}    1.0s

*** Keywords ***

ST-Edit Tab Select
                
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab    timeout=10    # ST-Edit tab
    RPA.Desktop.Click    alias:FXE_main_st-edit_tab
    RPA.Desktop.Move Mouse    offset:500,400

    
ST-Edit Tab Separate Window Operations
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab    timeout=10    # ST-Edit tab
    RPA.Desktop.Move Mouse    alias:FXE_main_st-edit_tab
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click    alias:FXE_main_st-edit_tab_separate_icon    # Separate window icon
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_separate_window_icon    # Separate window header icon
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_separate_window_position_btns    # Separate window position buttons

    RPA.Desktop.Click With Offset    alias:FXE_main_st-edit_separate_window_position_btns    x=0    y=50    # Reset position data button. 
    # Separate window will be closed
    # Window's position will be moded to the left upper corner

    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab    timeout=10    # ST-Edit tab
    RPA.Desktop.Move Mouse    alias:FXE_main_st-edit_tab    # 
    #    Sleep    0.5s
    RPA.Desktop.Click    alias:FXE_main_st-edit_tab_separate_icon    # Separate window icon
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_separate_window_icon    # Separate window header icon
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Move Mouse    alias:FXE_main_st-edit_tab_separate_window_icon
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Mouse Button    left    # Dragging window
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Move Mouse    offset:550,400    # Move mouse to the empty space
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Release Mouse Button    left    # Releasing the point

    # At this point separate window position is at 550x400
    RPA.Desktop.Click With Offset    alias:FXE_main_st-edit_separate_window_position_btns    x=0    y=-50    # Minimize window button. 
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab    timeout=10    # ST-Edit tab
    RPA.Desktop.Move Mouse    alias:FXE_main_st-edit_tab    #
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click    alias:FXE_main_st-edit_tab_separate_icon    # Separate window icon
    RPA.Desktop.Press Keys    alt     F4


ST-Edit Tab New ST Program Random Name
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab    timeout=10    # ST-Edit tab
    ${random_number}=    Evaluate    random.randint(10000, 99999)
    ${random_number}=    Convert To String    ${random_number}

    ${alphabet} =    Create List    a    b    c    d    e    f    g    h    i    j    k    l    m    n    o    p    q    r    s    t    u    v    w    x    y    z
    ${random_word} =    Evaluate    ''.join(random.sample($alphabet, 3))
    
    RPA.Desktop.Click With Offset    alias:FXE_main_st-edit_tab_toolbar_new_import_btns    x=-30    y=0    action=click    # New file button
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_new_file_form    timeout=10    # New file form

    RPA.Desktop.Type Text    PROGRAM_${random_word}
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    enter
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_left_panel_subtabs


Close Opened ST File
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_toolbar_start_stop_close_btns    timeout=10    # Close button
    RPA.Desktop.Click With Offset    alias:FXE_main_st-edit_tab_toolbar_start_stop_close_btns    x=50    y=0    action=click    # Close button

    ${changed_file_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_toolbar_start_stop_close_form    timeout=25
    # File is changed form
    Run Keyword If    ${changed_file_form_exists}    RPA.Desktop.Click With Offset    alias:FXE_main_st-edit_tab_toolbar_start_stop_close_form    x=50    y=65    action=click    # Cancel




ST-Edit Tab New ST Function Block Random Name
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab    timeout=10    # ST-Edit tab
    ${random_number}=    Evaluate    random.randint(10000, 99999)
    ${random_number}=    Convert To String    ${random_number}

    ${alphabet} =    Create List    a    b    c    d    e    f    g    h    i    j    k    l    m    n    o    p    q    r    s    t    u    v    w    x    y    z
    ${random_word} =    Evaluate    ''.join(random.sample($alphabet, 3))
    
    RPA.Desktop.Click With Offset    alias:FXE_main_st-edit_tab_toolbar_new_import_btns    x=-30    y=0    action=click    # New file button
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_new_file_form    timeout=10    # New file form

    RPA.Desktop.Type Text    BLOCK_${random_word}
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    down
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    enter
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_left_panel_subtabs

ST-Edit Tab New ST Function Random Name
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab    timeout=10    # ST-Edit tab
    ${random_number}=    Evaluate    random.randint(10000, 99999)
    ${random_number}=    Convert To String    ${random_number}

    ${alphabet} =    Create List    a    b    c    d    e    f    g    h    i    j    k    l    m    n    o    p    q    r    s    t    u    v    w    x    y    z
    ${random_word} =    Evaluate    ''.join(random.sample($alphabet, 3))
    
    RPA.Desktop.Click With Offset    alias:FXE_main_st-edit_tab_toolbar_new_import_btns    x=-30    y=0    action=click    # New file button
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_new_file_form    timeout=10    # New file form

    RPA.Desktop.Type Text    FUNCTION_${random_word}
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    down
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    down
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    enter
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_left_panel_subtabs    timeout=10
        

ST-Edit Tab ST Program Delete
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_right_panel_subtabs    timeout=10    # right panel subtabs
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_right_panel_program_icon    timeout=10    # PROGRAM icon
    RPA.Desktop.Click    alias:FXE_main_st-edit_tab_right_panel_program_icon    action=rightclick    # Right panel Right Mouse Button Menu
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_right_panel_rmb_menu    timeout=10    # Right panel Right Mouse Button Menu
    RPA.Desktop.Click With Offset   alias:FXE_main_st-edit_tab_right_panel_rmb_menu    x=0    y=0   action=click    # RMB Delete
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_right_panel_delete_form    timeout=10    # Delete form
    RPA.Desktop.Click    alias:FXE_main_YES_noicon_form_btn    # Yes button


ST-Edit Tab ST Functioin Block Delete
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_right_panel_subtabs    timeout=10    # right panel subtabs
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_right_panel_block_icon    timeout=10    # PROGRAM icon
    RPA.Desktop.Click    alias:FXE_main_st-edit_tab_right_panel_block_icon    action=rightclick    # Right panel Right Mouse Button Menu
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_right_panel_rmb_menu    timeout=10    # Right panel Right Mouse Button Menu
    RPA.Desktop.Click With Offset   alias:FXE_main_st-edit_tab_right_panel_rmb_menu    x=0    y=0   action=click    # RMB Delete
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_right_panel_delete_form    timeout=10    # Delete form
    RPA.Desktop.Click    alias:FXE_main_YES_noicon_form_btn    # Yes button


ST-Edit Tab ST Functioin Delete
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_right_panel_subtabs    timeout=10    # right panel subtabs
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_right_panel_function_icon    timeout=10    # PROGRAM icon
    RPA.Desktop.Click    alias:FXE_main_st-edit_tab_right_panel_function_icon    action=rightclick    # Right panel Right Mouse Button Menu
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_right_panel_rmb_menu    timeout=10    # Right panel Right Mouse Button Menu
    RPA.Desktop.Click With Offset   alias:FXE_main_st-edit_tab_right_panel_rmb_menu    x=0    y=0   action=click    # RMB Delete
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_right_panel_delete_form    timeout=10    # Delete form
    RPA.Desktop.Click    alias:FXE_main_YES_noicon_form_btn    # Yes button


ST-Edit Tab ST Program Modification

    # ST-Edit Tab New ST Program Random Name

    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_left_panel_subtabs    timeout=10    # Left panel subtabs
    RPA.Desktop.Click With Offset    alias:FXE_main_st-edit_tab_left_panel_subtabs    x=-50    y=0    action=click    # Note subtab
    RPA.Desktop.Move Mouse    offset:0,100
    RPA.Desktop.Click    action=click
    RPA.Desktop.Press Keys    ctrl    home
    RPA.Desktop.Press Keys    enter
    RPA.Desktop.Type Text    This is a Note
    RPA.Desktop.Press Keys    enter
    ST-Edit Tab Add Variable Arguments-5    1    1    Variable    2.0    This is a comment
    ST-Edit Tab Add Variable Arguments-5    1    1    Unused    3.0    This is another comment
    ST-Edit Tab Code Add Arguments-1    code_line=rVariable:=3.0;
    

ST-Edit Tab Code Add Arguments-1
    [Arguments]    ${code_line}
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_left_panel_subtabs    timeout=10    # Left panel subtabs
    RPA.Desktop.Click With Offset    alias:FXE_main_st-edit_tab_left_panel_subtabs    x=0    y=0    action=click    # Code subtab

    RPA.Desktop.Click With Offset    alias:FXE_main_st-edit_tab_left_panel_subtabs    x=0    y=150    action=click    # Code space

    RPA.Desktop.Press Keys    ctrl    A
    Sleep    2s
    RPA.Desktop.Set clipboard value    ${code_line}
    ${text}=    Get clipboard value
    Log To Console   We just copied '${text}'
    RPA.Desktop.Press Keys    ctrl    V
    # RPA.Desktop.Paste from clipboard    ${code_line}
    # RPA.Desktop.Press Keys    del
    # Sleep    2s
    # rVariable :;0.3=
    # RPA.Desktop.Type Text    ${code_line}
    Sleep    3s
    # RPA.Desktop.Press Keys    enter


ST-Edit Tab Add Variable Arguments-5
    [Arguments]    ${var_type}    ${data_type}    ${var_name}    ${var_default}    ${var_comment}
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_left_panel_subtabs    timeout=10    # Left panel subtabs
    RPA.Desktop.Click With Offset    alias:FXE_main_st-edit_tab_left_panel_subtabs    x=50    y=0    action=click    # Variables subtab
    RPA.Desktop.Move Mouse   offset:0,100    
    RPA.Desktop.Click    action=rightclick    # Variables table Rightclick to call the menu 
    
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_variables_rmb_menu    timeout=10    # RMB menu
    RPA.Desktop.Move Mouse    alias:FXE_main_st-edit_tab_variables_rmb_menu
    RPA.Desktop.Click With Offset    alias:FXE_main_st-edit_tab_variables_rmb_menu    x=0    y=-70    action=click    # Add Variable
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_left_panel_add_variable_form    timeout=10    # Add Local variable form
    RPA.Desktop.Move Mouse    alias:FXE_main_st-edit_tab_left_panel_add_variable_form
    RPA.Desktop.Click With Offset    alias:FXE_main_st-edit_tab_left_panel_add_variable_form    x=-100    y=-135    action=click    # Data type
    
    IF    ${var_type}==1
        RPA.Desktop.Press Keys    enter 
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    END
    
    RPA.Desktop.Press Keys    tab

    IF    ${data_type}==1
        RPA.Desktop.Press Keys    r
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    END
    
    RPA.Desktop.Type Text    ${var_name}
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Type Text    ${var_default}
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Type Text    ${var_comment}

    RPA.Desktop.Click    alias:FXE_main_OK_form_btn    action=click    # OK button
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}


ST-Edit Tab Syntax Check
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_toolbar_save_saveas_syntax_btns    timeout=10    # Toolbar buttons
    RPA.Desktop.Click With Offset    alias:FXE_main_st-edit_tab_toolbar_save_saveas_syntax_btns    x=50    y=0    action=click    # Syntax check
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}


ST-Edit Tab Clean Unused Variables
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_left_panel_subtabs    timeout=10    # Left panel subtabs
    RPA.Desktop.Click With Offset    alias:FXE_main_st-edit_tab_left_panel_subtabs    x=50    y=0    action=click    # Variables subtab
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_toolbar_clean_search_btns    timeout=10    # Toolbar buttons
    RPA.Desktop.Click With Offset    alias:FXE_main_st-edit_tab_toolbar_clean_search_btns    x=-25    y=0    action=click    # Clean unused variables
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    # There shall be unused variable (call ST-Edit Tab Add Variable Arguments-5 for REAL variable with "Unused" name)
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_clean_unused_found_form    timeout=10    # Unused found form
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click    alias:FXE_main_YES_noicon_form_btn
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}


ST-Edit Tab Search Arguments-1
    [Arguments]    ${text}
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_toolbar_clean_search_btns    timeout=10    # Toolbar buttons
    RPA.Desktop.Click With Offset    alias:FXE_main_st-edit_tab_toolbar_clean_search_btns    x=25    y=0    action=click    # Search button
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit-tab_search_form    timeout=10    # Search form
    RPA.Desktop.Type Text    ${text}
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Press Keys    space
    RPA.Desktop.Press Keys    space
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Press Keys    space
    RPA.Desktop.Press Keys    space
    RPA.Desktop.Click With Offset    alias:FXE_main_st-edit-tab_search_form    x=0    y=50    # Find button
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}


ST-Edit Tab Import POE File
    [Arguments]    ${save}
    
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_toolbar_new_import_btns    timeout=10    # New Import buttons
    RPA.Desktop.Click With Offset    alias:FXE_main_st-edit_tab_toolbar_new_import_btns    x=25    y=0    action=click    # Import POE button

    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_import_poe_form    timeout=10    # Import form
    RPA.Desktop.Click With Offset    alias:FXE_main_st-edit_tab_import_poe_form    x=-330    y=240    action=click    # Show All checkbox
    RPA.Desktop.Click With Offset    alias:FXE_main_st-edit_tab_import_poe_form    x=0    y=-115    action=click    # POE files 1st line
    
    IF    $save == 1
        RPA.Desktop.Click With Offset    alias:FXE_main_st-edit_tab_import_poe_form    x=195    y=180    action=click    # OK button
        RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_tab_import_poe_link_form    timeout=10    # Link to active resource form
        # x=60    y=40    YES button
        # x=125    y=40    NO button
        RPA.Desktop.Click With Offset    alias:FXE_main_st-edit_tab_import_poe_link_form    x=60    y=40    action=click    # YES button

    ELSE
        RPA.Desktop.Click With Offset    alias:FXE_main_st-edit_tab_import_poe_form    x=300    y=180    action=click    # Cancel button
    END
