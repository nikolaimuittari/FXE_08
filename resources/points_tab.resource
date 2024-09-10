*** Settings ***
Documentation       Common resource file

Library             RPA.Desktop
Library             RPA.Windows
Library             OperatingSystem
Library             DateTime
Library             RPA.RobotLogListener
Library             RPA.Excel.Application
Library             RPA.Browser.Selenium


Resource            common.resource
Resource            points_tab_point_edit.resource


*** Variables ***
#${FXEditor_app}             c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe
#${FXE_TEST_PROJECTS_FOLDER_PATH}    c:\\QA\\TestProjects
#${FXE_TEST_PROJECT_PATH}    c:\\QA\\TestProjects\\${TEST_PROJECT_NAME}
#${FXE_TEST_PROJECT_FILENAME_PATH}    ${FXE_TEST_PROJECT_PATH}\\${TEST_PROJECT_NAME}.fxp
#${EXCEPTION_SCREENSHOT_PATH}    c:\\QA\RoboCorp\\FXE_01\\exception_images
#${TEST_PROJECT_NAME}    TestProject1234
${current_date}=    Get Current Date    result_format=%d.%m.%y
${button}    


*** Keywords ***

Points Tab Select
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab    timeout=10
    RPA.Desktop.Click    alias:FXE_main_points_tab
    
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_add_btn    timeout=10    # Waiting for Points Tab Add+Upload butttons
    RPA.Desktop.Highlight Elements    alias:FXE_main_points_tab_add_btn

Points Tab Select Filter Create All Kinds Of Points
    
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab    timeout=10
    RPA.Desktop.Click    alias:FXE_main_points_tab
    # Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    
    # FXE_main_points_tab_filter_edit_btn
    # FXE_main_points_tab_filter_select_dropdown

    # RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_select_filter_dropdown    # "Select filter" dropdown. Dims: 115*41    central: 57*20
    # RPA.Desktop.Click With Offset    x=49    y=0    action=click    # Text field offset  
    # Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_filter_edit_btn    # "Edit filter" icon. 
    RPA.Desktop.Click With Offset    x=-40    y=0    action=click    # Filter dropdown 

    RPA.Desktop.Press Keys    down    # "Default" filter select
    RPA.Desktop.Press Keys    enter    # Select filter 
    # Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    # "Adding new points" button
    RPA.Desktop.Click    alias:FXE_main_points_tab_add_btn    # "Add point" button
    # Sleep    ${SLEEP_TIMEOUT_DEFAULT}
 

    # Waiting for "Add points" form
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_add_points_form    timeout=10    # Add point form. Dim: 392*488, center: 196*244
    
    # Add points form
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_add_points_form    # Moving to the form's center    
    RPA.Desktop.Click With Offset    x=-134    y=-172    action=doubleclick    # Pointname text field
    RPA.Desktop.Type Text    TE01    # TE01 pointname
    # RPA.Desktop.Press Keys    tab    # Text field
    
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_add_points_form    # Moving to the form's center
    RPA.Desktop.Click With Offset    x=-149    y=-127    action=doubleclick    # Point text text field
    RPA.Desktop.Type Text    TE01 point text     # Point text
    # RPA.Desktop.Press Keys    Tab    # 
    
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_add_points_form    # Moving to the form's center
    RPA.Desktop.Click With Offset    x=-52    y=-53    action=Click    # Alarm #1 checkbox

    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_add_points_form    # Moving to the form's center
    RPA.Desktop.Click With Offset    x=31    y=-53    action=Click    # Alarm #2 checkbox

    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_add_points_form    # Moving to the form's center
    RPA.Desktop.Click With Offset    x=118    y=-53    action=Click    # Alarm #3 checkbox
    
    
    # RPA.Desktop.Click With Offset    x=-8    y=-53    action=Click    # Alarm #1 Text field
    # RPA.Desktop.Click With Offset    x=80    y=-53    action=Click    # Alarm #2 Text field
    # RPA.Desktop.Click With Offset    x=162    y=-53    action=Click    # Alarm #3 Text field
    
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_add_points_form    # Moving to the form's center
    RPA.Desktop.Click With Offset    x=-52    y=-23    action=click    # DI indication #1 checkbox

    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_add_points_form    # Moving to the form's center
    RPA.Desktop.Click With Offset    x=31    y=-23    action=click    # DI indication #2 checkbox
    
    # RPA.Desktop.Click With Offset    x=-8    y=-23    action=Click    # DI Indication #1 Text field
    # RPA.Desktop.Click With Offset    x=80    y=-23    action=Click    # DI Indication #2 Text field

    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_add_points_form    # Moving to the form's center
    RPA.Desktop.Click With Offset    x=-52    y=5    action=click    # DO digital output #1 checkbox
    
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_add_points_form    # Moving to the form's center
    RPA.Desktop.Click With Offset    x=31    y=5    action=click    # DO digital output #2 checkbox

    # RPA.Desktop.Click With Offset    x=-8    y=5    action=Click    # DO digital output #1 Text field
    # RPA.Desktop.Click With Offset    x=80    y=5    action=Click    # DO digital output #2 Text field

    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_add_points_form    # Moving to the form's center
    RPA.Desktop.Click With Offset    x=-52    y=36    action=click    # Measurement checkbox

    # RPA.Desktop.Click With Offset    x=-8    y=36    action=Click    # Measurement Text field

    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_add_points_form    # Moving to the form's center
    RPA.Desktop.Click With Offset    x=-52    y=65    action=click    # AO point checkbox

    # RPA.Desktop.Click With Offset    x=-8    y=65    action=Click    # AO point Text field
    
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_add_points_form    # Moving to the form's center
    RPA.Desktop.Click With Offset    x=-52    y=91    action=click    # Control point checkbox

    # RPA.Desktop.Click With Offset    x=-8    y=91    action=Click    # Control point Text field

    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_add_points_form    # Moving to the form's center
    RPA.Desktop.Click With Offset    x=-52    y=118    action=click    # Time schedule point checkbox

    # RPA.Desktop.Click With Offset    x=-8    y=118    action=Click    # Time schedule point Text field
    
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_add_points_form    # Moving to the form's center
    RPA.Desktop.Click With Offset    x=-52    y=149    action=click    # Lookup table point checkbox

    # RPA.Desktop.Click With Offset    x=-8    y=149    action=Click    # Lookup table point Text field
    
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_add_points_form    # Moving to the form's center
    RPA.Desktop.Click With Offset    x=-8    y=179    action=Click    # Filter dropdown list

    # Filter checkbox is checked by default.
    # Uncheck
    # Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    # RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_add_points_form    # Moving to the form's center
    # RPA.Desktop.Click With Offset    x=-52    y=179    action=click    # Filter dropdown list checkbox

    # 
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_add_points_form    # Moving to the form's center
    RPA.Desktop.Click With Offset    x=-52    y=177    action=click    # Filter dropdown list checkbox

    RPA.Desktop.Click

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_add_points_form    # Moving to the form's center
    # Adding points button
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click    alias:FXE_main_ADD_points_form_btn    action=click     # ADD points form button
    
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click    alias:FXE_main_CLOSE_points_form_btn    action=click    # CLOSE points form button 

Point Tab Select Filter Delete All Points

    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab    timeout=10
    RPA.Desktop.Click    alias:FXE_main_points_tab
    
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_filter_edit_btn    # "Edit filter" icon. 
    RPA.Desktop.Click With Offset    x=-40    y=0    action=click    # Filter dropdown 

    RPA.Desktop.Press Keys    down    # "Default" filter select
    RPA.Desktop.Press Keys    enter    # Select filter 

    ${pointfilter_active}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_pointfilter_active_btn
    IF    ${pointfilter_active}==${True}
        RPA.Desktop.Click    alias:FXE_main_points_tab_pointfilter_active_btn     
    END

    Points Tab Left Panel First Line Right Button Menu
    RPA.Desktop.Click With Offset    x=0    y=-10    action=click     # Select all feature

    Points Tab Left Panel First Line Right Button Menu
    RPA.Desktop.Click With Offset    x=0    y=-35    action=click     # Delete feature

    Wait For Element    alias:FXE_main_points_tab_delete_points_form    timeout=10    # Delete confirmation message
    RPA.Desktop.Click    alias:FXE_main_YES_noicon_form_btn

    Splash Screen Check

Button Press Upload Selected Points To PLC
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_add_upload_btn    timeout=10    # Add + Upload SELECTED buttons locator. Dims:  102*44 center: 51*22
    
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_add_upload_btn    # Moving to the form's center
    RPA.Desktop.Click With Offset    x=25    y=0    action=click    # Upload points to PLC button click

    ${ssh_key_form}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_comm_subtab_ssh_key_form    timeout=10    # SSH key form
    IF    ${ssh_key_form}
        RPA.Desktop.Click    alias:FXE_main_OK_noicon_active_form_btn    action=click    # Ok click on SSH form     
    END

    ${connection_failed_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_connection_failed_form    timeout=10
    Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_connection_failed_form
    Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Click    alias:FXE_main_more_information_drop_btn   # Connection failed form information button
    Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Click    alias:FXE_main_OK_noicon_form_btn   # Connection failed form OK

    ${terminal_failed_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_comm_terminal_err_form    timeout=10
    Run Keyword If    ${terminal_failed_form_exists}    RPA.Desktop.Click With Offset    alias:FXE_main_project_tab_comm_terminal_err_form    x=120     y=50    action=click

    ${escftp_failed_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_escftperror_form    timeout=10
    Run Keyword If    ${escftp_failed_form_exists}    RPA.Desktop.Click With Offset    alias:FXE_main_points_tab_escftperror_form    x=120     y=50    action=click


Button Press Upload Selected Points To PLC Arguments-1
    [Arguments]    ${upload}
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_add_upload_btn    timeout=10    # Add + Upload SELECTED buttons locator. Dims:  102*44 center: 51*22
    
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_add_upload_btn    # Moving to the form's center
    IF    ${upload} == 1
        RPA.Desktop.Click With Offset    x=25    y=0    action=click    # Upload points to PLC button click

        ${ssh_key_form}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_comm_subtab_ssh_key_form    timeout=10    # SSH key form
        IF    ${ssh_key_form}
            RPA.Desktop.Click    alias:FXE_main_OK_noicon_active_form_btn    action=click    # Ok click on SSH form     
        END


        ${connection_failed_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_connection_failed_form    timeout=10
        Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_connection_failed_form
        Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Click    alias:FXE_main_more_information_drop_btn   # Connection failed form information button
        Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Click    alias:FXE_main_OK_noicon_form_btn   # Connection failed form OK
    END
    

Button Press Upload Displayed Points To PLC
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_upload_displayed_btn    timeout=10    # Upload DISPLAYED points locator.
    
    RPA.Desktop.Click    alias:FXE_main_points_tab_upload_displayed_btn    # Upload Displayed points to PLC button click

    ${ssh_key_form}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_comm_subtab_ssh_key_form    timeout=10    # SSH key form
    IF    ${ssh_key_form}
        RPA.Desktop.Click    alias:FXE_main_OK_noicon_active_form_btn    action=click    # Ok click on SSH form     
    END

    ${connection_failed_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_connection_failed_form    timeout=10
    Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_connection_failed_form
    Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Click    alias:FXE_main_more_information_drop_btn   # Connection failed form information button
    Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Click    alias:FXE_main_OK_noicon_form_btn   # Connection failed form OK

    ${terminal_failed_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_comm_terminal_err_form    timeout=10
    Run Keyword If    ${terminal_failed_form_exists}    RPA.Desktop.Click With Offset    alias:FXE_main_project_tab_comm_terminal_err_form    x=120     y=50    action=click

    ${escftp_failed_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_escftperror_form    timeout=10
    Run Keyword If    ${escftp_failed_form_exists}    RPA.Desktop.Click With Offset    alias:FXE_main_points_tab_escftperror_form    x=120     y=50    action=click



Button Press Upload Displayed Points To PLC Arguments-1
    [Arguments]    ${upload}
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_upload_displayed_btn    timeout=10    # Upload DISPLAYED points locator.
    
    IF    ${upload} == 1
        
        RPA.Desktop.Click    alias:FXE_main_points_tab_upload_displayed_btn    # Upload Displayed points to PLC button click
        
        ${ssh_key_form}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_comm_subtab_ssh_key_form    timeout=10    # SSH key form
        IF    ${ssh_key_form}
            RPA.Desktop.Click    alias:FXE_main_OK_noicon_active_form_btn    action=click    # Ok click on SSH form     
        END

        ${connection_failed_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_connection_failed_form    timeout=10
        Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_connection_failed_form
        Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Click    alias:FXE_main_more_information_drop_btn   # Connection failed form information button
        Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Click    alias:FXE_main_OK_noicon_form_btn   # Connection failed form OK
    END


Button Press Upload Changed Points To PLC
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_upload_changed_btn    timeout=10    # Upload CHANGED points locator.
    
    RPA.Desktop.Click    alias:FXE_main_points_tab_upload_changed_btn
    
    ${ssh_key_form}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_comm_subtab_ssh_key_form    timeout=10    # SSH key form
    IF    ${ssh_key_form}
        RPA.Desktop.Click    alias:FXE_main_OK_noicon_active_form_btn    action=click    # Ok click on SSH form     
    END

    ${connection_failed_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_connection_failed_form    timeout=10
    Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_connection_failed_form
    Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Click    alias:FXE_main_more_information_drop_btn   # Connection failed form information button
    Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Click    alias:FXE_main_OK_noicon_form_btn   # Connection failed form OK

    ${terminal_failed_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_comm_terminal_err_form    timeout=10
    Run Keyword If    ${terminal_failed_form_exists}    RPA.Desktop.Click With Offset    alias:FXE_main_project_tab_comm_terminal_err_form    x=120     y=50    action=click

    ${escftp_failed_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_escftperror_form    timeout=10
    Run Keyword If    ${escftp_failed_form_exists}    RPA.Desktop.Click With Offset    alias:FXE_main_points_tab_escftperror_form    x=120     y=50    action=click



Button Press Upload Changed Points To PLC Arguments-1
    [Arguments]    ${upload}
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_upload_changed_btn    timeout=10    # Upload CHANGED points locator.
    IF    ${upload} == 1
        RPA.Desktop.Click    alias:FXE_main_points_tab_upload_changed_btn
        
        ${ssh_key_form}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_comm_subtab_ssh_key_form    timeout=10    # SSH key form
        IF    ${ssh_key_form}
            RPA.Desktop.Click    alias:FXE_main_OK_noicon_active_form_btn    action=click    # Ok click on SSH form     
        END

        ${connection_failed_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_connection_failed_form    timeout=10
        Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_connection_failed_form
        Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Click    alias:FXE_main_more_information_drop_btn   # Connection failed form information button
        Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Click    alias:FXE_main_OK_noicon_form_btn   # Connection failed form OK
    END


State Text Edit Form
    [Arguments]    ${saving}
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_state_text_upload_btn    timeout=10    # State text edit button locator.
    
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_state_text_upload_btn    # State text edit button locator.
    RPA.Desktop.Click With Offset    x=-25    y=0    action=click    # State text EDIT FORM button

    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_statetext_edit_form    timeout=10    # State text edit form locator. Dims: 527*643  center: 264*322
    RPA.Desktop.Click With Offset    x=-202    y=-184    action=click    # Textgroup name first line

    ${repeats}    Set Variable    29    # Number of repeats
    FOR    ${index}    IN RANGE    1    ${repeats}
        RPA.Desktop.Press Keys    down
    END    

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_statetext_edit_form    # State text edit form locator.
    RPA.Desktop.Click With Offset    x=-202    y=-183    action=doubleclick    # DOUBLECLICK Textgroup name first line
    RPA.Desktop.Type Text    TEST_STATE_TEXT
    RPA.Desktop.Press Keys    tab

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_statetext_edit_form    # State text edit form locator.
    RPA.Desktop.Click With Offset    x=27    y=-183    action=doubleclick    # DOUBLECLICK Textgroup right panel VALUE first line
    RPA.Desktop.Type Text    999
    RPA.Desktop.Press Keys    tab

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_statetext_edit_form    # State text edit form locator.
    RPA.Desktop.Click With Offset    x=56    y=-183    action=doubleclick    # DOUBLECLICK Textgroup right panel TEXT first line
    RPA.Desktop.Type Text    STATE text 999
    RPA.Desktop.Press Keys    tab

    # Synchronize checkbox
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_statetext_edit_form    # State text edit form locator.
    RPA.Desktop.Click With Offset    x=-247    y=304    action=click    # Checkbox click
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_statetext_edit_form    # State text edit form locator.
    RPA.Desktop.Click With Offset    x=-247    y=304    action=click    # Checkbox click
    
    IF    $saving == "save"
        RPA.Desktop.Click    alias:FXE_main_OK_form_btn    # OK button (Round)
    ELSE
        RPA.Desktop.Click    alias:FXE_main_CANCEL_form_active_btn    # CANCEL button
    END
    # RPA.Desktop.Click    alias:FXE_main_OK_form_btn    # OK button (Round)
    # RPA.Desktop.Click    alias:FXE_main_CANCEL_form_active_btn    # CANCEL button

Alarm Group Edit Form
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_alarmgroup_upload_btn    timeout=10    # Alarmgroup edit button locator.

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_alarmgroup_upload_btn    # Alarmgroup edit button locator.
    RPA.Desktop.Click With Offset    x=-25    y=0    action=click    # Alarmgroup EDIT FORM button

    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_alarmgroup_edit_form    timeout=10    # Alarmgroup edit form locator. Dims: 696*593 center: 348*297
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_alarmgroup_edit_form    # Alarmgroup edit form locator.
    RPA.Desktop.Click With Offset    x=-306    y=-203    action=click    # Alarm groups panel, Name column, 1st line. Alarmgroup EDIT FORM
    RPA.Desktop.Press Keys    F2
    RPA.Desktop.Type Text    ALARM_A    # Alarm group name

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_alarmgroup_edit_form    # Alarmgroup edit form locator.
    RPA.Desktop.Click With Offset    x=112    y=-188    action=click    # Time schedule drop-down Alarmgroup EDIT FORM
    RPA.Desktop.Press Keys    down    # Select time schedule
    RPA.Desktop.Press Keys    enter    # Select time schedule

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_alarmgroup_edit_form    # Alarmgroup edit form locator.
    RPA.Desktop.Click With Offset    x=249    y=-188    action=doubleclick    # Time schedule priority digital field. Alarmgroup EDIT FORM
    RPA.Desktop.Type Text    1    # Priority set

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_alarmgroup_edit_form    # Alarmgroup edit form locator.
    RPA.Desktop.Click With Offset    x=232    y=-149    action=click    # Time schedule syncronization select. Alarmgroup EDIT FORM
    # RPA.Desktop.Click With Offset    x=232    y=-149    action=click    # Time schedule syncronization select. Alarmgroup EDIT FORM

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_alarmgroup_edit_form    # Alarmgroup edit form locator.
    RPA.Desktop.Click With Offset    x=-296    y=-42    action=click    # Alarmdevice name cell. Alarmgroup EDIT FORM
    RPA.Desktop.Press Keys    F2
    RPA.Desktop.Type Text    EMAIL_ALARM    # Alarm group name
    
    # EMail alarm device
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_alarmgroup_edit_form    # Alarmgroup edit form locator.
    RPA.Desktop.Click With Offset    x=96    y=20    action=click    # Email address. Alarmgroup EDIT FORM
    RPA.Desktop.Type Text    email@email.email    # Email address

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_alarmgroup_edit_form    # Alarmgroup edit form locator.
    RPA.Desktop.Click With Offset    x=245    y=20    action=click    # Server drop-down. Alarmgroup EDIT FORM
    RPA.Desktop.Press Keys    down    # Select time schedule
    RPA.Desktop.Press Keys    down    # Select time schedule
    RPA.Desktop.Press Keys    down    # Select time schedule
    RPA.Desktop.Press Keys    down    # Select time schedule
    RPA.Desktop.Press Keys    enter    # Select time schedule

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_alarmgroup_edit_form    # Alarmgroup edit form locator.
    RPA.Desktop.Click With Offset    x=165    y=60    action=click    # Template drop-down. Alarmgroup EDIT FORM
    RPA.Desktop.Press Keys    down    # Select time schedule
    RPA.Desktop.Press Keys    down    # Select time schedule
    RPA.Desktop.Press Keys    down    # Select time schedule
    RPA.Desktop.Press Keys    down    # Select time schedule
    RPA.Desktop.Press Keys    enter    # Select time schedule

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_alarmgroup_edit_form    # Alarmgroup edit form locator.
    RPA.Desktop.Click With Offset    x=25    y=105    action=click    # Acknowlwdge select. Alarmgroup EDIT FORM
    
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_alarmgroup_edit_form    # Alarmgroup edit form locator.
    RPA.Desktop.Click With Offset    x=130    y=105    action=click    # LockState select. Alarmgroup EDIT FORM

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_alarmgroup_edit_form    # Alarmgroup edit form locator.
    RPA.Desktop.Click With Offset    x=25    y=120    action=click    # State 0 select. Alarmgroup EDIT FORM

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_alarmgroup_edit_form    # Alarmgroup edit form locator.
    RPA.Desktop.Click With Offset    x=130    y=120    action=click    # State 4 select. Alarmgroup EDIT FORM
    
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_alarmgroup_edit_form    # Alarmgroup edit form locator.
    RPA.Desktop.Click With Offset    x=235    y=120    action=click    # State 8 select. Alarmgroup EDIT FORM

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_alarmgroup_edit_form    # Alarmgroup edit form locator.
    RPA.Desktop.Click With Offset    x=130    y=140    action=click    # State 5 select. Alarmgroup EDIT FORM

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_alarmgroup_edit_form    # Alarmgroup edit form locator.
    RPA.Desktop.Click With Offset    x=130    y=155    action=click    # State 6 select. Alarmgroup EDIT FORM

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_alarmgroup_edit_form    # Alarmgroup edit form locator.
    RPA.Desktop.Click With Offset    x=130    y=175    action=click    # State 7 select. Alarmgroup EDIT FORM

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_alarmgroup_edit_form    # Alarmgroup edit form locator.
    RPA.Desktop.Click With Offset    x=25    y=140    action=click    # State 1 select. Alarmgroup EDIT FORM

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_alarmgroup_edit_form    # Alarmgroup edit form locator.
    RPA.Desktop.Click With Offset    x=25    y=155    action=click    # State 2 select. Alarmgroup EDIT FORM

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_alarmgroup_edit_form    # Alarmgroup edit form locator.
    RPA.Desktop.Click With Offset    x=25    y=175    action=click    # State 0 select. Alarmgroup EDIT FORM

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_alarmgroup_edit_form    # Alarmgroup edit form locator.
    RPA.Desktop.Click With Offset    x=235    y=140    action=click    # State 9 select. Alarmgroup EDIT FORM

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_alarmgroup_edit_form    # Alarmgroup edit form locator.
    RPA.Desktop.Click With Offset    x=235    y=155    action=click    # State 10 select. Alarmgroup EDIT FORM

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_alarmgroup_edit_form    # Alarmgroup edit form locator.
    RPA.Desktop.Click With Offset    x=235    y=175    action=click    # State 11 select. Alarmgroup EDIT FORM


    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_alarmgroup_edit_form    # Alarmgroup edit form locator.
    RPA.Desktop.Click With Offset    x=15    y=205    action=click    # Syncronize select. Alarmgroup EDIT FORM
    
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_alarmgroup_edit_form    # Alarmgroup edit form locator.
    RPA.Desktop.Click With Offset    x=120    y=205    action=click    # Open picture select. Alarmgroup EDIT FORM
    
    # RPA.Desktop.Click    alias:FXE_main_SAVE_form_btn 
    RPA.Desktop.Click    alias:FXE_main_CANCEL_form_btn
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    esc

    #RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_alarmgroup_edit_form_save_form  timeout=10    # Save settings form Dims: 352*149 center: 175*75 
    #RPA.Desktop.Move Mouse    alias:fxe_main_points_tab_alarmgroup_edit_form_save_form
    #RPA.Desktop.Click With Offset    x=140    y=60    action=click    # No button

    #${save_before_closing}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:fxe_main_points_tab_alarmgroup_edit_form_save_form  timeout=10    # Save settings form Dims: 352*149 center: 175*75   
    #Run Keyword If    ${save_before_closing}    RPA.Desktop.Move Mouse    alias:fxe_main_points_tab_alarmgroup_edit_form_save_form
    #Run Keyword If    ${save_before_closing}    RPA.Desktop.Click With Offset    x=140    y=60    action=click    # No button

Button Press Upload Alarmgroup To PLC
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_alarmgroup_upload_btn    timeout=10    # Upload ALARMGROUP points locator.

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_alarmgroup_upload_btn    # Moving to the center of ALARMGROUP points locator
    RPA.Desktop.Click With Offset    x=25    y=0    action=click    # Upload Alarmgroup button click

    ${ssh_key_form}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_comm_subtab_ssh_key_form    timeout=10    # SSH key form
    IF    ${ssh_key_form}
        RPA.Desktop.Click    alias:FXE_main_OK_noicon_active_form_btn    action=click    # Ok click on SSH form     
    END


    ${connection_failed_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_connection_failed_form    timeout=10
    Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_connection_failed_form
    Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Click    alias:FXE_main_more_information_drop_btn   # Connection failed form information button
    Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Click    alias:FXE_main_OK_noicon_form_btn   # Connection failed form OK

    ${terminal_failed_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_comm_terminal_err_form    timeout=10
    Run Keyword If    ${terminal_failed_form_exists}    RPA.Desktop.Click With Offset    alias:FXE_main_project_tab_comm_terminal_err_form    x=120     y=50    action=click

    ${escftp_failed_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_escftperror_form    timeout=10
    Run Keyword If    ${escftp_failed_form_exists}    RPA.Desktop.Click With Offset    alias:FXE_main_points_tab_escftperror_form    x=120     y=50    action=click



Button Press Upload Alarmgroup To PLC Arguments-1
    [Arguments]    ${upload}
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_alarmgroup_upload_btn    timeout=10    # Upload ALARMGROUP points locator.

    IF    ${upload} == 1
        RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_alarmgroup_upload_btn    # Moving to the center of ALARMGROUP points locator
        RPA.Desktop.Click With Offset    x=25    y=0    action=click    # Upload Alarmgroup button click

        ${ssh_key_form}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_comm_subtab_ssh_key_form    timeout=10    # SSH key form
        IF    ${ssh_key_form}
            RPA.Desktop.Click    alias:FXE_main_OK_noicon_active_form_btn    action=click    # Ok click on SSH form     
        END

        ${connection_failed_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_connection_failed_form    timeout=10
        Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_connection_failed_form
        Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Click    alias:FXE_main_more_information_drop_btn   # Connection failed form information button
        Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Click    alias:FXE_main_OK_noicon_form_btn   # Connection failed form OK
        
        Check Communication Form And Confirm

    END


Button Press Upload State Text To PLC
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_state_text_upload_btn    timeout=10    # Upload STATETEXT points locator.

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_state_text_upload_btn    # Moving to the center of STATETEXT points locator
    RPA.Desktop.Click With Offset    x=25    y=0    action=click    # Upload Statetext button click

    Check Communication Form And Confirm

    ${ssh_key_form}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_comm_subtab_ssh_key_form    timeout=10    # SSH key form
    IF    ${ssh_key_form}
        RPA.Desktop.Click    alias:FXE_main_OK_noicon_active_form_btn    action=click    # Ok click on SSH form     
    END

    ${connection_failed_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_connection_failed_form    timeout=10
    Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_connection_failed_form
    Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Click    alias:FXE_main_more_information_drop_btn   # Connection failed form information button
    Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Click    alias:FXE_main_OK_noicon_form_btn   # Connection failed form OK

    ${terminal_failed_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_comm_terminal_err_form    timeout=10
    Run Keyword If    ${terminal_failed_form_exists}    RPA.Desktop.Click With Offset    alias:FXE_main_project_tab_comm_terminal_err_form    x=120     y=50    action=click

    ${escftp_failed_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_escftperror_form    timeout=10
    Run Keyword If    ${escftp_failed_form_exists}    RPA.Desktop.Click With Offset    alias:FXE_main_points_tab_escftperror_form    x=120     y=50    action=click



Button Press Upload State Text To PLC Arguments-1
    [Arguments]    ${upload}
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_state_text_upload_btn    timeout=10    # Upload STATETEXT points locator.

    Check Communication Form And Confirm


    IF    ${upload} == 1
        RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_state_text_upload_btn    # Moving to the center of STATETEXT points locator
        RPA.Desktop.Click With Offset    x=25    y=0    action=click    # Upload Statetext button click

        ${ssh_key_form}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_comm_subtab_ssh_key_form    timeout=10    # SSH key form
        IF    ${ssh_key_form}
            RPA.Desktop.Click    alias:FXE_main_OK_noicon_active_form_btn    action=click    # Ok click on SSH form     
        END

        ${connection_failed_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_connection_failed_form    timeout=10
        Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_connection_failed_form
        Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Click    alias:FXE_main_more_information_drop_btn   # Connection failed form information button
        Run Keyword If    ${connection_failed_form_exists}    RPA.Desktop.Click    alias:FXE_main_OK_noicon_form_btn   # Connection failed form OK
    END



Button Press Points Panel Resize
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_resize_btn    timeout=10    # Alarmgroup+Upload+Resize buttons locator

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_resize_btn    # Moving to center of Alarmgroup+Upload+Resize buttons locator
    RPA.Desktop.Click With Offset    x=52    y=0    action=click    # Resize Button click

Left Panel Resize
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_panel_resize    # Panel resize locator
    RPA.Desktop.Press Mouse Button    button=left    # Pressing left button
    RPA.Desktop.Move Mouse    offset:-100,0    # Move offset
    RPA.Desktop.Release Mouse Button    button=left     # Release left button

Left Panel Auto Resize Button
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_left_autoresize_btn    timeout=10    # Left panel auto resize button
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_left_autoresize_btn    # Left Panel resize button locator
    RPA.Desktop.Click With Offset    x=25    y=0    action=click    # Auto resize button


Right Panel Auto Resize Button
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_right_autoresize_btn    timeout=10    # Right panel auto resize button
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_right_autoresize_btn    # Left Panel resize button locator
    RPA.Desktop.Click With Offset    x=25    y=0    action=click    # Auto resize button


Points Right Panel Button Bar Import Undeclared Points Button
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_right_panel_btn_bar    timeout=10   # Points tab right panel button bar
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_right_panel_btn_bar    # Right panel button bar locator. Dims: 410*44    Center: 205*22
    RPA.Desktop.Click With Offset    x=-130    y=0    action=click    # Import undeclared points

Points Right Panel Button Bar Resize All Columns Button
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_right_panel_btn_bar    timeout=10   # Points tab right panel button bar
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_right_panel_btn_bar    # Right panel button bar locator. Dims: 410*44    Center: 205*22
    RPA.Desktop.Click With Offset    x=180    y=0    action=click    # Resize all columns

Points Right Panel Button Bar Filter Drop-down
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_right_panel_btn_bar    timeout=10   # Points tab right panel button bar
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_right_panel_btn_bar    # Right panel button bar locator. Dims: 410*44    Center: 205*22
    RPA.Desktop.Click With Offset    x=0    y=0    action=click    # Filter drop-down
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    enter

Points Right Panel Button Bar Refresh Button
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_right_panel_btn_bar    timeout=10   # Points tab right panel button bar
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_right_panel_btn_bar    # Right panel button bar locator. Dims: 410*44    Center: 205*22
    RPA.Desktop.Click With Offset    x=-180    y=0    action=click     # Refresh button
    
    #RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_right_panel_btn_bar    # Right panel button bar locator. Dims: 410*44    Center: 205*22
    #RPA.Desktop.Click With Offset    x=-130    y=0    action=click    # Import undeclared points
    
    #RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_right_panel_btn_bar    # Right panel button bar locator. Dims: 410*44    Center: 205*22
    #RPA.Desktop.Click With Offset    x=180    y=0    action=click    # Resize all columns

    #RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_right_panel_btn_bar    # Right panel button bar locator. Dims: 410*44    Center: 205*22
    #RPA.Desktop.Click With Offset    x=0    y=0    action=click    # Filter drop-down
    #RPA.Desktop.Press Keys    down
    #RPA.Desktop.Press Keys    enter

Points Right Panel Button Bar Add Filter Button
    Points Right Panel Button Bar Resize All Columns Button
    #RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_right_panel_btn_bar    timeout=10   # Points tab right panel button bar

    RPA.Desktop.Click    alias:FXE_main_points_tab_addfilter_btn    # Add filter button
    #RPA.Desktop.Click    # Add filter button
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_addfilter_name_form    timeout=10    # Add filter name form
    RPA.Desktop.Type Text    NewFilter
    RPA.Desktop.Press Keys    enter
    ${add_filter_saving_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_addfilter_saving_exists_form    timeout=10s    # Add filter save form -> file exists form
    #Run Keyword If    ${add_filter_saving_form_exists}    RPA.Desktop.Click    alias:FXE_main_YES_noicon_active_form_btn    # YES button
    #Run Keyword If    ${add_filter_saving_form_exists}    Log To Console    *** Add filter saving form exists
    #Run Keyword If    ${add_filter_saving_form_exists}    RPA.Desktop.Press Keys    enter
    IF    ${add_filter_saving_form_exists}
        RPA.Desktop.Click    alias:FXE_main_YES_noicon_active_form_btn    # YES button
        Log To Console    *** Add filter saving form exists
    ELSE
        RPA.Desktop.Press Keys    enter
        Log To Console    *** FAILED Add filter saving form exists
    END


Points Right Panel Button Bar Copy Selected Filter
    Points Right Panel Button Bar Resize All Columns Button
    #RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_right_panel_btn_bar    timeout=10   # Points tab right panel button bar
    RPA.Desktop.Click    alias:FXE_main_points_tab_copyfilter_btn    # Copy filter button
    #RPA.Desktop.Click    # Copy filter button
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_copyfilter_name_form    timeout=10    # Add filter name form
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Type Text    NewFilter_2
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    enter
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    ${copy_filter_saving_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_addfilter_saving_exists_2_form    timeout=10s     # Add filter save form -> file exists form
    IF    ${copy_filter_saving_form_exists}
        RPA.Desktop.Click    alias:FXE_main_YES_noicon_under_form_btn    # YES button
        Log To Console     *** Copy Filter saving form exists
    ELSE
        RPA.Desktop.Press Keys    tab
        RPA.Desktop.Press Keys    enter
        Log To Console    *** FAILED Copy filter saving form exists
    END


Points Right Panel Import Filter Edit Form
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_right_panel_btn_bar    timeout=10   # Points tab right panel button bar
    
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_right_panel_btn_bar    # Right panel button bar locator. Dims: 410*44    Center: 205*22
    RPA.Desktop.Click With Offset    x=0    y=0    action=click    # Filter drop-down
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    enter

    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_importpoint_settings_btn    timeout=10   # Points tab right panel button bar
    RPA.Desktop.Click    alias:FXE_main_points_tab_importpoint_settings_btn    # Right panel Import point settings button
    # Sleep    4s
    
    # Point types walkthrough
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_import_filter_form    timeout=10    # Import filetr edit form. Dims: 792*610    center: 400*300 
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_import_filter_form
    RPA.Desktop.Click With Offset    x=-270    y=-210    action=click    # Point type drop-down (Alarm is first in the list)
    RPA.Desktop.Click
    # RPA.Desktop.Press Keys    down    # Indication
    # RPA.Desktop.Press Keys    down    # Digital out
    # RPA.Desktop.Press Keys    down    # Analog in
    # RPA.Desktop.Press Keys    down    # Analog out
    # RPA.Desktop.Press Keys    down    # Control point
    # RPA.Desktop.Press Keys    down    # Time schedule
    # RPA.Desktop.Press Keys    down    # Lookup table

    # RPA.Desktop.Press Keys    up    # Lookup table
    # RPA.Desktop.Press Keys    up    # Time schedule
    # RPA.Desktop.Press Keys    up    # Control point
    # RPA.Desktop.Press Keys    up    # Analog out
    # RPA.Desktop.Press Keys    up    # Analog in
    # RPA.Desktop.Press Keys    up    # Digital out
    # RPA.Desktop.Press Keys    up    # Indication
    
    # RPA.Desktop.Press Keys    up    # Alarm

    # RPA.Desktop.Press Keys    enter    # Alarm selection
    #Sleep    1s

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_import_filter_form
    RPA.Desktop.Click With Offset    x=-270    y=-92    action=click    # Suffix Add button
    RPA.Desktop.Type Text    ALM
    RPA.Desktop.Press Keys    enter
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    Points Right Panel Import Filter Edit Form Suffix Exists Form Submit
    
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_import_filter_form
    RPA.Desktop.Click With Offset    x=-218    y=-213    action=click    # Defaults first checkbox
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click

    #Sleep    1s
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_import_filter_form
    RPA.Desktop.Click With Offset    x=-110    y=-150    action=click    # Defaults drop-down
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    # RPA.Desktop.Press Keys    down    # 1
    # RPA.Desktop.Press Keys    down    # 2
    # RPA.Desktop.Press Keys    down    # 3
    RPA.Desktop.Type Text    ALM
    RPA.Desktop.Press Keys    enter    # 4

    

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_import_filter_form
    RPA.Desktop.Click With Offset    x=-50    y=285    action=click    # Update Global filter checkbox
    #Sleep   1s

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_import_filter_form
    RPA.Desktop.Click With Offset    x=-50    y=285    action=click    # Update Global filter checkbox
    #Sleep   1s

    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_import_filter_form
    RPA.Desktop.Click With Offset    x=350    y=290    action=click    # OK button
    # RPA.Desktop.Click With Offset    x=220    y=290    action=click    # Cancel button

Points Right Panel Import Filter Edit Form Save
    ${importfilter_save_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_importfilter_form_save_form    timeout=10    # Importfilter save form
    Run Keyword If     ${importfilter_save_form_exists}    RPA.Desktop.Click    alias:FXE_main_YES_noicon_form_btn    # Saving form
    
Points Right Panel Import Filter Edit Form NO Save
    ${importfilter_save_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_importfilter_form_save_form    timeout=10    # Importfilter save form
    Run Keyword If     ${importfilter_save_form_exists}    RPA.Desktop.Click    alias:FXE_main_NO_noicon_form_btn    # Not Saving form
    
Points Right Panel Import Filter Edit Form Suffix Exists Form Submit
    ${importfilter_suffix_exists_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_importfilter_suffix_exists_form    timeout=10    # Importfilter suffix exists form. Dims: 350*102  center: 175*60 
    Run Keyword If     ${importfilter_suffix_exists_form_exists}    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_importfilter_suffix_exists_form    # Importfilter suffix exists form.
    Run Keyword If     ${importfilter_suffix_exists_form_exists}    RPA.Desktop.Click With Offset   x=125    y=40    action=click    # OK button form 

Points Filter Name Filter Field Select
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_pointfilter_bar    timeout=10    # Ponts filter lower bar. Dims: 525*30 center: 263*15
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_bar
    RPA.Desktop.Click With Offset    x=-200    y=0    action=click    # Name field
    RPA.Desktop.Type Text    _M    # Name to filter
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_bar    # Point filter bar
    RPA.Desktop.Click With Offset    x=-70    y=0    action=click    # Point Filter button
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click

Points Filter Name Filter Field Deselect
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_pointfilter_bar    timeout=10    # Ponts filter lower bar. Dims: 525*30 center: 263*15
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_bar
    
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_bar    # Point filter bar
    RPA.Desktop.Click With Offset    x=-70    y=0    action=click    # Point Filter button
    

Points Filter Name Filter Field Select Argument-1
    [Arguments]    ${text}
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_pointfilter_bar    timeout=10    # Ponts filter lower bar. Dims: 525*30 center: 263*15
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_bar
    RPA.Desktop.Click With Offset    x=-200    y=0    action=click    # Name field
    RPA.Desktop.Press Keys    ctrl   a     # Select all
    RPA.Desktop.Type Text    ${text}    # Name to filter
    
    #RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_bar    # Point filter bar
    #RPA.Desktop.Click With Offset    x=-70    y=0    action=click    # Point Filter  select
    
    ${pointfilter_active}=    Run Keyword And Return Status    Wait For Element    alias:FXE_main_points_tab_pointfilter_inactive_btn    timeout=5    # Active pointfilter
    IF    ${pointfilter_active}
        RPA.Desktop.Click    alias:FXE_main_points_tab_pointfilter_inactive_btn       
    END

    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    # RPA.Desktop.Click


Points Filter Name Filter Clear And De-Select
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_pointfilter_bar    timeout=10    # Ponts filter lower bar. Dims: 525*30 center: 263*15
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_bar
    RPA.Desktop.Click With Offset    x=-200    y=0    action=click    # Name field
    RPA.Desktop.Press Keys    ctrl   a     # Select all
    RPA.Desktop.Press Keys    delete     # Select all
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_pointfilter_bar    timeout=10 
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_bar    # Point filter bar
    RPA.Desktop.Click With Offset    x=-70    y=0    action=click    # Point Filter  select
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}


Points Filter Point Type Filter
    #RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_pointfilter_bar    timeout=10    # Ponts filter lower bar. Dims: 525*30 center: 263*15
    #RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_bar    # Point filter bar
    #RPA.Desktop.Click With Offset    x=25    y=0    action=click    # All points drop-down

    #RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_bar_type_dd    # Drop-down arrow. Dims: 61*25
    #RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_dd_items    # Drop-down arrow. Dims: 61*25

    #RPA.Desktop.Click With Offset    x=-25    y=0    action=click    # Arrow click
    #RPA.Desktop.Press Keys    up     # pressing up key to keep the list visible
   
    
    #RPA.Desktop.Wait For Element    alias:FXE_points_tab_pointfilter_dd_items    timeout=10    # Point types Drop-down items. Dims: 197*389 center: 99*195
    #RPA.Desktop.Move Mouse    alias:FXE_points_tab_pointfilter_dd_items    # Point types Drop-down items
    #RPA.Desktop.Click With Offset    x=0    y=-180    action= click    # All points select

    #RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_bar    # Point filter bar
    #RPA.Desktop.Click With Offset    x=25    y=0    action=click    # All points drop-down

    #RPA.Desktop.Move Mouse    alias:FXE_points_tab_pointfilter_dd_items    # Point types Drop-down items
    #RPA.Desktop.Click With Offset    x=0    y=-140    action=click    # ALARM points select
    
    #RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_pointfilter_POINTS_dd    timeout=10
    #RPA.Desktop.Move Mouse    alias:FX_main_points_tab_pointfilter_POINTS_dd    # Point filter bar activated drop-down with "points" word Dims:47*12
    #RPA.Desktop.Click With Offset    x=17    y=0    action=click
        
    #RPA.Desktop.Move Mouse     point:365,932    # Drop-down arrow
    #RPA.Desktop.Click
    #RPA.Desktop.Click With Offset    x=-120    y=0    action=click    # Arrow for points drop-down

    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_pointfilter_POINTS_dd    timeout=10
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_POINTS_dd    # Point filter bar activated drop-down with "points" word Dims:47*12
    RPA.Desktop.Click With Offset    x=17    y=0    action=click

    RPA.Desktop.Wait For Element    alias:FXE_points_tab_pointfilter_dd_items    timeout=10
    RPA.Desktop.Move Mouse    alias:FXE_points_tab_pointfilter_dd_items    # Point types Drop-down items
    RPA.Desktop.Click With Offset    x=0    y=-180    action=click    # ALL points select




    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_pointfilter_POINTS_dd    timeout=25
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_POINTS_dd    # Point filter bar activated drop-down with "points" word Dims:47*12
    RPA.Desktop.Click With Offset    x=17    y=0    action=click

    RPA.Desktop.Wait For Element    alias:FXE_points_tab_pointfilter_dd_items    timeout=10
    RPA.Desktop.Move Mouse    alias:FXE_points_tab_pointfilter_dd_items    # Point types Drop-down items
    RPA.Desktop.Click With Offset    x=0    y=-140    action=click    # ALARM points select




    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_pointfilter_POINTS_dd    # Point filter bar activated drop-down with "points" word Dims:47*12
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_POINTS_dd    # Point filter bar activated drop-down with "points" word Dims:47*12
    RPA.Desktop.Click With Offset    x=17    y=0    action=click

    RPA.Desktop.Wait For Element    alias:FXE_points_tab_pointfilter_dd_items    timeout=10
    RPA.Desktop.Move Mouse    alias:FXE_points_tab_pointfilter_dd_items    # Point types Drop-down items
    RPA.Desktop.Click With Offset    x=0    y=-90    action=click     # DI points select



    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_pointfilter_POINTS_dd    timeout=10
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_POINTS_dd    # Point filter bar activated drop-down with "points" word Dims:47*12
    RPA.Desktop.Click With Offset    x=17    y=0    action=click

    RPA.Desktop.Wait For Element    alias:FXE_points_tab_pointfilter_dd_items    timeout=10
    RPA.Desktop.Move Mouse    alias:FXE_points_tab_pointfilter_dd_items    # Point types Drop-down items
    RPA.Desktop.Click With Offset    x=0    y=-50    action=click    # ALARM + DI points select

    

    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_pointfilter_POINTS_dd    timeout=10
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_POINTS_dd    # Point filter bar activated drop-down with "points" word Dims:47*12
    RPA.Desktop.Click With Offset    x=17    y=0    action=click

    RPA.Desktop.Wait For Element    alias:FXE_points_tab_pointfilter_dd_items    timeout=10
    RPA.Desktop.Move Mouse    alias:FXE_points_tab_pointfilter_dd_items    # Point types Drop-down items
    RPA.Desktop.Click With Offset    x=0    y=-20    action=click    # DO points select


    
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_pointfilter_POINTS_dd    timeout=10
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_POINTS_dd    # Point filter bar activated drop-down with "points" word Dims:47*12
    RPA.Desktop.Click With Offset    x=17    y=0    action=click

    RPA.Desktop.Wait For Element    alias:FXE_points_tab_pointfilter_dd_items    timeout=10
    RPA.Desktop.Move Mouse    alias:FXE_points_tab_pointfilter_dd_items    # Point types Drop-down items
    RPA.Desktop.Click With Offset    x=0    y=20    action=click    # AI points select



    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_pointfilter_POINTS_dd    timeout=10
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_POINTS_dd    # Point filter bar activated drop-down with "points" word Dims:47*12
    RPA.Desktop.Click With Offset    x=17    y=0    action=click

    RPA.Desktop.Wait For Element    alias:FXE_points_tab_pointfilter_dd_items    timeout=10
    RPA.Desktop.Move Mouse    alias:FXE_points_tab_pointfilter_dd_items    # Point types Drop-down items
    RPA.Desktop.Click With Offset    x=0    y=55    action=click    # AO points select



    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_pointfilter_POINTS_dd    timeout=10
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_POINTS_dd    # Point filter bar activated drop-down with "points" word Dims:47*12
    RPA.Desktop.Click With Offset    x=17    y=0    action=click
    
    RPA.Desktop.Wait For Element    alias:FXE_points_tab_pointfilter_dd_items    timeout=10
    RPA.Desktop.Move Mouse    alias:FXE_points_tab_pointfilter_dd_items    # Point types Drop-down items
    RPA.Desktop.Click With Offset    x=0    y=95    action=click    # CONTROL POINT points select



    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_pointfilter_POINTS_dd    timeout=10
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_POINTS_dd    # Point filter bar activated drop-down with "points" word Dims:47*12
    RPA.Desktop.Click With Offset    x=17    y=0    action=click

    RPA.Desktop.Wait For Element    alias:FXE_points_tab_pointfilter_dd_items    timeout=10
    RPA.Desktop.Move Mouse    alias:FXE_points_tab_pointfilter_dd_items    # Point types Drop-down items
    RPA.Desktop.Click With Offset    x=0    y=130    action=click    # TIME SCHEDULE points select



    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_pointfilter_POINTS_dd    timeout=10
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_POINTS_dd    # Point filter bar activated drop-down with "points" word Dims:47*12
    RPA.Desktop.Click With Offset    x=17    y=0    action=click

    RPA.Desktop.Wait For Element    alias:FXE_points_tab_pointfilter_dd_items    timeout=10
    RPA.Desktop.Move Mouse    alias:FXE_points_tab_pointfilter_dd_items    # Point types Drop-down items
    RPA.Desktop.Click With Offset    x=0    y=170    action=click    # LOOKUP TABLE points select



    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_pointfilter_POINTS_dd    timeout=10
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_POINTS_dd    # Point filter bar activated drop-down with "points" word Dims:47*12
    RPA.Desktop.Click With Offset    x=17    y=0    action=click

    RPA.Desktop.Wait For Element    alias:FXE_points_tab_pointfilter_dd_items    timeout=10
    RPA.Desktop.Move Mouse    alias:FXE_points_tab_pointfilter_dd_items    # Point types Drop-down items
    RPA.Desktop.Click With Offset    x=0    y=-180    action=click    # ALL POINTS points select

###    Pointfilter right buttons

    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_pointfilter_rightpart_bar    timeout=10    # Pointfiletr bar right part
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_rightpart_bar    # Pointfiletr bar right part
    RPA.Desktop.Click With Offset    x=-75    y=0    action=click    # Linked points select
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_rightpart_bar    # Pointfiletr bar right part
    RPA.Desktop.Click With Offset    x=-75    y=0    action=click    # Linked points de-select
 


    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_pointfilter_rightpart_bar    timeout=10    # Pointfiletr bar right part
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_rightpart_bar    # Pointfiletr bar right part
    RPA.Desktop.Click With Offset    x=-50    y=0    action=click    # Physical points select
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_rightpart_bar    # Pointfiletr bar right part
    RPA.Desktop.Click With Offset    x=-50    y=0    action=click    # Physical points de-select



    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_pointfilter_rightpart_bar    timeout=10    # Pointfiletr bar right part
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_rightpart_bar    # Pointfiletr bar right part
    RPA.Desktop.Click With Offset    x=10    y=0    action=click    # Fictive points select
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_rightpart_bar    # Pointfiletr bar right part
    RPA.Desktop.Click With Offset    x=10    y=0    action=click    # Fictive points de-select



    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_pointfilter_rightpart_bar    timeout=10    # Pointfiletr bar right part
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_rightpart_bar    # Pointfiletr bar right part
    RPA.Desktop.Click With Offset    x=60    y=0    action=click    # Changed points select
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_rightpart_bar    # Pointfiletr bar right part
    RPA.Desktop.Click With Offset    x=60    y=0    action=click    # Changed points de-select



    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_pointfilter_rightpart_bar    timeout=10    # Pointfiletr bar right part
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_rightpart_bar    # Pointfiletr bar right part
    RPA.Desktop.Click With Offset    x=110    y=0    action=click    # Global points select
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_pointfilter_rightpart_bar    # Pointfiletr bar right part
    RPA.Desktop.Click With Offset    x=110    y=0    action=click    # Global points de-select
