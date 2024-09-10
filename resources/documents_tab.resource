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

Documents Tab Select
                
    RPA.Desktop.Wait For Element    alias:FXE_main_documents_tab    timeout=10
    RPA.Desktop.Click    alias:FXE_main_documents_tab


Documents Tab New Folder Create And Delete

    RPA.Desktop.Wait For Element    alias:FXE_main_documents_tab_files_table    timeout=10    # Documents Tab file manager table. Dims:   412*26
    RPA.Desktop.Move Mouse    alias:FXE_main_documents_tab_files_table
    RPA.Desktop.Click With Offset    x=-100    y=0    action=click    # Name order

    RPA.Desktop.Click With Offset    x=100    y=0    action=click    # Size order

    RPA.Desktop.Click With Offset    x=80    y=0    action=click    # Type order
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click With Offset    x=80    y=0    action=click    # Modified order
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click With Offset    x=0    y=40    action=rightclick    # Right mouse menu
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Wait For Element    alias:FXE_main_documents_tab_right_mouse_menu    timeout=10    # Right mouse menu : Dims: 170*125
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click With Offset    alias:FXE_main_documents_tab_right_mouse_menu    x=0    y=50    action=click    # New folder
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Wait For Element    alias:FXE_main_documents_tab_new_folder_form    timeout=10    # New folder form

    RPA.Desktop.Type Text   _First_folder_1
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    enter
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Move Mouse    alias:FXE_main_documents_tab_files_table

    RPA.Desktop.Wait For Element    alias:FXE_main_documents_tab_folder_name_icon    timeout=10    # Created folder icon
    RPA.Desktop.Click With Offset    alias:FXE_main_documents_tab_folder_name_icon    x=0    y=0    action=rightclick    # Right mouse menu
    

    RPA.Desktop.Wait For Element    alias:FXE_main_documents_tab_right_mouse_menu    timeout=10    # Right mouse menu : Dims: 170*125

    RPA.Desktop.Click With Offset    alias:FXE_main_documents_tab_right_mouse_menu    x=0    y=0    action=click    # Delete
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Wait For Element    alias:FXE_main_documents_tab_delete_folder_form    timeout=10    # New folder form
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Click    alias:FXE_main_YES_noicon_form_inactive_btn    action=click
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

