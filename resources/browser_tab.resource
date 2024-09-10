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


*** Keywords ***

Browser Tab Select
    
    # Project Tab Communication Settings Subtab Arguments-4    10.100.1.198    3000C    demodemo    1
    #[Arguments]    ${ip_address}    ${plc_type}    ${ftp_passw}    ${connect}
        
    RPA.Desktop.Wait For Element    alias:FXE_main_browser_tab    timeout=10
    RPA.Desktop.Click    alias:FXE_main_browser_tab
        


Browser Tab Home Button Argument-1
    [Arguments]    ${plc_type}
    RPA.Desktop.Wait For Element    alias:FXE_main_browser_tab_toolbar_btns    timeout=10    # Browser Tab buttons. Dims:   156*44
    RPA.Desktop.Move Mouse    alias:FXE_main_browser_tab_toolbar_btns
    RPA.Desktop.Click With Offset    x=-50    y=0    action=click    # Home Connect button
    # FXE Browser window

    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    
    IF    ${plc_type} == 9
        RPA.Desktop.Wait For Element    alias:FXE_main_browser_tab_FX3000C_html   timeout=10     # Connection for FX3000C
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    ELSE IF     ${plc_type} == 11   
        RPA.Desktop.Wait For Element    alias:FXE_main_browser_tab_FX3000Xusername_html    timeout=50     # Connection for FX3000C
    ELSE
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    END
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    # RPA.Windows.Close Current Window

    RPA.Desktop.Wait For Element    alias:FXE_main_browser_tab_toolbar_btns    timeout=10    # Browser Tab buttons. Dims:   156*44
    RPA.Desktop.Move Mouse    alias:FXE_main_browser_tab_toolbar_btns
    RPA.Desktop.Click With Offset    x=0    y=0    action=click    # Default Browser Connect button
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    
    # RPA.Windows.Maximize Window
    # RPA.Windows.Send Keys    {WIN up}
    # RPA.Desktop.Press Keys    windows    up     # Maximize browser window

    IF    ${plc_type} == 9
        RPA.Desktop.Wait For Element    alias:FXE_main_browser_tab_FX3000C_html   timeout=10     # Connection for FX3000C
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    ELSE IF     ${plc_type} == 11    
        RPA.Desktop.Wait For Element    alias:FXE_main_browser_tab_FX3000Xusername_html    timeout=10     # Connection for FX3000C
    ELSE
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    END
    
    RPA.Desktop.Wait For Element    alias:FXE_main_browser_tab_external_browser_win    timeout=10    # External browser(Chrome) control icons: Dims: 167*32
    RPA.Desktop.Click With Offset   alias:FXE_main_browser_tab_external_browser_win     x=72    y=0    action=click 
    # Closing Chrome 

    # RPA.Desktop.Press Keys    ctrl    F4     # Close browser window
    
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Wait For Element    alias:FXE_main_browser_tab_toolbar_btns    timeout=10    # Browser Tab buttons. Dims:   156*44
    RPA.Desktop.Move Mouse    alias:FXE_main_browser_tab_toolbar_btns
    RPA.Desktop.Click With Offset    x=50    y=0    action=click    # Internal Browser Connect button
    # Internal browser window
       
    # RPA.Windows.Maximize Window
    # RPA.Windows.Send Keys    {WIN up}
    # RPA.Desktop.Press Keys    windows    up     # Maximize browser window
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    
    RPA.Desktop.Wait For Element    alias:FXE_main_browser_tab_internal_browser_win    timeout=10    # Internal browser (Edge) control icons: Dims: 222*31    
    RPA.Desktop.Click With Offset   alias:FXE_main_browser_tab_internal_browser_win     x=90    y=0    action=click 
    # Closing internal Edge



    # RPA.Desktop.Press Keys    ctrl    F4     # Close browser window
