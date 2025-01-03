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
Library             RPA.Excel.Application
# Library             RPA.Dialogs
#Library             RPA.JavaAccessBridge

Resource            project_tab.resource
Resource            common.resource


*** Variables ***

${current_date}=    Get Current Date    result_format=%d.%m.%y
${button}    
${sleep_local}=    0.5s

*** Keywords ***

Graphics Tab Select
     RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab    timeout=5
    RPA.Desktop.Click    alias:FXE_main_graphics_tab
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_right_panel_tabs    timeout=5


Graphics Tab Detach Attach
    # RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab    timeout=10
    # RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_separate_tab_icon    timeout=5
    RPA.Desktop.Click    alias:FXE_main_graphics_tab_separate_tab_icon    # Separate window icon
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_separate_window_icon    timeout=5  # Separate window header icon
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Wait For Element    alias:FXE_main_st-edit_separate_window_position_btns   timeout=5     # Separate window position buttons
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click With Offset    alias:FXE_main_st-edit_separate_window_position_btns    x=0    y=50    action=click    # Reset position data button

# Moved to common.resource
# Delete File If Exists
#     [Arguments]    ${filepath}
#     ${file_exists}=    Run Keyword And Return Status    OperatingSystem.File Should Exist    ${filepath}    ignore_error=True
#     Run Keyword If    ${file_exists}    OperatingSystem.Remove File    ${filepath}
#     ...    ELSE    Log To Console    File does not exist: ${filepath}
#     Run Keyword If    ${file_exists}    Log To Console    File deleted: ${filepath}

Graphics Tab New HTML
    [Arguments]    ${filename}
    
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_new_open_btns    timeout=5
    RPA.Desktop.Click With Offset    alias:FXE_main_graphics_tab_new_open_btns    x=-25    y=0    action=click    # New and Open buttons
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_new_html_form    timeout=5    # New file form
    RPA.Desktop.Type Text    ${filename}
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click With Offset    alias:FXE_main_graphics_tab_new_html_form    x=120    y=35    action=click    # OK button

Graphics Tab Right Panel Subtabs
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_right_panel_tabs    timeout=5
    RPA.Desktop.Click With Offset    alias:FXE_main_graphics_tab_right_panel_tabs    x=-100    y=0    action=click    # Files subtab
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_right_files_btns    timeout=5
    Log To Console    Files subtab visible

    RPA.Desktop.Click With Offset    alias:FXE_main_graphics_tab_right_panel_tabs    x=-50    y=0    action=click    # Points subtab
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_right_points_ctrls    timeout=5    
    Log To Console    Points subtab visible

    RPA.Desktop.Click With Offset    alias:FXE_main_graphics_tab_right_panel_tabs    x=50    y=0    action=click    # Groups subtab
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_right_groups_btns    timeout=5    
    Log To Console    Groups subtab visible

    RPA.Desktop.Click With Offset    alias:FXE_main_graphics_tab_right_panel_tabs    x=100    y=0    action=click    # Settings subtab
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_right_settings_editor_settings_ctrls    timeout=5    
    Log To Console    Settings subtab visible
    

Graphics Tab Right Panel Settings Subtab Resolution Select
    [Arguments]     ${screen_type}

    # RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_right_settings_ctrls    timeout=5

    Log To Console    Screen type:${screen_type}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_right_settings_ctrls    
    ...    x=-22    
    ...    y=-80    
    ...    action=click    # resolution ddwn 1920 is default
    Sleep    ${sleep_local}

    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_right_settings_ctrls_res    timeout=5
    # RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_right_settings_ctrls_res

    IF    ${screen_type} == 640
        RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_right_settings_ctrls_res
        Sleep    ${sleep_local}
        RPA.Desktop.Move Mouse    offset:0,-25
        Sleep    ${sleep_local}
        RPA.Desktop.Press Keys    enter
        # RPA.Desktop.Click    # 640

    ELSE IF    ${screen_type} == 800
        RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_right_settings_ctrls_res
        Sleep    ${sleep_local}
        RPA.Desktop.Move Mouse    offset:0,-10
        Sleep    ${sleep_local}
        RPA.Desktop.Press Keys    enter

    ELSE IF    ${screen_type} == 1024
        RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_right_settings_ctrls_res
        Sleep    ${sleep_local}
        RPA.Desktop.Move Mouse    offset:0,5
        Sleep    ${sleep_local}
        RPA.Desktop.Press Keys    enter

    ELSE IF    ${screen_type} == 1920
        RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_right_settings_ctrls_res
        Sleep    ${sleep_local}
        RPA.Desktop.Move Mouse    offset:0,20
        Sleep    ${sleep_local}
        RPA.Desktop.Press Keys    enter

    ELSE IF    ${screen_type} == 320
        RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_right_settings_ctrls_res
        Sleep    ${sleep_local}
        RPA.Desktop.Move Mouse    offset:0,35
        Sleep    ${sleep_local}
        RPA.Desktop.Press Keys    enter

    ELSE IF    ${screen_type} == 1280
        RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_right_settings_ctrls_res
        Sleep    ${sleep_local}
        RPA.Desktop.Move Mouse    offset:0,50
        Sleep    ${sleep_local}
        RPA.Desktop.Press Keys    enter
    
    ELSE
        RPA.Desktop.Press Keys    esc

    END
    
    Sleep    ${sleep_local}



Graphics Tab Right Panel Settings Subtab
    [Arguments]    ${screen_type}    ${symbol_folder}    ${background_color}    ${grid}    ${snap}

    RPA.Desktop.Click With Offset    alias:FXE_main_graphics_tab_right_panel_tabs    x=100    y=0    action=click    # Settings subtab
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_right_settings_ctrls    timeout=5    
    Log To Console    Settings subtab visible
    
# 	Settings
    # x        y
    # -165    -200  Pin icon
	# -30	-110		resolution ddwn
	# 140	-110		background color ddwn
	# 140	-65		background image ddwn
	# -140	-70		640*480 chkbx
	# -140	-45		800*600 chkbx
	# -140	-20		1024*768 chkbx
	
	# 120	-20		CSS ddwn
	# 140	-20		CSS button
	# -25	50		Codepage ddwn
	# 140	25		Font ddwn

	# -140	70		User level
	
	# 40	150		Symbol folder ddwn
	# -60	190		Grid ddwn
    # 40   190    Snap ddwn

    # Graphics Tab Right Panel Settings Subtab Resolution Select    ${screen_type}
    # Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_right_settings_ctrls    
    ...    x=-165    
    ...    y=-200    
    ...    action=click    # Pin icon
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_right_settings_ctrls    
    ...    x=-165    
    ...    y=-200    
    ...    action=click    # Pin icon
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_right_settings_ctrls    
    ...    x=-30    
    ...    y=-110    
    ...    action=click    # resolution ddwn
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    esc

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_right_settings_ctrls    
    ...    x=140    
    ...    y=-110    
    ...    action=click    # background color ddwn
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    ${background_color}
    # RPA.Desktop.Press Keys    enter
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_right_settings_ctrls    
    ...    x=140    
    ...    y=-65    
    ...    action=click    # background image ddwn
    Sleep    ${sleep_local}
    RPA.Desktop.Click
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_right_settings_ctrls    
    ...    x=-140    
    ...    y=-70   
    ...    action=click    # 640x480
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_right_settings_ctrls    
    ...    x=-140    
    ...    y=-45    
    ...    action=click    # 800x600
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_right_settings_ctrls    
    ...    x=-140    
    ...    y=-20    
    ...    action=click    # 1024x768
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_right_settings_ctrls    
    ...    x=120    
    ...    y=-20
    ...    action=click    # CSS ddwn
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    f
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_right_settings_ctrls    
    ...    x=140    
    ...    y=-20    
    ...    action=click    # CSS button
    Sleep    ${sleep_local}

    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_right_settings_ctrls_css_form    timeout=5
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_right_settings_ctrls_css_form    
    ...    x=350    
    ...    y=280    
    ...    action=click    # Cancel button
    Sleep    ${sleep_local}
    # x=250 y=275 (OK button)
    # x=350 y=275 (Cancel button)

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_right_settings_ctrls    
    ...    x=-25    
    ...    y=50    
    ...    action=click    # Codepage ddwn
    # UTF-8 default
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    enter

    Sleep    ${sleep_local}
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_right_settings_ctrls    
    ...    x=-25    
    ...    y=50
    ...    action=click    # Codepage ddwn
    # UTF-8 default
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down

    Sleep    ${sleep_local}
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_right_settings_ctrls    
    ...    x=140    
    ...    y=25    
    ...    action=click    # Font ddwn
    # Helvetica default
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down

    Sleep    ${sleep_local}
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_right_settings_ctrls    
    ...    x=40    
    ...    y=150    
    ...    action=click    # Symbol folder ddwn
    # 2023 default
    Sleep    ${sleep_local}

    IF    $symbol_folder == 'local'    # Local
        RPA.Desktop.Press Keys    up
        RPA.Desktop.Press Keys    up
        RPA.Desktop.Press Keys    up
        RPA.Desktop.Press Keys    up
        RPA.Desktop.Press Keys    enter

    ELSE IF    $symbol_folder == 'cloud'    # Cloud
        RPA.Desktop.Press Keys    up
        RPA.Desktop.Press Keys    up
        RPA.Desktop.Press Keys    up
        RPA.Desktop.Press Keys    enter

    ELSE IF    $symbol_folder == '2018'    # 2018
        RPA.Desktop.Press Keys    up
        RPA.Desktop.Press Keys    up
        RPA.Desktop.Press Keys    enter

    ELSE IF    $symbol_folder == '2023'    # 2023
        # RPA.Desktop.Press Keys    down
        # RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    up
        RPA.Desktop.Press Keys    enter

    ELSE
        RPA.Desktop.Press Keys    esc    # default

    END
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_right_settings_ctrls    
    ...    x=-60    
    ...    y=190    
    ...    action=click    # Grid ddwn
    # None default
    Sleep    ${sleep_local}
    IF    ${grid} == 4    # dot 20x20
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    enter

    ELSE IF    ${grid} == 3    # dot 10x10
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    enter

    ELSE IF    ${grid} == 2    # dash 20x20
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    enter

    ELSE IF    ${grid} == 1    # dash 10x10
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    enter

    ELSE
        RPA.Desktop.Press Keys    esc

    END
    Sleep    ${sleep_local}


    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_right_settings_ctrls    
    ...    x=40    
    ...    y=190    
    ...    action=click    # Snap ddwn
    # None default
    Sleep    ${sleep_local}
    IF    ${snap} == 5    # 50
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    enter
    ...    
    ELSE IF    ${snap} == 4    # 30
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    enter

    ELSE IF    ${snap} == 3    # 20
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    enter

    ELSE IF    ${snap} == 2    # 10
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    enter

    ELSE IF    ${snap} == 1    # 5
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    enter

    ELSE
        RPA.Desktop.Press Keys    esc

    END
    Sleep    ${sleep_local}




Graphics Tab Right Panel Settings Symbols Folder
    [Arguments]    ${symbol_folder}
    
    RPA.Desktop.Click With Offset    alias:FXE_main_graphics_tab_right_panel_tabs    x=100    y=0    action=click    # Settings subtab
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_right_settings_ctrls    timeout=5    
    Log To Console    Settings subtab visible

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_right_settings_ctrls    
    ...    x=40    
    ...    y=150    
    ...    action=click    # Symbol folder ddwn
    # 2023 default
    Sleep    ${sleep_local}

    IF    $symbol_folder == 'local'    # Local
        # RPA.Desktop.Press Keys    down
        # RPA.Desktop.Press Keys    down
        # RPA.Desktop.Press Keys    down
        Sleep    ${sleep_local}
        RPA.Desktop.Press Keys    enter

    ELSE IF    $symbol_folder == 'cloud'    # Cloud
        Sleep    ${sleep_local}
        RPA.Desktop.Press Keys    down
        # RPA.Desktop.Press Keys    down
        # RPA.Desktop.Press Keys    down
        Sleep    ${sleep_local}
        RPA.Desktop.Press Keys    enter

    ELSE IF    $symbol_folder == '2018'    # 2018
        Sleep    ${sleep_local}
        RPA.Desktop.Press Keys    down
        Sleep    ${sleep_local}
        RPA.Desktop.Press Keys    down
        Sleep    ${sleep_local}
        RPA.Desktop.Press Keys    enter

    ELSE IF    $symbol_folder == '2023'    # 2023
        Sleep    ${sleep_local}
        RPA.Desktop.Press Keys    down
        Sleep    ${sleep_local}
        RPA.Desktop.Press Keys    down
        Sleep    ${sleep_local}
        RPA.Desktop.Press Keys    down
        Sleep    ${sleep_local}
        RPA.Desktop.Press Keys    down
        Sleep    ${sleep_local}
        RPA.Desktop.Press Keys    enter
        Sleep    ${sleep_local}


    ELSE
        Log To Console    Symbol folder not defined
        RPA.Desktop.Press Keys    esc    # default

    END
    Sleep    ${sleep_local}




Graphics Tab Right Panel Files Subtab Buttons
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_right_panel_tabs    timeout=5
    RPA.Desktop.Click With Offset    alias:FXE_main_graphics_tab_right_panel_tabs    x=-100    y=0    action=click    # Files subtab
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_right_files_btns    timeout=5
    Log To Console    Files subtab visible

    # Tree-view icons/buttons
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_right_files_css_icon    timeout=5
    RPA.Desktop.Click    alias:FXE_main_graphics_tab_right_files_css_icon    action=double click

    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_right_files_templates_icon    timeout=5
    RPA.Desktop.Click    alias:FXE_main_graphics_tab_right_files_templates_icon    action=double click

    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_right_files_thumbnails_icon    timeout=5
    RPA.Desktop.Click    alias:FXE_main_graphics_tab_right_files_thumbnails_icon    action=double click

    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_right_files_new_html_icon    timeout=5
    RPA.Desktop.Click    alias:FXE_main_graphics_tab_right_files_new_html_icon    action=double click

    ${menu_icon_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_right_files_menu_icon    timeout=5
    Run Keyword If    ${menu_icon_exists}    RPA.Desktop.Click    alias:FXE_main_graphics_tab_right_files_menu_icon    action=double click
    ...    ELSE    Log To Console    Menu does not exist
    

Graphics Tab Right Panel Files Subtab Upper Buttons Hovering

    # Upper Buttons
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_right_files_btns    timeout=5
    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_right_files_btns
    RPA.Desktop.Move Mouse    offset:-150,0    # Expand tree-view

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_right_files_btns
    RPA.Desktop.Move Mouse    offset:-100,0    # Select All included 

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_right_files_btns
    RPA.Desktop.Move Mouse    offset:-70,0    # Select All files

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_right_files_btns
    RPA.Desktop.Move Mouse    offset:0,0    # Open files

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_right_files_btns
    RPA.Desktop.Move Mouse    offset:50,0    # Upload files

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_right_files_btns
    RPA.Desktop.Move Mouse    offset:90,0    # Upload symbols

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_right_files_btns
    RPA.Desktop.Move Mouse    offset:150,0    # Menu


Graphics Tab Right Panel Files Subtab Buttons Expand - Collapse
    
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_right_files_btns    timeout=5
    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_right_files_btns
    RPA.Desktop.Move Mouse    offset:-150,0    # Expand tree-view
    Sleep    ${sleep_local}
    RPA.Desktop.Click

Graphics Tab Right Panel Files Subtab Buttons Select All Included
    
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_right_files_btns    timeout=5
    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_right_files_btns
    RPA.Desktop.Move Mouse    offset:-100,0    # Select All included 
    Sleep    ${sleep_local}
    RPA.Desktop.Click

Graphics Tab Right Panel Files Subtab Buttons Select All
    
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_right_files_btns    timeout=5
    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_right_files_btns
    RPA.Desktop.Move Mouse    offset:-70,0    # Select All files 
    Sleep    ${sleep_local}
    RPA.Desktop.Click

Graphics Tab Right Panel Files Subtab Buttons Open Selected
    
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_right_files_btns    timeout=5
    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_right_files_btns
    RPA.Desktop.Move Mouse    offset:0,0    # Open files 
    Sleep    ${sleep_local}
    RPA.Desktop.Click


Graphics Tab Right Panel Files Subtab Buttons Upload Files
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_right_files_btns    timeout=5
    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_right_files_btns
    RPA.Desktop.Move Mouse    offset:50,0    # Upload files
    Sleep    ${sleep_local}
    RPA.Desktop.Click

    # Check And Close Connection Fail Form
    # Moved to common.resource

    # ${connection_failed_x_1_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_connection_failed_x_1_error    timeout=5
    # # OK button
    # Run Keyword If    ${connection_failed_x_1_exists}    RPA.Desktop.Click With Offset    alias:FXE_main_connection_failed_x_1_error    x=125    y=60    action=click    # OK
    
    # ${connection_failed_c_respond_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_connection_failed_c_respond_error    timeout=25
    # # OK button
    # Run Keyword If    ${connection_failed_x_1_exists}    RPA.Desktop.Click With Offset    alias:FXE_main_connection_failed_c_respond_error    x=125    y=15    action=click    # OK

    # ${connection_failed_c_timeout_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_connection_failed_c_timeout_error    timeout=25
    # # Close button
    # Run Keyword If    ${connection_failed_c_timeout_exists}    RPA.Desktop.Click With Offset    alias:FXE_main_connection_failed_c_timeout_error    x=0    y=15    action=click    # OK


Graphics Tab Right Panel Files Subtab Buttons Upload Symbols
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_right_files_btns    timeout=5
    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_right_files_btns
    RPA.Desktop.Move Mouse    offset:90,0    # Upload symbols
    Sleep    ${sleep_local}
    RPA.Desktop.Click
    ${no_symbols_error_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_no_symbols_error    timeout=5    
    # OK button
    Run Keyword If    ${no_symbols_error_exists}    RPA.Desktop.Click With Offset    alias:FXE_main_graphics_tab_no_symbols_error    x=130    y=50    action=click
    Run Keyword If    ${no_symbols_error_exists}    Log To Console    Visible: alias:FXE_main_graphics_tab_no_symbols_error


Graphics Tab Right Panel Files Subtab Buttons Menu
    [Arguments]    ${autocreate}
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_right_files_btns    timeout=5
    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_right_files_btns
    RPA.Desktop.Move Mouse    offset:1500,0    # Menu button
    Sleep    ${sleep_local}
    RPA.Desktop.Click
    ${auto_create_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_menu_autocreate_form    timeout=5   
    IF    ${auto_create_form_exists}
        IF    ${autocreate} == 1
            # OK button
            Run Keyword If    ${auto_create_form_exists}    RPA.Desktop.Click With Offset    alias:FXE_main_graphics_tab_menu_autocreate_form    x=60    y=45    action=click
        ELSE
            # Cancel button
            Run Keyword If    ${auto_create_form_exists}    RPA.Desktop.Click With Offset    alias:FXE_main_graphics_tab_menu_autocreate_form    x=125    y=45    action=click
        END
    END

Graphics Tab Editor Upper Buttons Hovering
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_upper_btns    timeout=5

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_upper_btns
    RPA.Desktop.Move Mouse    offset:-260,0    # New button

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_upper_btns
    RPA.Desktop.Move Mouse    offset:-225,0    # Open button

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_upper_btns
    RPA.Desktop.Move Mouse    offset:-170,0    # Save button

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_upper_btns
    RPA.Desktop.Move Mouse    offset:-125,0    # Save As button

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_upper_btns
    RPA.Desktop.Move Mouse    offset:-90,0    # Save as JPG ? button

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_upper_btns
    RPA.Desktop.Move Mouse    offset:-30,0    # Upload File button

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_upper_btns
    RPA.Desktop.Move Mouse    offset:10,0    # Upload Symbols button

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_upper_btns
    RPA.Desktop.Move Mouse    offset:70,0    # Copy Symbols to Project button

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_upper_btns
    RPA.Desktop.Move Mouse    offset:120,0    # Update thumbnails button

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_upper_btns
    RPA.Desktop.Move Mouse    offset:160,0    # Open thumbnails button

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_upper_btns
    RPA.Desktop.Move Mouse    offset:200,0    # Create crop button

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_upper_btns
    RPA.Desktop.Move Mouse    offset:250,0    # Close button


Graphics Tab Open HTML
    [Arguments]    ${filename}
    
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_new_open_btns    timeout=5
    RPA.Desktop.Click With Offset    alias:FXE_main_graphics_tab_new_open_btns    x=20    y=0    action=click    # Open buttons
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    # Assuming that standard Windows Open File dialog opened
    RPA.Desktop.Type Text    ${filename}
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    enter

Graphics Tab Close HTML
    [Arguments]    ${save}

    ${upper_buttons_active}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_upper_btns_active    timeout=5

    IF    ${upper_buttons_active}
       RPA.Desktop.Click With Offset    
                ...    alias:FXE_main_graphics_tab_editor_upper_btns_active
                ...    x=270    
                ...    y=0    
                ...    action=click

        ${save_form}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_save_form    timeout=10
        IF    ${save_form}
            IF    ${save} == 1
                RPA.Desktop.Click With Offset    
                ...    alias:FXE_main_graphics_tab_editor_save_form    
                ...    x=-35    
                ...    y=70    
                ...    action=click
                Log To Console    Save pressed
            ELSE IF    ${save} == 2
                RPA.Desktop.Click With Offset    
                ...    alias:FXE_main_graphics_tab_editor_save_form    
                ...    x=70    
                ...    y=70    
                ...    action=click
                Log To Console    Don't save pressed
            ELSE
                RPA.Desktop.Click With Offset    
                ...    alias:FXE_main_graphics_tab_editor_save_form    
                ...    x=170    
                ...    y=70    
                ...    action=click
                Log To Console    Cancel pressed
            END

        END

        Log To Console    HTML is closed
    ELSE
        Log To Console    Editor buttons are not active
    END

Graphics Tab Close All HTMLs
    ${inactive}=    Set Variable    0
    
    WHILE    $inactive == 0
        ${upper_buttons_active}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_upper_btns_active    timeout=5
        IF    ${upper_buttons_active}
            RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_upper_btns_active
            RPA.Desktop.Move Mouse    offset:250,0    # Close button
            Sleep    ${sleep_local}
            RPA.Desktop.Click
            Log To Console    HTML is closed
        ELSE
            ${upper_buttons_inactive}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_upper_btns_inactive    timeout=5
            IF    ${upper_buttons_inactive}
                ${inactive}=    Set Variable    1
            END
        END
    END
    Log To Console    All HTMLs are closed


Graphics Tab Right Panel Files Subtab Refresh F5
    
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_right_files_btns    timeout=5
    RPA.Desktop.Press Keys    F5


Graphics Tab HTML Editor Left Buttons Hovering
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_left_btns    timeout=5

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,-240    # Undo
    Sleep    ${sleep_local}

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,-220    # Redo
    Sleep    ${sleep_local}

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,-160    # Properties
    Sleep    ${sleep_local}

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,-145    # Text object
    Sleep    ${sleep_local}

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,-120    # Symbol object
    Sleep    ${sleep_local}

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,-95    # Add Image
    Sleep    ${sleep_local}

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,-70    # Valuebox
    Sleep    ${sleep_local}

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,-50    # Button
    Sleep    ${sleep_local}

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,-25    # Bar object
    Sleep    ${sleep_local}

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,20    # Left align
    Sleep    ${sleep_local}

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,45    # Center align
    Sleep    ${sleep_local}

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,70    # Right align
    Sleep    ${sleep_local}

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,95    # Custom align
    Sleep    ${sleep_local}

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,140    # To Front
    Sleep    ${sleep_local}

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,165    # To Back
    Sleep    ${sleep_local}

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,210    # Make group
    Sleep    ${sleep_local}

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,235    # Break group
    Sleep    ${sleep_local}

    

Graphics Tab HTML Editor Left Buttons Undo Click
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_left_btns    timeout=5

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,-240    # Undo
    Sleep    ${sleep_local}
    RPA.Desktop.Click

Graphics Tab HTML Editor Left Buttons Redo Click
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_left_btns    timeout=5

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,-220    # Redo
    Sleep    ${sleep_local}
    RPA.Desktop.Click

Graphics Tab HTML Editor Left Buttons Properties Click
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_left_btns    timeout=5

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,-160    # Properties
    Sleep    ${sleep_local}
    RPA.Desktop.Click

Graphics Tab HTML Editor Left Buttons Text Object Click
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_left_btns    timeout=5

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,-145    # Text object
    Sleep    ${sleep_local}
    RPA.Desktop.Click

Graphics Tab HTML Editor Left Buttons Add Symbol Click
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_left_btns    timeout=5

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,-120    # Symbol object
    Sleep    ${sleep_local}
    RPA.Desktop.Click



Graphics Tab HTML Editor Left Buttons Add Image Click
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_left_btns    timeout=5

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,-120    # Symbol object
    Sleep    ${sleep_local}
    RPA.Desktop.Click

Graphics Tab HTML Editor Left Buttons Valuebox Click
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_left_btns    timeout=5

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,-70    # Valuebox
    Sleep    ${sleep_local}
    RPA.Desktop.Click

Graphics Tab HTML Editor Left Buttons Button Click
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_left_btns    timeout=5

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,-50    # Button
    Sleep    ${sleep_local}
    RPA.Desktop.Click

Graphics Tab HTML Editor Left Buttons Bar Click
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_left_btns    timeout=5

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,-25    # Bar object
    Sleep    ${sleep_local}
    RPA.Desktop.Click

Graphics Tab HTML Editor Left Buttons Left Align Click
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_left_btns    timeout=5

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,20    # Left align
    Sleep    ${sleep_local}
    RPA.Desktop.Click

Graphics Tab HTML Editor Left Buttons Center Align Click
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_left_btns    timeout=5

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,45    # Center align
    Sleep    ${sleep_local}
    RPA.Desktop.Click

Graphics Tab HTML Editor Left Buttons Right Align Click
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_left_btns    timeout=5

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,70    # Right align
    Sleep    ${sleep_local}
    RPA.Desktop.Click

Graphics Tab HTML Editor Left Buttons Custom Align Click
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_left_btns    timeout=5

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,95    # Custom align
    Sleep    ${sleep_local}
    RPA.Desktop.Click

Graphics Tab HTML Editor Left Buttons To Front Click
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_left_btns    timeout=5

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,140    # To Front
    Sleep    ${sleep_local}
    RPA.Desktop.Click

Graphics Tab HTML Editor Left Buttons To Back Click
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_left_btns    timeout=5

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,165    # To Back
    Sleep    ${sleep_local}
    RPA.Desktop.Click

Graphics Tab HTML Editor Left Buttons Make Group Click
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_left_btns    timeout=5

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,210    # Make Group
    Sleep    ${sleep_local}
    RPA.Desktop.Click

Graphics Tab HTML Editor Left Buttons Break Group Click
    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_left_btns    timeout=5

    RPA.Desktop.Move Mouse    alias:FXE_main_graphics_tab_editor_left_btns
    RPA.Desktop.Move Mouse    offset:0,235    # Break Group
    Sleep    ${sleep_local}
    RPA.Desktop.Click


