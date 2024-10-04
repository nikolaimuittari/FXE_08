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
Library             RPA.JavaAccessBridge

#Resource            resources/project_tab.resource
#Resource            resources/common.resource
Resource            project_tab.resource
Resource            common.resource

*** Variables ***

${current_date}=    Get Current Date    result_format=%d.%m.%y
${button}    


*** Keywords ***

History Tab Select
                
    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab    timeout=10
    RPA.Desktop.Click    alias:FXE_main_history_tab
    

History Tab New History Group Create Agrument-1
    [Arguments]    ${group_name}

    RPA.Desktop.Wait For Element    alias:FXE_main_modules_tab_AI_icon    timeout=10    # AI point icon
    RPA.Desktop.Click With Offset    alias:FXE_main_modules_tab_AI_icon    x=0    y=0    action=click    # AI point select
    
    # X history if condition
    
    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_toolbar_history_btns    timeout=10    # History Toolbar buttons Dims:  150*47
    RPA.Desktop.Click With Offset    alias:FXE_main_history_tab_toolbar_history_btns    x=-50    y=0    action=click    # Add group button
    
    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_new_group_form    timeout=10    # New group form
    RPA.Desktop.Type Text    ${group_name}
    RPA.Desktop.Click    alias:FXE_main_OK_noicon_form_btn
        
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}


History Tab New History Group Create RMB Drag-n-Drop Argument-1
    [Arguments]    ${group_name}
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    Check Communication Form And Confirm

    RPA.Desktop.Wait For Element    alias:FXE_main_modules_tab_AI_icon    timeout=10    # AI point icon
    RPA.Desktop.Click With Offset    alias:FXE_main_modules_tab_AI_icon    x=0    y=0    action=click    # AI point select
    RPA.Desktop.Click    action=rightclick
    # RPA.Desktop.Click With Offset    alias:FXE_main_modules_tab_AI_icon    x=0    y=0    action=rightclick    # History point right button menu
        
    # Check Communication Form And Confirm

    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_points_rmb_menu    timeout=10    # RMB menu Dims:  187*87
    RPA.Desktop.Click With Offset    alias:FXE_main_history_tab_points_rmb_menu    x=0    y=0    action=click    # Create group menu item

    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_new_group_form    timeout=10    # New group form
    RPA.Desktop.Type Text    ${group_name}
    RPA.Desktop.Click    alias:FXE_main_OK_noicon_form_btn
 
    RPA.Desktop.Wait For Element    alias:FXE_main_modules_tab_AO_icon    timeout=10    # AO point icon
    RPA.Desktop.Move Mouse    alias:FXE_main_modules_tab_AO_icon   # AO point mouse move
    RPA.Desktop.Press Mouse Button    left    # Dragging the point

    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_point_id_table    timeout=10    # Point ID table
    RPA.Desktop.Move Mouse    alias:FXE_main_history_tab_point_id_table    # Moving to Point ID table
    RPA.Desktop.Move Mouse    offset:0,100    # Move mouse to the table cells
    RPA.Desktop.Release Mouse Button    Left    # Releasing the point

    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

History Tab Delete All Groups
    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_group_table    timeout=10    # History points table
    RPA.Desktop.Click With Offset    alias:FXE_main_history_tab_group_table     x=0    y=40    action=rightclick    # History table RMB menu
    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_groups_rmb_menu    timeout=10    # RMB menu
    RPA.Desktop.Click With Offset    alias:FXE_main_history_tab_groups_rmb_menu     x=0    y=-15    action=click    # Select all in History table RMB menu
    
    RPA.Desktop.Click With Offset    alias:FXE_main_history_tab_group_table     x=0    y=40    action=rightclick    # History table RMB menu
    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_groups_rmb_menu    timeout=10    # RMB menu
    RPA.Desktop.Click With Offset    alias:FXE_main_history_tab_groups_rmb_menu     x=0    y=15    action=click    # Delete in History table RMB menu
    
    RPA.Desktop.Wait For Element    alias:FXE_main_histroy_tab_group_delete_form    timeout=10    # Delete group form
    RPA.Desktop.Click    alias:FXE_main_YES_noicon_form_inactive_btn    # Yes button
    
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

History Tab Resize
    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_toolbar_report_btns    timeout=10    # Toolbar buttons (right)
    RPA.Desktop.Click With Offset    alias:FXE_main_history_tab_toolbar_report_btns    x=70    y=0    # Resize button


History Tab Report Form Wizard Create Argument-1
    [Arguments]    ${group_name}    
    History Tab Open Report Form
    
    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_report_editor_form    timeout=10    # Report editor form
    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_report_form_groups_sect    timeout=10    # Report form grpoups section

    RPA.Desktop.Click With Offset    alias:FXE_main_history_tab_report_form_groups_sect     x=-5    y=15    action=click    # Group/report wizard
    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_report_form_wizard    timeout=10    # Report form wizard

    RPA.Desktop.Type Text    ${group_name}
    RPA.Desktop.Press Keys    tab    # Report point drop-down
    RPA.Desktop.Press Keys    tab    # Years drop-down
    RPA.Desktop.Press Keys    down    # 2 drop-down
    RPA.Desktop.Press Keys    down    # 3 drop-down
    RPA.Desktop.Press Keys    down    # 4 drop-down
    RPA.Desktop.Press Keys    down    # 5 drop-down
    RPA.Desktop.Press Keys    tab    # Compare checkbox
    RPA.Desktop.Press Keys    space    # select
    RPA.Desktop.Press Keys    tab    # Monthly checkbox
    RPA.Desktop.Press Keys    space    # Monthly checkbox
    RPA.Desktop.Press Keys    tab    # Weekly checkbox
    RPA.Desktop.Press Keys    space    # Weekly checkbox
    RPA.Desktop.Press Keys    tab    # Daily checkbox
    RPA.Desktop.Press Keys    space    # Daily checkbox
    RPA.Desktop.Press Keys    tab    # Hourly checkbox
    RPA.Desktop.Press Keys    space    # Hourly checkbox
    RPA.Desktop.Press Keys    tab    # OK button
    RPA.Desktop.Press Keys    enter    # OK button

    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

History Tab Open Report Form
    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_toolbar_report_btns    timeout=10    # Toolbar buttons (right)
    RPA.Desktop.Click With Offset    alias:FXE_main_history_tab_toolbar_report_btns    x=-70    y=0    # Report editor button
    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_report_editor_form    timeout=10    # Report editor form

History Tab Report Form Group Create Agrument-1
    [Arguments]    ${group_name}
    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_report_form_groups_sect    timeout=10    # Report form groups section
    RPA.Desktop.Click With Offset    alias:FXE_main_history_tab_report_form_groups_sect     x=-60    y=15    action=click    # Add Group/report button
    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_new_group_form    timeout=10    # New group form
    RPA.Desktop.Type Text    ${group_name}
    RPA.Desktop.Click    alias:FXE_main_OK_noicon_form_btn

History Tab Report Form Delete Selected Group
    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_report_form_groups_sect    timeout=10    # Report form groups section
    RPA.Desktop.Click With Offset    alias:FXE_main_history_tab_report_form_groups_sect     x=-33    y=15    action=click    # Delete Group button
    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_report_form_group_delete_form    timeout=10    # Delete group form
    RPA.Desktop.Click    alias:FXE_main_YES_noicon_form_inactive_btn

History Tab Report Form Report Create
    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_report_form_reports_sect    timeout=10    # Report section
    RPA.Desktop.Click With Offset    alias:FXE_main_history_tab_report_form_reports_sect    x=-100    y=15    action=click     # Add report 

History Tab Report Form Report Delete
    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_report_form_reports_sect    timeout=10    # Report section
    RPA.Desktop.Click With Offset    alias:FXE_main_history_tab_report_form_reports_sect    x=-70    y=15    action=click     # Delete report 
    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_report_form_report_delete_form    timeout=10    # Report delete form
    RPA.Desktop.Click    alias:FXE_main_YES_noicon_form_inactive_btn

    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

History Tab Report Form Report Wizard
    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_report_form_reports_sect    timeout=10    # Report section
    RPA.Desktop.Click With Offset    alias:FXE_main_history_tab_report_form_reports_sect    x=-55    y=15    action=click     # Wizard report 
    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_report_form_report_wizard    timeout=10    # Report wizard form
    
    RPA.Desktop.Press Keys    tab    # Monthly checkbox
    RPA.Desktop.Press Keys    space    # Monthly checkbox
    RPA.Desktop.Press Keys    tab    # Weekly checkbox
    RPA.Desktop.Press Keys    space    # Weekly checkbox
    RPA.Desktop.Press Keys    tab    # Daily checkbox
    RPA.Desktop.Press Keys    space    # Daily checkbox
    RPA.Desktop.Press Keys    tab    # Hourly checkbox
    RPA.Desktop.Press Keys    space    # Hourly checkbox
    RPA.Desktop.Press Keys    tab    # OK button
    RPA.Desktop.Press Keys    enter    # OK button

    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    

History Tab Report Form Column Create Arguments-6
    [Arguments]    ${column_type}    ${units}    ${decimals}    ${header}    ${graph}    ${compare_columns}
    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_report_form_columns_sect    timeout=10    # Column properties Dims: 263*46
    RPA.Desktop.Click With Offset    alias:FXE_main_history_tab_report_form_columns_sect    x=-120    y=10    action=click     # Add column button

    RPA.Desktop.Click With Offset    alias:FXE_main_history_tab_report_form_columns_sect    x=-100    y=60    action=click     # Report type ddwn
    FOR    ${counter}    IN RANGE    0    ${column_type}
        RPA.Desktop.Press Keys    down
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    END
    RPA.Desktop.Press Keys    enter

    RPA.Desktop.Press Keys    tab    # Unit ddwn
    FOR    ${counter}    IN RANGE    0    ${units}
        RPA.Desktop.Press Keys    down
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    END

    # RPA.Desktop.Press Keys    tab 
    RPA.Desktop.Press Keys    tab    # Decimals ddwn
    FOR    ${counter}    IN RANGE    0    ${decimals}
        RPA.Desktop.Press Keys    down
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    END
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab    # Column header
    RPA.Desktop.Type Text    ${header}
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab    # Graph chekbox
    IF    ${graph} == 1
        RPA.Desktop.Press Keys    space    # Graph chekbox
    END
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab    # Compare columns
    RPA.Desktop.Type Text    ${compare_columns}
    RPA.Desktop.Press Keys    tab    #
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    

History Tab Report Form Normalize Change
    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_report_form_normalize_sect    timeout=10    # Normalize section
    RPA.Desktop.Click With Offset    alias:FXE_main_history_tab_report_form_normalize_sect    x=-40    y=23    action=doubleclick    # Ratio field
    RPA.Desktop.Type Text    2.0
    RPA.Desktop.Press Keys    tab    # Formula ddwn
    RPA.Desktop.Press Keys    down    # Formula 2 select
    RPA.Desktop.Press Keys    tab    # Day/Degree values ddwn
    # RPA.Desktop.Press Keys    down    # Region selection

    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_report_form_normalize_sect_month_table    timeout=10    # Month value table
    RPA.Desktop.Click With Offset    alias:FXE_main_history_tab_report_form_normalize_sect_month_table    x=0    y=10    action=click     # Jan value cell
    # RPA.Desktop.Press Keys    tab    # Month/value table
    # RPA.Desktop.Press Keys    down    # Jan value cell
    RPA.Desktop.Type Text    1    # Jan value
    RPA.Desktop.Press Keys    down    # Feb value cell
    RPA.Desktop.Type Text    2    # Feb value
    RPA.Desktop.Press Keys    down    # Mar value cell
    RPA.Desktop.Type Text    3    # Mar value
    RPA.Desktop.Press Keys    down    # Apr value cell
    RPA.Desktop.Type Text    4    # Apr value
    RPA.Desktop.Press Keys    down    # May value cell
    RPA.Desktop.Type Text    5    # May value
    RPA.Desktop.Press Keys    down    # Jun value cell
    RPA.Desktop.Type Text    6    # Jun value
    RPA.Desktop.Press Keys    down    # Jul value cell
    RPA.Desktop.Type Text    7    # Jul value
    RPA.Desktop.Press Keys    down    # Aug value cell
    RPA.Desktop.Type Text    8    # Aug value
    RPA.Desktop.Press Keys    down    # Sep value cell
    RPA.Desktop.Type Text    9    # Sep value
    RPA.Desktop.Press Keys    down    # Oct value cell
    RPA.Desktop.Type Text    10    # Oct value
    RPA.Desktop.Press Keys    down    # Nov value cell
    RPA.Desktop.Type Text    11    # Nov value
    RPA.Desktop.Press Keys    down    # Dec value cell
    RPA.Desktop.Type Text    12    # Dec value
     

History Tab Report Form Close Without Saving
    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_report_editor_form    timeout=10    # Report editor form
    RPA.Desktop.Click    alias:FXE_main_CANCEL_form_btn    # Cancel button 
    
History Tab Report Form Close Saving
    RPA.Desktop.Wait For Element    alias:FXE_main_history_tab_report_editor_form    timeout=10    # Report editor form
    RPA.Desktop.Click    alias:FXE_main_OK_form_btn    # OK button 