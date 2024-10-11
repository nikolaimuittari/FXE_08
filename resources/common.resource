*** Settings ***
Documentation       Common resource file
# Display parameters:
# Physical resolution: 1920 * 1080
# Windows scaling: 100%

Library             RPA.Desktop
Library             RPA.Windows
# Library             RPA.Assistant
Library             Process
# Library             RPA.Dialogs
Library             OperatingSystem
Library             RPA.FileSystem
Library             Collections
Library             BuiltIn
Library             String
Library             RPA.RobotLogListener
Library             DateTime

*** Variables ***
${FXEditor_app}             FxEditor.exe    # c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe
${FXE_TEST_PROJECTS_FOLDER_PATH}    c:\\QA\\TestProjects
${FXE_TEST_PROJECT_PATH}    c:\\QA\\TestProjects\\${TEST_PROJECT_NAME}
${FXE_TEST_PROJECT_FILENAME_PATH}    ${FXE_TEST_PROJECT_PATH}\\${TEST_PROJECT_NAME}.fxp
${EXCEPTION_SCREENSHOT_PATH}    c:\\QA\RoboCorp\\FXE_01\\exception_images
${TEST_PROJECT_NAME}    Test-Project_1
${FXE_TEST_PROJECT_GROUP_PATH}    c:\\QA\\TestProjects\\Test-Group_12
${FXE_TEMPLATE_FOLDER_PATH}    C:\\ProgramData\\FX-Editor\\Templates\\FXT Templates\\

${SLEEP_TIMEOUT_DEFAULT}    1.0s

${TEST_PROJECTS_PATH}    c:\\QA\\TestProjects\\
${TEST_PROJECT_NAME}    Test-Project_1

${UPPERCASE_LETTERS}      ABCDEFGHIJKLMNOPQRSTUVWXYZ
${LOWERCASE_LETTERS}      abcdefghijklmnopqrstuvwxyz
${DIGITS}                 0123456789
${UNDERSCORE}             _

${RESOLUTION}    1366x768
${FRAMERATE}     25
${OUTPUT_DIR}    c:\\QA\\Video

*** Keywords ***

# Set Global Variable    ${RESOURCES}    ${CURDIR}/../resources

#Open Existing Project
#    Log To Console    ${FXE_TEST_PROJECT_PATH}\\${TEST_PROJECT_NAME}.fxp
#    RPA.Desktop.Open File    ${FXE_TEST_PROJECT_PATH}\\${TEST_PROJECT_NAME}.fxp


Fresh Start
    Recreate Test Projects folder    c:\\QA\\TestProjects\\
    Open FXE
    New Project Wizard    Test-Project_1    FX3000C



Open FXE
    # RPA.Desktop.Click      alias:Win11_search_input
    # RPA.Desktop.Type Text    FX-Editor
    # RPA.Desktop.Press Keys    enter
    
    # ${app_instance} =   Run Process    
    # ...    powershell    -Command    
    # ...    Start-Process 'c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe' -WindowStyle Maximized

    # 2024.08.12
    # ${app_instance} =    Start Process    c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe
    

    Windows Run    "c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe"
    # Sleep    2s    # Wait for the application to start
    # Maximize Window    FxEditor    # Assumes "FxEditor" is in the window title
    
    # ${app_instance}=    RPA.Desktop.Open Application    c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe
    # [Return]    ${app_instance}
    # RPA.Desktop.Open Application    ${FXEditor_app}    # "c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe"
    RPA.Desktop.Wait For Element    alias:FXE_start_right_down_logo    timeout=40
    Log To Console    FX-Editor is started. Logo visible.
    # RPA.Desktop.Highlight Elements    alias:FXE_start_right_down_logo

Get Process Id
    [Arguments]    ${process_name}
    ${output} =    Run Process    powershell    -Command    Get-Process ${process_name} ^| Select-Object -ExpandProperty Id
    ${pid} =    Set Variable    ${output.stdout.strip()}
    [Return]    ${pid}

Close All
    [Arguments]    ${app_instance}
    RPA.Desktop.Close Application    ${app_instance}
    # RPA.Desktop.Close Application    FxEditor.exe
    # RPA.Desktop.Close All Applications
    # RPA.Desktop.Press Keys    alt    F4
    Log To Console    *** Close all applications OK

Close FXE
    [Arguments]    ${app_instance}
    # RPA.Desktop.Close Application    ${app_instance}
    # RPA.Desktop.Close Application    FxEditor.exe
    # RPA.Desktop.Close All Applications
    # RPA.Desktop.Press Keys    alt    F4

    Terminate Process    handle=${app_instance}    kill=true
    Log To Console    *** Close FXE application ${app_instance} OK

Recreate Test Projects folder
    [Arguments]    ${PROJECTS_PATH}
    OperatingSystem.Remove Directory    ${PROJECTS_PATH}    recursive=${True}
    OperatingSystem.Create Directory    ${PROJECTS_PATH}
    ${folder_exists}=    Run Keyword And Return Status    OperatingSystem.Directory Should Exist    ${PROJECTS_PATH}
    Run Keyword If    ${folder_exists}    Log To Console    *** Test projects common folder recreated OK


Check Projects Common Folder Exists
    ${folder_exists}=    Run Keyword And Return Status    OperatingSystem.Directory Should Exist    ${FXE_TEST_PROJECTS_FOLDER_PATH}
    Run Keyword If    ${folder_exists}    Log To Console    *** Test projects common folder exists OK


Check And Delete Test Project
    [Arguments]    ${folter_path}
    #OperatingSystem.Directory Should Not Exist    ${FXE_TEST_PROJECT_PATH}
    
    ${folder_exists}=    Run Keyword And Return Status    OperatingSystem.Directory Should Exist    ${folter_path}
    Run Keyword If    ${folder_exists}    OperatingSystem.Remove Directory    ${folter_path}    recursive=${True}
    ${folder_exists}=    Run Keyword And Return Status    OperatingSystem.Directory Should Not Exist    ${folter_path}
    IF    ${folder_exists}
        Log To Console    *** Folder ${folter_path} has been deleted OK
    ELSE
        Log To Console    *** Folder ${folter_path} NOT deleted
    END
    

Clear Test Projects Folder
    [Arguments]    ${folder_path}    ${starts_with}
    # ${folder_path}=    Set Variable    ${FXE_TEST_PROJECTS_FOLDER_PATH}
    ${items} =    List Directory    ${folder_path}    ${starts_with}*.*
    # Log To Console    Starts with
    # Log To Console   ${items}
    # Log To Console    END of Starts with
    ${folders} =    List Directory    ${folder_path}    ${starts_with}*
    Log To Console    Folders    
    Log To Console    ${folders}
    Log To Console    END of Folders
    # ${directories}=    List Directories In Directory    ${folder_path}
    FOR    ${folder}    IN    @{folders}
       OperatingSystem.Remove Directory    ${folder_path}\\${folder}    recursive=${True}
       OperatingSystem.Remove File    ${folder_path}\\${folder}
       Log To Console    Removed
       Log To Console    ${folder_path}\\${folder}
    END

Clear And Delete Folder
    [Arguments]    ${folder_path}
    ${folder_exists}    OperatingSystem.Directory Should Exist     ${folder_path}
    Run Keyword If    ${folder_exists}    OperatingSystem.Remove Directory    ${folder_path}    recursive=True
    ${folder_exists}    OperatingSystem.Directory Should Exist     ${folder_path}
    IF    ${folder_exists}
        Log To Console    Folder ${folder_path} has been deleted OK
    ELSE
        Log To Console    Folder ${folder_path} still exists
    END

Check And Delete Folder
    [Arguments]    ${PROJECT_FOLDER_PATH}
    #OperatingSystem.Directory Should Not Exist    ${FXE_TEST_PROJECT_PATH}
    
    ${folder_exists}=    Run Keyword And Return Status    OperatingSystem.Directory Should Exist    ${PROJECT_FOLDER_PATH}
    Log To Console    ${PROJECT_FOLDER_PATH} exists: ${folder_exists}
    Run Keyword If    ${folder_exists}==${True}    OperatingSystem.Remove Directory    ${PROJECT_FOLDER_PATH}    recursive=${True}
    ${folder_exists}=    Run Keyword And Return Status    OperatingSystem.Directory Should Not Exist    ${PROJECT_FOLDER_PATH}
    Run Keyword If    ${folder_exists}    Log To Console    *** Folder ${PROJECT_FOLDER_PATH} has been deleted OK
    Run Keyword If    ${folder_exists}==${False}    Log To Console    *** Folder ${PROJECT_FOLDER_PATH} still exists

Delete Group
    [Arguments]    ${GROUP_FOLDER}    ${GROUP_NAME}
    # OperatingSystem.Directory Should Not Exist    ${FXE_TEST_PROJECT_PATH}
    ${group_folder_documents}=    Set Variable    ${GROUP_FOLDER}\\${GROUP_NAME} - Document\\
    OperatingSystem.Remove Directory    ${group_folder_documents}    recursive=${True}
    OperatingSystem.Should Not Exist    ${group_folder_documents}    Exists:${group_folder_documents}
    
    # ${folder_existed}=    Run Keyword And Return Status    OperatingSystem.Directory Should Not Exist    ${group_folder_documents}
    # Run Keyword If    ${folder_existed}    Log To Console    Folder ${group_folder_documents} has been deleted
    # Log To Console    ${group_folder_documents}
    # ${folder_existed}=    Run Keyword And Return Status    OperatingSystem.Directory Should Exist    ${group_folder_documents}
    # Run Keyword If    ${folder_existed}    OperatingSystem.Remove Directory    ${group_folder_documents}    recursive=${True}
    # ${folder_exists}=    Run Keyword And Return Status    OperatingSystem.Directory Should Not Exist    ${group_folder_documents}
    # Run Keyword If    ${folder_exists}    Log To Console    *** Group folder ${group_folder_documents} has been deleted OK
    OperatingSystem.Remove File    ${GROUP_FOLDER}\\${GROUP_NAME}\\${GROUP_NAME}.log
    OperatingSystem.Should Not Exist    ${GROUP_FOLDER}\\${GROUP_NAME}\\${GROUP_NAME}.log
    Log To Console    ${GROUP_FOLDER}\\${GROUP_NAME}\\${GROUP_NAME}.log

    OperatingSystem.Remove File    ${GROUP_FOLDER}\\${GROUP_NAME}\\${GROUP_NAME}.ini
    OperatingSystem.Should Not Exist    ${GROUP_FOLDER}\\${GROUP_NAME}\\${GROUP_NAME}.ini
    Log To Console    ${GROUP_FOLDER}\\${GROUP_NAME}\\${GROUP_NAME}.ini

    OperatingSystem.Remove File    ${GROUP_FOLDER}\\${GROUP_NAME}\\${GROUP_NAME}.fxg
    OperatingSystem.Should Not Exist    ${GROUP_FOLDER}\\${GROUP_NAME}\\${GROUP_NAME}.fxg
    Log To Console    ${GROUP_FOLDER}\\${GROUP_NAME}\\${GROUP_NAME}.fxg
    # ${file_exists}=    Run Keyword And Return Status    OperatingSystem.Remove File    ${GROUP_FOLDER}${GROUP_NAME}\\${GROUP_NAME}.log
    # Run Keyword If    ${file_exists}    Log To Console    File ${GROUP_FOLDER}${GROUP_NAME}\\${GROUP_NAME}.log has been deleted
    # ${file_exists}=    Run Keyword And Return Status    OperatingSystem.Remove File    ${GROUP_FOLDER}${GROUP_NAME}\\${GROUP_NAME}.ini
    # Run Keyword If    ${file_exists}    Log To Console    File ${GROUP_FOLDER}${GROUP_NAME}\\${GROUP_NAME}.ini has been deleted
    # ${file_exists}=    Run Keyword And Return Status    OperatingSystem.Remove File    ${GROUP_FOLDER}${GROUP_NAME}\\${GROUP_NAME}.fxg
    # Run Keyword If    ${file_exists}    Log To Console    File ${GROUP_FOLDER}${GROUP_NAME}\\${GROUP_NAME}.fxg has been deleted


Check Empty Project Name Error
    RPA.Desktop.Click    alias:FXE_new_project_wizard_next_btn
    #Run Keyword And Ignore Error    RPA.Desktop.Click    alias:FXE_new_project_wizard_next_btn
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}    
    RPA.Desktop.Wait For Element    alias:FXE_new_project_wizard_empty_proj_name_err    timeout=25
    Log To Console    *** Empty project name error is detected OK
    #RPA.Desktop.Click With Offset    alias:FXE_new_project_wizard_empty_proj_name_err    x=280    y=90    action=click
    RPA.Desktop.Press Keys    enter
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}

Generate Random String
    [Arguments]    ${length}=10
    ${first_part}=    Generate Random First Character
    ${remaining_length}=    Evaluate    ${length} - 1
    ${remaining_part}=    Generate Random Remaining Characters    ${remaining_length}
    ${random_string}=    Catenate    ${first_part}    ${remaining_part}
    [Return]    ${random_string}

Generate Random First Character
    ${characters}=    Set Variable    ${UPPERCASE_LETTERS}${LOWERCASE_LETTERS}
    ${random_first_char}=    Get Random Character From String    ${characters}
    [Return]    ${random_first_char}

Generate Random Remaining Characters
    [Arguments]    ${length}
    ${characters}=    Set Variable    ${UPPERCASE_LETTERS}${LOWERCASE_LETTERS}${DIGITS}${UNDERSCORE}
    ${random_chars}=    Generate Random String From Characters    ${characters}    ${length}
    [Return]    ${random_chars}

Get Random Character From String
    [Arguments]    ${string}
    ${length}=    Get Length    ${string}
    ${random_index}=    Evaluate    random.randint(0, ${length} - 1)
    ${random_char}=    Get Substring    ${string}    ${random_index}    ${random_index + 1}
    [Return]    ${random_char}

Generate Random String From Characters
    [Arguments]    ${characters}    ${length}
    ${random_string}=    Set Variable    ""
    FOR    ${index}    IN RANGE    ${length}
        ${random_char}=    Get Random Character From String    ${characters}
        ${random_string}=    Catenate    ${random_string}    ${random_char}
    END
    [Return]    ${random_string}




Close Project Wizard
    RPA.Desktop.Click    alias:FXE_new_wizard_close_wizard_btn
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Wait For Element    alias:FXE_start_right_down_logo    timeout=20
    Log To Console    *** Closing wizard OK


New Project Wizard Default
    RPA.Desktop.Wait For Element    alias:FXE_start_create_a_new_project_btn    timeout=25
    RPA.Desktop.Click    alias:FXE_start_create_a_new_project_btn
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    
    #Run Keyword    Close Project Wizard

    #RPA.Desktop.Wait For Element    alias:FXE_start_create_a_new_project_btn    timeout=10
    #RPA.Desktop.Click    alias:FXE_start_create_a_new_project_btn
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    Run Keyword    Check Empty Project Name Error

    RPA.Desktop.Click    alias:FXE_new_project_wizard_location_folder_btn
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    Run Keyword And Continue On Failure    Check Projects Common Folder Exists
    RPA.Desktop.Type Text    ${FXE_TEST_PROJECTS_FOLDER_PATH}    # enter=true
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    enter
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    enter
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click    alias:FXE_new_project_wizard_save_folder_btn
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Type Text    TestProject1234
    RPA.Desktop.Press Keys    tab
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Type Text    TestProject_1234
    RPA.Desktop.Press Keys    tab
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Type Text    1234
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click    alias:FXE_new_project_wizard_next_btn
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    Log To Console    *** Navigate to -2. Communication Settings - wizard page OK
    RPA.Desktop.Wait For Element    alias:FXE_new_project_wizard_back_btn    timeout=10
    RPA.Desktop.Click    alias:FXE_new_project_wizard_back_btn
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    Log To Console    *** Navigate to previous wizard page OK

    RPA.Desktop.Click    alias:FXE_new_project_wizard_next_btn
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click    alias:FXE_new_project_wizard_plc_selection_dropdn
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    down    down    enter    # FX3000X select
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click    alias:FXE_new_project_wizard_local_ip_btn    # default IP address
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click    alias:FXE_new_project_wizard_local_ip_fld
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    ctrl    a
    RPA.Desktop.Type Text    10.100.1.198    # custom IP address
    RPA.Desktop.Press Keys    tab    tab
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Type Text    22
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Press Keys    ctrl    a
    RPA.Desktop.Type Text    SSH_user_name!    # custom SSH password    # Systemuser!  # default FX3000X SSH password
    RPA.Desktop.Press Keys    tab
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Type Text    22
    RPA.Desktop.Press Keys    tab
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Type Text    HUOLTO    # custom username   # system # default username
    RPA.Desktop.Press Keys    tab    
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Type Text    80
    RPA.Desktop.Press Keys    tab
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Type Text    13579    # custom password   # 24680    # default user password
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click    alias:FXE_new_project_wizard_next_btn
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    Log To Console    *** Navigate to -3. Point Name Build Struccture OK

    RPA.Desktop.Click    alias:FXE_new_project_wizard_create_btn
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab   timeout=25
    Log To Console    *** New project has been created OK
    

New Project Wizard
    [Arguments]    ${PROJECT_NAME}    ${PLC_TYPE}
    RPA.Desktop.Wait For Element    alias:FXE_start_create_a_new_project_btn    timeout=25
    RPA.Desktop.Click    alias:FXE_start_create_a_new_project_btn
    Splash Screen Check
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    
    #Run Keyword    Close Project Wizard

    #RPA.Desktop.Wait For Element    alias:FXE_start_create_a_new_project_btn    timeout=10
    #RPA.Desktop.Click    alias:FXE_start_create_a_new_project_btn
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    # Run Keyword    Check Empty Project Name Error

    # Run Keyword And Continue On Failure    Check Projects Common Folder Exists

    # RPA.Desktop.Wait For Element    alias:FXE_new_project_wizard_location_folder_btn    timeout=5
    # RPA.Desktop.Move Mouse    alias:FXE_new_project_wizard_location_folder_btn
    # RPA.Desktop.Click
    # RPA.Desktop.Click    alias:FXE_new_project_wizard_location_folder_btn

    RPA.Desktop.Type Text    ${PROJECT_NAME}
    RPA.Desktop.Press Keys    tab
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Type Text    ${PROJECT_NAME}
    RPA.Desktop.Press Keys    tab
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Type Text    1234
    RPA.Desktop.Press Keys    tab
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Type Text    Address 1234
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Press Keys    tab

    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    enter

    RPA.Desktop.Wait For Element    alias:FXE_new_project_wizard_location_folder_window    timeout=5
    RPA.Desktop.Type Text    ${FXE_TEST_PROJECTS_FOLDER_PATH}    # enter=true
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    enter
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    enter
    Sleep    ${SLEEP_TIMEOUT_DEFAULT} 
    RPA.Desktop.Press Keys    tab
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    enter
    Sleep    ${SLEEP_TIMEOUT_DEFAULT} 

    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    # RPA.Desktop.Press Keys    enter
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    # RPA.Desktop.Press Keys    tab
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    # RPA.Desktop.Press Keys    enter
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    # RPA.Desktop.Click    alias:FXE_new_project_wizard_save_folder_btn
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    # RPA.Desktop.Press Keys    tab
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    # RPA.Desktop.Type Text    ${PROJECT_NAME}
    # RPA.Desktop.Press Keys    tab
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    # RPA.Desktop.Type Text    ${PROJECT_NAME}
    # RPA.Desktop.Press Keys    tab
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    # RPA.Desktop.Type Text    1234
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click    alias:FXE_new_project_wizard_next_btn
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    Log To Console    *** Navigate to -2. Communication Settings - wizard page OK

    RPA.Desktop.Wait For Element    alias:FXE_new_project_wizard_back_btn    timeout=10
    RPA.Desktop.Click    alias:FXE_new_project_wizard_back_btn
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    Log To Console    *** Navigate to previous wizard page OK

    RPA.Desktop.Click    alias:FXE_new_project_wizard_next_btn
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    
    IF    "${PLC_TYPE}" == "FX3000X"
        RPA.Desktop.Click    alias:FXE_new_project_wizard_plc_selection_dropdn
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    enter    # FX3000X select
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
        RPA.Desktop.Click    alias:FXE_new_project_wizard_local_ip_btn    # default IP address
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
        RPA.Desktop.Click    alias:FXE_new_project_wizard_local_ip_fld
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
        RPA.Desktop.Press Keys    ctrl    a
        RPA.Desktop.Type Text    10.100.1.198    # custom IP address
        RPA.Desktop.Press Keys    tab    tab
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
        RPA.Desktop.Type Text    22
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
        RPA.Desktop.Press Keys    tab
        RPA.Desktop.Press Keys    ctrl    a
        RPA.Desktop.Type Text    demodemo    # custom SSH password    # Systemuser!  # default FX3000X SSH password
        RPA.Desktop.Press Keys    tab
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
        RPA.Desktop.Type Text    22
        RPA.Desktop.Press Keys    tab
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
        RPA.Desktop.Type Text    SYSTEM    # custom username   # system # default username
        RPA.Desktop.Press Keys    tab    
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
        RPA.Desktop.Type Text    80
        RPA.Desktop.Press Keys    tab
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
        RPA.Desktop.Type Text    24680    # custom password   # 24680    # default user password
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
        Log To Console    *** FX3000X comm settings
    ELSE IF    "${PLC_TYPE}" == "FX3000C"
        RPA.Desktop.Click    alias:FXE_new_project_wizard_plc_selection_dropdn
        #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
        RPA.Desktop.Press Keys    enter    # FX3000C select
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
        RPA.Desktop.Click    alias:FXE_new_project_wizard_local_ip_btn    # default IP address
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
        RPA.Desktop.Click    alias:FXE_new_project_wizard_local_ip_fld
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
        RPA.Desktop.Press Keys    ctrl    a
        RPA.Desktop.Type Text    10.100.1.200    # custom IP address
        RPA.Desktop.Press Keys    tab    tab
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
        RPA.Desktop.Type Text    21
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
        RPA.Desktop.Press Keys    tab
        RPA.Desktop.Press Keys    ctrl    a
        RPA.Desktop.Type Text    demodemo    # custom Telnet password
        RPA.Desktop.Press Keys    tab
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
        RPA.Desktop.Type Text    21
        RPA.Desktop.Press Keys    tab
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
        RPA.Desktop.Type Text    SYSTEM    # custom username   # system # default username
        RPA.Desktop.Press Keys    tab    
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
        RPA.Desktop.Type Text    80
        RPA.Desktop.Press Keys    tab
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
        RPA.Desktop.Type Text    24680    # custom password   # 24680    # default user password
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
        Log To Console    *** FX3000C comm settings 
    ELSE
        Log To Console    *** PLC type is not detected
    END

    RPA.Desktop.Wait For Element    alias:FXE_new_project_wizard_next_btn    timeout=25
    RPA.Desktop.Click    alias:FXE_new_project_wizard_next_btn
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    Log To Console    *** Navigate to -3. Point Name Build Structure OK

    RPA.Desktop.Wait For Element    alias:FXE_start_create_pointname_separator_input    timeout=5
    RPA.Desktop.Click    alias:FXE_start_create_pointname_separator_input    action=double_click
    RPA.Desktop.Type Text    _

    RPA.Desktop.Wait For Element    alias:FXE_new_project_wizard_create_btn    timeout=25

    Log To Console    ! ! ! Create button
    
    RPA.Desktop.Click    alias:FXE_new_project_wizard_create_btn
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    ${date_format_form}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_start_date_format_info_form    timeout=25
    IF    ${date_format_form} == ${True}
        RPA.Desktop.Click With Offset    alias:FXE_start_date_format_info_form     x=125    y=70    action=click       
    ELSE
        Log To Console    FXE_start_date_format_info_form not found !
    END
    
    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab    timeout=25
    Log To Console    *** New project ${PROJECT_NAME} has been created OK
    

Copy Project From
    [Arguments]    ${PROJECT_NAME}    ${FOLDER_FROM}    ${FOLDER_TO}
     
    ${folder_to_exists}=    Run Keyword And Return Status    OperatingSystem.Directory Should Exist    ${FOLDER_TO}${PROJECT_NAME}\\
    Log To Console    Project ${FOLDER_TO}${PROJECT_NAME}\\ exists: ${folder_to_exists}
    Run Keyword If    ${folder_to_exists}==${False}    OperatingSystem.Copy Directory    ${FOLDER_FROM}${PROJECT_NAME}\\    ${FOLDER_TO}${PROJECT_NAME}\\
    ${folder_to_exists}=    Run Keyword And Return Status    OperatingSystem.Directory Should Exist    ${FOLDER_TO}${PROJECT_NAME}\\
    Log To Console    Project ${FOLDER_TO}${PROJECT_NAME}\\ exists: ${folder_to_exists}


Open Existing Project
    [Arguments]    ${PROJECTS_FOLDER}    ${PROJECT_NAME}
    Log To Console    Trying to open project from: ${PROJECTS_FOLDER}\\${PROJECT_NAME}.fxp
    RPA.Desktop.Open File    ${FXE_TEST_PROJECT_FILENAME_PATH}
    # RPA.Desktop.Open File    ${PROJECTS_FOLDER}\\${PROJECT_NAME}.fxp
    Splash Screen Check
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab    timeout=25
    Log To Console    *** Project ${PROJECTS_FOLDER}\\${PROJECT_NAME}.fxp has been opened OK

    
Close Opened Project With Saving
    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab    timeout=45
    Log To Console    Project is opened
    # RPA.Desktop.Click    alias:FXE_main_project_close_btn
    RPA.Desktop.Wait For Element    alias:FXE_main_project_close_btn    timeout=25
    RPA.Desktop.Click With Offset   alias:FXE_main_project_close_btn    x=60    y=0    action=click    # project close button
    # Saving dialog if project has been chnaged
    ${Saving_dialog}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_project_save_msg    timeout=15
    # Pressing YES
    Run Keyword If    ${Saving_dialog}
    ...    RPA.Desktop.Click    alias:FXE_main_YES_noicon_form_btn
   

Close Opened Project Without Saving
    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab    timeout=25
    Log To Console    Project is opened    
    RPA.Desktop.Wait For Element    alias:FXE_main_project_close_btn    timeout=25
    RPA.Desktop.Click With Offset   alias:FXE_main_project_close_btn    x=60    y=0    action=click    # project close button
    # Saving dialog if project has been chnaged
    ${Saving_dialog}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_project_save_msg    timeout=15
    # Pressing NO
    Run Keyword If    ${Saving_dialog}
    ...    RPA.Desktop.Click    alias:FXE_main_NO_noicon_form_btn
    
Splash Screen Check
    ${Splash_screen}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_splash_img    timeout=10
    IF    ${Splash_screen}
        Log To Console    Splash screen VISIBLE
    ELSE
        Log To Console    Splash screen NOT VISIBLE
    END

Access Violation Form Check
    ${access_violation}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_ACCESS_VIOLATION_form    timeout=10
    IF    ${access_violation}
        Log To Console    Access violation is VISIBLE
        Click With Offset    
        ...    alias:FXE_main_ACCESS_VIOLATION_form
        ...    x=125
        ...    y=55
        ...    action=click
    END



Current Window System Force Close X Button
    RPA.Desktop.Wait For Element    alias:FXE_start_window_upper_left_FX_icon    timeout=5
    RPA.Desktop.Move Mouse    alias:FXE_start_window_upper_left_FX_icon
    RPA.Desktop.Click
    RPA.Desktop.Wait For Element    alias:FXE_start_window_upper_left_FX_icon_menu    timeout=5
    Log To Console    Window control menu visible
    RPA.Desktop.Click With Offset    alias:FXE_start_window_upper_left_FX_icon_menu    x=0     y=70    action=Click

    # RPA.Desktop.Wait For Element    alias:FXE_start_window_system_btn    timeout=10
    # RPA.Desktop.Click With Offset    alias:FXE_start_window_system_btn    x=50    y=0    action=Click
    Log To Console    Active window is closed


# Display Dialog and Wait for User Action
    
#     RPA.Assistant.Add heading     Test passed  size=Large
#     #Add text input  address           label=User address
#     RPA.Assistant.Run dialog   
    
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


Check And Close Connection Fail Form
    
    ${connection_failed_x_1_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_connection_failed_x_1_error    timeout=5
    # OK button
    Run Keyword If    ${connection_failed_x_1_exists}    RPA.Desktop.Click With Offset    alias:FXE_main_connection_failed_x_1_error    x=125    y=60    action=click    # OK
    Run Keyword If    ${connection_failed_x_1_exists}    Log To Console    Visibe: alias:FXE_main_connection_failed_x_1_error    

    ${connection_failed_c_respond_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_connection_failed_c_respond_error    timeout=25
    # OK button
    Run Keyword If    ${connection_failed_c_respond_exists}    RPA.Desktop.Click With Offset    alias:FXE_main_connection_failed_c_respond_error    x=125    y=15    action=click    # OK
    Run Keyword If    ${connection_failed_c_respond_exists}    Log To Console    Visibe: alias:FXE_main_connection_failed_c_respond_error    

    ${connection_failed_c_timeout_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_connection_failed_c_timeout_error    timeout=25
    # Close button
    Run Keyword If    ${connection_failed_c_timeout_exists}    RPA.Desktop.Click With Offset    alias:FXE_main_connection_failed_c_timeout_error    x=0    y=15    action=click    # OK
    Run Keyword If    ${connection_failed_c_timeout_exists}    Log To Console    Visibe: alias:FXE_main_connection_failed_c_timeout_error

Delete File If Exists
    [Arguments]    ${filepath}
    ${file_exists}=    Run Keyword And Return Status    OperatingSystem.File Should Exist    ${filepath}    ignore_error=True
    IF    ${file_exists}
        OperatingSystem.Remove File    ${filepath}
        Log To Console    File deleted: ${filepath}
    ELSE
        Log To Console    File does not exist: ${filepath}
    END
    # Run Keyword If    ${file_exists}    OperatingSystem.Remove File    ${filepath}
    # ...    ELSE    Log To Console    File does not exist: ${filepath}
    # Run Keyword If    ${file_exists}    Log To Console    File deleted: ${filepath}


Copy Test Project Folder From Backup
    [Arguments]    ${test_project_dir}    ${backup_dir}
    # ${test_project_dir}=    Set Variable    c:\\QA\\TestProjects\\Test-Project_1
    # Check if the Test-Project_1 folder exists in the TestProjects directory and delete it if it exists
    ${exists}=    Run Keyword And Return Status    Directory Should Exist    ${test_project_dir}
    Log To Console    ${test_project_dir} folder exists: ${exists}
    Run Keyword If    ${exists}    RPA.FileSystem.Remove Directory    ${test_project_dir}    recursive=${True}
    # Ensure the Backup folder exists
    Directory Should Exist    ${backup_dir}
    ${backup_exists}=    Run Keyword And Return Status    Directory Should Exist    ${backup_dir}
    Log To Console    ${backup_dir} folder exists: ${backup_exists}
    # Copy the Backup folder to the TestProjects directory
    RPA.FileSystem.Copy Directory    ${backup_dir}    ${test_project_dir}

Stop Screen Recording
    Terminate Process    ffmpeg_process
    ${result} =    Wait For Process    ffmpeg_process
    
    Log To Console   Wait For Process ffmpeg_process: ${result.stdout}
    # Terminate Process    ffmpeg
    Sleep    1s  # Give time for FFmpeg to finalize the video

Get Current Timestamp
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    [Return]    ${timestamp}

Get Current Suite Name
    [Return]    ${SUITE NAME}