*** Settings ***
Documentation       Common resource file

Library             RPA.Desktop
Library             RPA.Windows
Library             OperatingSystem
Library             DateTime
Library             RPA.RobotLogListener
Library             RPA.Excel.Application
# Library             RPA.Dialogs


Resource            project_tab.resource
Resource            common.resource


*** Variables ***

${current_date}=    Get Current Date    result_format=%d.%m.%y
${button}    


*** Keywords ***

Fidelix Tab Select
    
    # Project Tab Communication Settings Subtab Arguments-4    10.100.1.198    3000C    demodemo    1
    #[Arguments]    ${ip_address}    ${plc_type}    ${ftp_passw}    ${connect}
        
    RPA.Desktop.Wait For Element    alias:FXE_main_fidelix_tab    timeout=10
    RPA.Desktop.Click    alias:FXE_main_fidelix_tab
        
    
Fidelix Tab Right Panel Connect Button Argument-1
    [Arguments]    ${connect}

    RPA.Desktop.Wait For Element    alias:FXE_main_fidelix_tab_leftpanel_btns    timeout=10
    IF    ${connect} == 1
        ${running_status}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_RUNNING_status_bar   timeout=5    # RUNNING status
        Log To Console    PLC already connected
        IF    ${running_status} == ${False}
                        
            RPA.Desktop.Wait For Element    alias:FXE_main_fidelix_tab_connect_resize_btns    timeout=5    # Fidelix Tab right panel connect/resize buttons. Dims: 96*48  center:48*24  
            RPA.Desktop.Move Mouse    alias:FXE_main_fidelix_tab_connect_resize_btns
            RPA.Desktop.Click With Offset    x=-20    y=0    action=click    # Connect button

            ${ssh_key_form}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_comm_subtab_ssh_key_form    timeout=10    # SSH key form
            IF    ${ssh_key_form}
                RPA.Desktop.Click    alias:FXE_main_OK_noicon_active_form_btn    action=click    # Ok click on SSH form     
            END

            Sleep    ${SLEEP_TIMEOUT_DEFAULT}
            RPA.Desktop.Click With Offset    x=40    y=0    action=click    # Resize button
            # Sleep    1s
        
        END 
    
        RPA.Desktop.Wait For Element    alias:FXE_main_RUNNING_status_bar    timeout=5     # Connection status Running
        Log To Console    PLC connected
    ELSE
        RPA.Desktop.Wait For Element    alias:FXE_main_fidelix_tab_connect_resize_btns_CONNECTED    timeout=10    # Fidleix Tab right panel connect/resize buttons. Dims: 96*48  center:48*24  
        RPA.Desktop.Move Mouse    alias:FXE_main_fidelix_tab_connect_resize_btns_CONNECTED
        RPA.Desktop.Click With Offset    x=-20    y=0    action=click    # Connect button
        RPA.Desktop.Wait For Element    alias:FXE_main_OFFLINE_status_bar    # Connection status Offline
        Log To Console    PLC disconnected
    END
    # RPA.Desktop.Wait For Element    alias:FXE_main_RUNNING_status_bar    # Connection status


Fidelix Tab Right Panel FX Folder Copy Argument-1
    [Arguments]    ${folder}
    RPA.Desktop.Wait For Element    alias:FXE_main_fidelix_tab_rightpanel_www_icon    timeout=10    # Fidelix Tab right panel www folder icon
    RPA.Desktop.Click    alias:FXE_main_fidelix_tab_rightpanel_www_icon    action=rightclick

    RPA.Desktop.Wait For Element    alias:FXE_main_fidelix_tab_rightpanel_rightbtn_menu    timeout=10    # Fidelix Tab right panel right button menu
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    down    #     Download menu
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    enter    # Return button
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}


Fidelix Tab Left Panel FX Folder Copy Argument-1
    [Arguments]    ${folder}
    RPA.Desktop.Wait For Element     alias:FXE_main_fidelix_tab_leftpanel_btns    timeout=10    # Left panel buttons
    RPA.Desktop.Click With Offset    alias:FXE_main_fidelix_tab_leftpanel_btns    x=135    y=0    action=click    # Resize button

    RPA.Desktop.Wait For Element    alias:FXE_main_fidelix_tab_leftpanel_www_icon    timeout=10    # Fidelix Tab right panel www folder icon
    RPA.Desktop.Click    alias:FXE_main_fidelix_tab_leftpanel_www_icon    action=rightclick

    RPA.Desktop.Wait For Element    alias:FXE_main_fidelix_tab_leftpanel_rightbtn_menu    timeout=10    # Fidelix Tab right panel right button menu
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    down    #     Download menu
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    enter    # Return button
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Wait For Element    alias:FXE_main_fidelix_tab_leftpanel_upload_form    timeout=10    # Upload files form    dims: 356*154  center:178*77 
    RPA.Desktop.Click With Offset    alias:FXE_main_fidelix_tab_leftpanel_upload_form    x=60    y=55    action=click    # Yes button

    # RPA.Desktop.Wait For Element    alias:FXE_main_WORKING_status_bar    timeout=10    # Working status
    # Sleep    15s
    RPA.Desktop.Wait For Element    alias:FXE_main_RUNNING_status_bar    timeout=25    # Running status
    

Fidelix Tab Left Panel FX Folder Upload Argument-1
    [Arguments]    ${folder}
    
    RPA.Desktop.Wait For Element    alias:FXE_main_fidelix_tab_leftpanel_www_icon    timeout=25    # Fidelix Tab right panel www folder icon
    RPA.Desktop.Click    alias:FXE_main_fidelix_tab_leftpanel_www_icon    action=click    # Folder select

    RPA.Desktop.Wait For Element    alias:FXE_main_fidelix_tab_leftpanel_btns    timeout=10    # Fidelix tab left panel buttons dims: 272*44    center: 136*22
    RPA.Desktop.Click With Offset    alias:FXE_main_fidelix_tab_leftpanel_btns    x=-110    y=0    action=click

    RPA.Desktop.Wait For Element    alias:FXE_main_fidelix_tab_leftpanel_upload_form    timeout=10    # Upload files form    dims: 356*154  center:178*77 
    # RPA.Desktop.Click With Offset    alias:FXE_main_fidelix_tab_leftpanel_upload_form    x=60    y=55    action=click    # Yes button
    # RPA.Desktop.Click    alias:FXE_main_YES_noicon_form_inactive_btn    action=click
    RPA.Desktop.Press Keys    tab
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    enter
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    #    ERROR MESSAGE 2.0.3.6beta (2023-10-23)
    # To get rid of this pressing enter key and commented the WORKING status waiting line
    RPA.Desktop.Press Keys    enter
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    # RPA.Desktop.Wait For Element    alias:FXE_main_WORKING_status_bar    timeout=10    # Working status
    
    RPA.Desktop.Wait For Element    alias:FXE_main_RUNNING_status_bar    timeout=25    # Running status


Upload To PLC Working-Running Status Waiting Argument-1
    [Arguments]    ${upload_time}
    FOR    ${counter}    IN RANGE    0    ${upload_time}
        ${running_status}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element   alias:FXE_main_RUNNING_status_bar    timeout=5    # RUNNING status
        Exit For Loop If    ${running_status}
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    END


Fidelix Tab Left Panel Backup PLC Argument-1    
    [Arguments]    ${backup}
    RPA.Desktop.Wait For Element    alias:FXE_main_fidelix_tab_leftpanel_btns    timeout=10    # Fidelix tab left panel buttons dims: 272*44    center: 136*22
    RPA.Desktop.Click With Offset    alias:FXE_main_fidelix_tab_leftpanel_btns    x=0    y=0    action=click    # Backup PLC button
    
    IF    ${backup}==5    # All checkboxes + OK button
        RPA.Desktop.Wait For Element    alias:FXE_main_fidelix_tab_backup_form    timeout=10    # Backup form dims: 414*300    center:207*150
        RPA.Desktop.Click With Offset    alias:FXE_main_fidelix_tab_backup_form     x=-175    y=-95    action=click   # Select All
        RPA.Desktop.Click With Offset    alias:FXE_main_fidelix_tab_backup_form     x=-175    y=-95    action=click   # Deselect all

        RPA.Desktop.Click With Offset    alias:FXE_main_fidelix_tab_backup_form     x=-175    y=-75    action=click   # Include BIN + subfolders
        RPA.Desktop.Click With Offset    alias:FXE_main_fidelix_tab_backup_form     x=-175    y=-45    action=click   # Include DATA + subfolders
        RPA.Desktop.Click With Offset    alias:FXE_main_fidelix_tab_backup_form     x=-175    y=-15    action=click   # Include WWW
        RPA.Desktop.Click With Offset    alias:FXE_main_fidelix_tab_backup_form     x=-175    y=15    action=click   # Include Symbol + subfolders
        RPA.Desktop.Click With Offset    alias:FXE_main_fidelix_tab_backup_form     x=-175    y=45    action=click   # Stop substation
        
        RPA.Desktop.Click With Offset    alias:FXE_main_fidelix_tab_backup_form     x=153    y=111    action=click   # OK button
        ${working_status}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element   alias:FXE_main_WORKING_status_bar    timeout=5    # WORKING status
        Run Keyword If    ${working_status}    Upload To PLC Working-Running Status Waiting Argument-1    60
        Log    "Backup from PLC complated"

    ELSE IF    ${backup}==6    # All checkboxes + CANCEL button
        RPA.Desktop.Wait For Element    alias:FXE_main_fidelix_tab_backup_form    timeout=10    # Backup form dims: 414*300    center:207*150
        RPA.Desktop.Click With Offset    alias:FXE_main_fidelix_tab_backup_form     x=-175    y=-83    action=click   # Include BIN + subfolders
        RPA.Desktop.Click With Offset    alias:FXE_main_fidelix_tab_backup_form     x=-175    y=-53    action=click   # Include DATA + subfolders
        RPA.Desktop.Click With Offset    alias:FXE_main_fidelix_tab_backup_form     x=-175    y=-23    action=click   # Include WWW
        RPA.Desktop.Click With Offset    alias:FXE_main_fidelix_tab_backup_form     x=-175    y=13    action=click   # Include Symbol + subfolders
        RPA.Desktop.Click With Offset    alias:FXE_main_fidelix_tab_backup_form     x=-175    y=43    action=click   # Stop substation
        
        RPA.Desktop.Click With Offset    alias:FXE_main_fidelix_tab_backup_form     x=153    y=143    action=click   # Cancel button
    ELSE
        RPA.Desktop.Click With Offset    alias:FXE_main_fidelix_tab_backup_form     x=153    y=143    action=click   # Cancel button
    END


Fidelix Tab Left Panel Buttons
    RPA.Desktop.Wait For Element    alias:FXE_main_fidelix_tab_leftpanel_btns    timeout=10    # Fidelix tab left panel buttons
    

Fidelix Tab Left Panel Watchdog
    RPA.Desktop.Wait For Element    alias:FXE_main_fidelix_tab_leftpanel_btns    timeout=10    # Fidelix tab left panel buttons dims: 272*44    center: 136*22
    RPA.Desktop.Click With Offset    alias:FXE_main_fidelix_tab_leftpanel_btns    x=55    y=0    action=click    # Watchdog button
    RPA.Desktop.Wait For Element    alias:FXE_main_fidelix_tab_notepad_watchdog_app    timeout=10    # Notepad app with Watchdog.txt file opened
    RPA.Desktop.Press Keys    alt   F4    # Close Notepad window
    Log    "Watchdog.txt has been downloaded from PLC"

Fidelix Tab Left Panel Add Files Argument-1
    [Arguments]    ${file_path}    # C:\QA\TestProjects\TestProject1234\Log.txt
    RPA.Desktop.Wait For Element    alias:FXE_main_fidelix_tab_leftpanel_btns    timeout=10    # Fidelix tab left panel buttons dims: 272*44    center: 136*22
    RPA.Desktop.Click With Offset    alias:FXE_main_fidelix_tab_leftpanel_btns    x=110    y=0    action=click    # Add files button

    RPA.Desktop.Wait For Element    alias:FXE_main_WIN_ADD_FILE_dialog_btns    timeout=10    # Winodws standard add files dialog window
    RPA.Desktop.Type Text    ${file_path}
    RPA.Desktop.Press Keys    enter
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    ${add_file_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_fidelix_tab_leftpanel_addfile_exists_form    timeout=10    # Add file exists form
    Run Keyword If    ${add_file_exists}    RPA.Desktop.Press Keys    enter    # Overwrite file
    Log    "File has been copied"
    