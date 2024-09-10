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

Resource            resources/project_tab.resource
Resource            resources/common.resource


*** Variables ***

${current_date}=    Get Current Date    result_format=%d.%m.%y
${button}    


*** Keywords ***

Label List Tab Select
        
        
    RPA.Desktop.Wait For Element    alias:FXE_main_label_list_tab    timeout=10
    RPA.Desktop.Click    alias:FXE_main_label_list_tab

Label List Tab Label Settings Section Arguments-5
    # [Arguments]    ${point_separator}    ${label_separator}    ${labelrow_1}    ${labelrow_2}    ${labelrow_3}
    RPA.Desktop.Wait For Element    alias:FXE_main_label_tab_label_settings_sect    timeout=10    # Label settings section
    RPA.Desktop.Click With Offset    alias:FXE_main_label_tab_label_settings_sect     x=-32    y=-76    action=doubleclick    # Point separator field  

Label List Save List To File Arguments-5
    [Arguments]    ${point_separator}    ${label_separator}    ${labelrow_1}    ${labelrow_2}    ${labelrow_3}
    RPA.Desktop.Wait For Element    alias:FXE_main_label_tab_toolbar_btns    timeout=10    # Label list Tab toolbar buttons. Dims:   154*45
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Move Mouse    alias:FXE_main_label_tab_toolbar_btns
    RPA.Desktop.Click With Offset    x=50    y=0    action=click    # Refresh labels button
   
    # Label List Tab Label Settings Section Arguments-5
    
    RPA.Desktop.Press Keys    tab    # Point separator field
    RPA.Desktop.Press Keys    ctrl    a
    RPA.Desktop.Press Keys    delete
    RPA.Desktop.Type Text    ${point_separator}
    

    RPA.Desktop.Press Keys    tab    # Label separator field
    RPA.Desktop.Press Keys    ctrl    a
    RPA.Desktop.Press Keys    delete
    RPA.Desktop.Type Text    ${label_separator}

    RPA.Desktop.Press Keys    tab    # separator radio button
    # RPA.Desktop.Press Keys    down    # Line separator radio button

    RPA.Desktop.Press Keys    tab    # Labelrow 1 field
    RPA.Desktop.Press Keys    ctrl    a
    RPA.Desktop.Press Keys    delete
    RPA.Desktop.Type Text    ${labelrow_1}

    RPA.Desktop.Press Keys    tab    # Labelrow 2 checkbox

    RPA.Desktop.Press Keys    space    # Labelrow 2 checkbox select  

    RPA.Desktop.Press Keys    tab    # Labelrow 2 field
    RPA.Desktop.Press Keys    ctrl    a
    RPA.Desktop.Press Keys    delete
    RPA.Desktop.Type Text    ${labelrow_2}

    RPA.Desktop.Press Keys    tab    # Labelrow 3 checkbox
    RPA.Desktop.Press Keys    space    # Labelrow 3 checkbox select
   
    RPA.Desktop.Press Keys    tab    # Labelrow 3 field
    RPA.Desktop.Press Keys    ctrl    a
    RPA.Desktop.Press Keys    delete
    RPA.Desktop.Type Text    ${labelrow_3}

    RPA.Desktop.Press Keys    tab    # Only points checked for labels checkbox

    RPA.Desktop.Press Keys    space    # Only points checked for labels checkbox select

    RPA.Desktop.Press Keys    space    # Only points checked for labels checkbox de-select

    RPA.Desktop.Press Keys    tab    # Only linked points checkbox

    RPA.Desktop.Press Keys    space    # Only linked points checkbox select

    RPA.Desktop.Press Keys    space    # Only linked points checkbox de-select

    RPA.Desktop.Move Mouse    alias:FXE_main_label_tab_toolbar_btns
    RPA.Desktop.Click With Offset    x=50    y=0    action=click    # Refresh labels button

    RPA.Desktop.Move Mouse    alias:FXE_main_label_tab_toolbar_btns
    RPA.Desktop.Click With Offset    x=-50    y=0    action=click    # Save label list to file button
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    ${random_number}=    Evaluate    random.randint(10000, 99999)
    ${random_number}=    Convert To String    ${random_number}
    RPA.Desktop.Wait For Element    alias:FXE_main_label_tab_file_save_form    timeout=10    # Windows file save form
    RPA.Desktop.Type Text    ${random_number}
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    enter     # Saving file with random name
    
    # Excel saving is not possible due to MS license

    # RPA.Desktop.Move Mouse    alias:FXE_main_label_tab_toolbar_btns
    # RPA.Desktop.Click With Offset    x=0    y=0    action=click    # Excel export button

    # RPA.Desktop.Wait For Element    alias:FXE_main_label_tab_excel_task_icon    timeout=10    # Excel icon in the Windows taskbar
    # RPA.Desktop.Click    alias:FXE_main_label_tab_excel_task_icon    action=click

    # #    Sleep    2s
    # RPA.Desktop.Wait For Element    alias:FXE_main_label_tab_excel_signin_window    timeout=20    # Excel Sign in Windows taskbar
    # RPA.Desktop.Press Keys    esc     # 

    # RPA.Desktop.Wait For Element    alias:FXE_main_label_tab_excel_window    timeout=10    # Excel Windows taskbar
    # Sleep    3s 
    # RPA.Desktop.Press Keys    ctrl     f4     # 
