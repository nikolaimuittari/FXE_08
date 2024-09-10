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

Resource            project_tab.resource
Resource            common.resource


*** Variables ***

${current_date}=    Get Current Date    result_format=%d.%m.%y
${button}    


*** Keywords ***

Modules Tab Select
                
    RPA.Desktop.Wait For Element    alias:FXE_main_modules_tab    timeout=10
    RPA.Desktop.Click    alias:FXE_main_modules_tab


Modules Tab Points Binding Argument-1
    [Arguments]    ${point_separator}

    RPA.Desktop.Wait For Element    alias:FXE_main_modules_tab_toolbar_btns    timeout=10    # Modules Tab toolbar buttons. Dims:   218*43
    RPA.Desktop.Move Mouse    alias:FXE_main_modules_tab_toolbar_btns
    RPA.Desktop.Click With Offset    x=84    y=0    action=click    # Resize button

    RPA.Desktop.Wait For Element    alias:FXE_main_modules_tab_COMBI_DI12_table    timeout=10    # Combi-36 DI12. Dims: 240*20
    
    RPA.Desktop.Wait For Element    alias:FXE_main_modules_tab_DI_type    timeout=10    # DI Point list table: Dims:
    RPA.Desktop.Move Mouse    alias:FXE_main_modules_tab_DI_type
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Mouse Button    left
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Move Mouse    alias:FXE_main_modules_tab_COMBI_DI12_table    # Combi36 DI module 
    RPA.Desktop.Move Mouse    offset:0,20
    RPA.Desktop.Release Mouse Button    left
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Wait For Element    alias:FXE_main_modules_tab_ALM_type    timeout=10    # DI Point list table: Dims:
    RPA.Desktop.Move Mouse    alias:FXE_main_modules_tab_ALM_type
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Mouse Button    left
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Move Mouse    alias:FXE_main_modules_tab_COMBI_DI12_table    # Combi36 DI module 
    RPA.Desktop.Move Mouse    offset:0,40
    RPA.Desktop.Release Mouse Button    left
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}



    RPA.Desktop.Wait For Element    alias:FXE_main_modules_tab_COMBI_DO8_table    timeout=10    # Modules Tab toolbar buttons. Dims:   218*43
    RPA.Desktop.Wait For Element    alias:FXE_main_modules_tab_DO_type    timeout=10    # DI Point list table: Dims:
    RPA.Desktop.Move Mouse    alias:FXE_main_modules_tab_DO_type
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Mouse Button    left
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Move Mouse    alias:FXE_main_modules_tab_COMBI_DO8_table
    RPA.Desktop.Move Mouse    offset:0,20
    RPA.Desktop.Release Mouse Button    left
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}



    RPA.Desktop.Wait For Element    alias:FXE_main_modules_tab_COMBI_AI8_table    timeout=10    # Modules Tab toolbar buttons. Dims:   218*43
    RPA.Desktop.Wait For Element    alias:FXE_main_modules_tab_AI_type    timeout=10    # DI Point list table: Dims:
    RPA.Desktop.Move Mouse    alias:FXE_main_modules_tab_AI_type
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Mouse Button    left
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Move Mouse    alias:FXE_main_modules_tab_COMBI_AI8_table
    RPA.Desktop.Move Mouse    offset:0,20
    RPA.Desktop.Release Mouse Button    left
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}


    RPA.Desktop.Wait For Element    alias:FXE_main_modules_tab_COMBI_AO8_table    timeout=10    # Modules Tab toolbar buttons. Dims:   218*43
    RPA.Desktop.Wait For Element    alias:FXE_main_modules_tab_AO_type    timeout=10    # DI Point list table: Dims:
    RPA.Desktop.Move Mouse    alias:FXE_main_modules_tab_AO_type
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Mouse Button    left
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Move Mouse    alias:FXE_main_modules_tab_COMBI_AO8_table
    RPA.Desktop.Move Mouse    offset:0,20
    RPA.Desktop.Release Mouse Button    left
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Move Mouse    alias:FXE_main_modules_tab_toolbar_btns
    RPA.Desktop.Click With Offset    x=84    y=0    action=click    # Resize button

    RPA.Desktop.Wait For Element    alias:FXE_main_modules_tab_all_ports_ddwn    timeout=10    # All ports drop-down    Dims: 227*28
    RPA.Desktop.Click With Offset    alias:FXE_main_modules_tab_all_ports_ddwn     x=-50    y=0    action=click
    FOR    ${counter}    IN RANGE    0    8
        RPA.Desktop.Press Keys    down    # 
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    END

    FOR    ${counter}    IN RANGE    0    8
        RPA.Desktop.Press Keys    up    # 
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    END
    
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    
    Check Communication Form And Confirm
    RPA.Desktop.Wait For Element    alias:FXE_main_modules_tab_all_ports_ddwn    timeout=10    # All ports drop-down    Dims: 227*28
    RPA.Desktop.Click With Offset    alias:FXE_main_modules_tab_all_ports_ddwn     x=0    y=0    action=doubleclick
    RPA.Desktop.Type Text    20
    RPA.Desktop.Press Keys    tab    # DI12 module address

    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Wait For Element    alias:FXE_main_modules_tab_all_ports_ddwn    timeout=10    # All ports drop-down    Dims: 227*28
    RPA.Desktop.Click With Offset    alias:FXE_main_modules_tab_all_ports_ddwn     x=0    y=0    action=doubleclick
    RPA.Desktop.Type Text    0
    RPA.Desktop.Press Keys    tab    # All module address

    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Wait For Element    alias:FXE_main_modules_tab_all_ports_ddwn    timeout=10    # All ports drop-down    Dims: 227*28
    RPA.Desktop.Click With Offset    alias:FXE_main_modules_tab_all_ports_ddwn     x=50    y=0    action=doubleclick
    RPA.Desktop.Type Text    M
    RPA.Desktop.Press Keys    tab    # All module address

    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Wait For Element    alias:FXE_main_modules_tab_all_ports_ddwn    timeout=10    # All ports drop-down    Dims: 227*28
    RPA.Desktop.Click With Offset    alias:FXE_main_modules_tab_all_ports_ddwn     x=50    y=0    action=doubleclick
    RPA.Desktop.Press Keys   delete
    RPA.Desktop.Press Keys    tab    # All module address
    
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}


Modules Tab Points Disconnect Argument-1
    [Arguments]    ${point_separator}
    RPA.Desktop.Wait For Element    alias:FXE_main_modules_tab_toolbar_btns    timeout=10    # Modules Tab toolbar buttons. Dims:   218*43
    # RPA.Desktop.Move Mouse    alias:FXE_main_modules_tab_toolbar_btns
    # RPA.Desktop.Click With Offset    x=84    y=0    action=click    # Resize button
    
    IF    ${point_separator} == 1
        RPA.Desktop.Move Mouse    alias:FXE_main_modules_tab_COMBI_DI12_table    # Combi36 DI module 
        RPA.Desktop.Move Mouse    offset:0,20
        RPA.Desktop.Click    action=rightclick    # Right button menu
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
        RPA.Desktop.Wait For Element    alias:FXE_main_modules_tab_left_panel_lmb_menu    timeout=10    # Right button menu Dims: 172*59
        RPA.Desktop.Click With Offset    alias:FXE_main_modules_tab_left_panel_lmb_menu    x=0    y=15    action=click    # Disconnect point
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    
    ELSE IF    ${point_separator} == 5
        RPA.Desktop.Move Mouse    alias:FXE_main_modules_tab_COMBI_DI12_table    # Combi36 DI module 
        RPA.Desktop.Move Mouse    offset:0,20
        RPA.Desktop.Click    action=rightclick    # Right button menu
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
        RPA.Desktop.Wait For Element    alias:FXE_main_modules_tab_left_panel_lmb_menu    timeout=10    # Right button menu Dims: 172*59
        RPA.Desktop.Click With Offset    alias:FXE_main_modules_tab_left_panel_lmb_menu    x=0    y=-15    action=click    # Select all points
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
        RPA.Desktop.Click    action=rightclick    # Right button menu
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
        RPA.Desktop.Click With Offset    alias:FXE_main_modules_tab_left_panel_lmb_menu    x=0    y=15    action=click    # Disconnect points
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
            
    ELSE
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    END