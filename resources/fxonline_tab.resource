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
${button}    


*** Keywords ***

Fxonline Tab Select
                
    RPA.Desktop.Wait For Element    alias:FXE_main_fxonline_tab    timeout=10
    RPA.Desktop.Click    alias:FXE_main_fxonline_tab
    
Fxonline Tab Resize
    RPA.Desktop.Wait For Element    alias:FXE_main_fxonline_tab_toolbar_noconn_btn    timeout=10    # Toolbar buttons. NOT connected
    RPA.Desktop.Click With Offset    alias:FXE_main_fxonline_tab_toolbar_noconn_btn    x=25    y=0    action=Click    # Resize button

Fxonline Tab Connect-Disconnect
    ${running_status}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_fxonline_tab_toolbar_conn_btn   timeout=5    # Toolbar buttons. CONNECTED
    
    IF    ${running_status}
        Log To Console    PLC is already connected
        RPA.Desktop.Wait For Element    alias:FXE_main_fxonline_tab_toolbar_conn_btn    timeout=10    # Toolbar buttons. CONNECTED
        RPA.Desktop.Click With Offset    alias:FXE_main_fxonline_tab_toolbar_conn_btn    x=-25    y=0    action=Click    # Click on Connect button to disconnect
        
        RPA.Desktop.Wait For Element    alias:FXE_main_fxonline_tab_toolbar_noconn_btn   timeout=5    # OFFLINE status
        Log To Console    PLC is disconnected
    END

    RPA.Desktop.Wait For Element    alias:FXE_main_fxonline_tab_toolbar_noconn_btn    timeout=10    # Toolbar buttons. NOT connected
    RPA.Desktop.Click With Offset    alias:FXE_main_fxonline_tab_toolbar_noconn_btn    x=-25    y=0    action=Click    # Connect button
    
    RPA.Desktop.Wait For Element    alias:FXE_main_fxonline_tab_toolbar_conn_btn    timeout=10    # Toolbar buttons. CONNECTED
    RPA.Desktop.Click With Offset    alias:FXE_main_fxonline_tab_toolbar_conn_btn    x=-25    y=0    action=Click    # Connect button
    Log To Console    PLC is connected
    
    #    RPA.Desktop.Wait For Element    alias:FXE_main_modules_tab_AI_icon    timeout=15    # AI icon symbol
    
    RPA.Desktop.Wait For Element     alias:FXE_main_fxonline_tab_toolbar_noconn_btn    timeout=10    # Toolbar buttons. NOT Connected
    Log To Console    PLC is disconnected