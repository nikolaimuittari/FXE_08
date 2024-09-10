*** Settings ***
Documentation       Stare menu resource file
# Display parameters:
# Physical resolution: 1920 * 1080
# Windows scaling: 100%

Library             RPA.Desktop
Library             RPA.Windows
# Library             RPA.Assistant
# Library             RPA.Dialogs
Library             OperatingSystem
Library             RPA.FileSystem

Resource            common.resource


*** Variables ***
${FXEditor_app}             FxEditor.exe    # c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe
${FXE_TEST_PROJECTS_FOLDER_PATH}    c:\\QA\\TestProjects
${FXE_TEST_PROJECT_PATH}    c:\\QA\\TestProjects\\${TEST_PROJECT_NAME}
${FXE_TEST_PROJECT_FILENAME_PATH}    ${FXE_TEST_PROJECT_PATH}\\${TEST_PROJECT_NAME}.fxp
${EXCEPTION_SCREENSHOT_PATH}    c:\\QA\RoboCorp\\FXE_01\\exception_images
${TEST_PROJECT_NAME}    Test-Project_1
${FXE_TEST_PROJECT_GROUP_PATH}    c:\\QA\\TestProjects\\Test-Group_12


*** Keywords ***


Start Page New Project Wizard Open Close
    RPA.Desktop.Click    alias:FXE_start_create_a_new_project_btn
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Wait For Element    alias:FXE_new_wizard_close_wizard_btn    timeout=25
    Log To Console    *** New project wizard opens OK
    
    Close Project Wizard
    
    RPA.Desktop.Wait For Element    alias:FXE_start_right_down_logo    timeout=20

Start Page New Group Project Wizard Open Close
    RPA.Desktop.Wait For Element     alias:FXE_start_create_a_new_group_project_btn    timeout=25    # New Group button
    RPA.Desktop.Click    alias:FXE_start_create_a_new_group_project_btn
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Wait For Element    alias:FXE_start_create_a_new_group_name_form    timeout=10
    RPA.Desktop.Click    alias:FXE_start_create_a_new_group_name_form
    RPA.Desktop.Type Text    ${FXE_TEST_PROJECT_GROUP_PATH}    # c:\\QA\\TestProjects\\Group_1234
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    # RPA.Desktop.Press Keys    tab
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click    alias:FXE_start_create_a_new_group_project_save_btn
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Move Mouse    alias:FXE_start_create_group_select_all
    RPA.Desktop.Click With Offset    x=-30    y=0    action=click
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click    alias:FXE_start_group_project_add_btn
    RPA.Desktop.Type Text    Test Group name
    RPA.Desktop.Press Keys    tab 
    RPA.Desktop.Type Text    Test Group address
    RPA.Desktop.Press Keys    tab 
    RPA.Desktop.Type Text    123456
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    alt    F4
    ${folder_existed}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_start_group_save_form    timeout=10    # Saving changes form
    Run Keyword If    ${folder_existed}    RPA.Desktop.Click    alias:FXE_main_YES_noicon_form_inactive_btn    action=click
    Log To Console    Group has been saved OK


Start Page Open Existing Project
    RPA.Desktop.Click    alias:FXE_start_open_an_existing_project_btn
    RPA.Desktop.Type Text    ${FXE_TEST_PROJECT_FILENAME_PATH}    # C:\QA\TestProjects\TestProject1234\TestProject1234.fxp
    RPA.Desktop.Press Keys    enter
    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab    timeout=25
    RPA.Desktop.Click    alias:FXE_main_project_close_btn
    RPA.Desktop.Wait For Element    alias:FXE_start_right_down_logo    timeout=20


Start Page Add Delete Favorites
    ${project_list}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_start_add_to_favorites_btn    timeout=10
    IF    ${project_list}
        Log To Console    Project in the Open Recent list
        RPA.Desktop.Click    alias:FXE_start_add_to_favorites_btn
        RPA.Desktop.Click With Offset    alias:FXE_start_favorites_header    x=0    y=50    action=click
        Splash Screen Check
        Close Opened Project Without Saving
        Log To Console    Project from favorites opened OK
    ELSE
       Log To Console    No project in the list     
    END
    
    ${project_favorites}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_start_favorites_delete_btn    timeout=10
    IF    ${project_favorites}
        RPA.Desktop.Click    alias:FXE_start_favorites_delete_btn
        ${project_favorites_deleted}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_start_favorites_delete_btn    timeout=10
        IF    ${project_favorites_deleted} == ${False}
            Log To Console    Project has been deleted from the favorites list
        END
    ELSE
        Log To Console    No project in the favorites list
    END

    


Start Page Settings Form
    RPA.Desktop.Click    alias:FXE_start_settings_btn
    RPA.Desktop.Wait For Element    alias:FXE_start_settings_form    timeout=10
    Log To Console    Settings form visible
    RPA.Desktop.Click With Offset    alias:FXE_Save_Cancel_btn    x=50    y=0    action=click

    
Start Page Settings Project Tab Walkthrough
    
    RPA.Desktop.Wait For Element    alias:FXE_start_settings_btn    timeout=10
    RPA.Desktop.Click    alias:FXE_start_settings_btn
    RPA.Desktop.Wait For Element    alias:FXE_start_settings_form    timeout=10
    Log To Console    Settings form visible


    RPA.Desktop.Press Keys    tab     # CHKBX Autosave project every
    RPA.Desktop.Press Keys    space
    RPA.Desktop.Press Keys    space
    RPA.Desktop.Press Keys    space
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    tab    # CHKBX Prompt before save
    RPA.Desktop.Press Keys    space
    RPA.Desktop.Press Keys    space
    RPA.Desktop.Press Keys    space
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    tab    # INPUT minutes
    RPA.Desktop.Type Text    12
    RPA.Desktop.Press Keys    tab     # CHKBX Auto import points
    RPA.Desktop.Press Keys    space
    RPA.Desktop.Press Keys    space
    RPA.Desktop.Press Keys    space
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    tab     # CHKBX Prompt before import
    RPA.Desktop.Press Keys    tab     # INPUT Delimiter
    RPA.Desktop.Type Text    -
    RPA.Desktop.Press Keys    ctrl     a
    RPA.Desktop.Type Text    _
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    tab     # DDWN Gridtype
    RPA.Desktop.Press Keys    down    down    down    down    # Dot2020 value
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    tab     # DDWN GSnap size
    RPA.Desktop.Press Keys    down    down    down    # 20 value
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    tab     # CHKBX Show hint
    RPA.Desktop.Press Keys    space

    RPA.Desktop.Press Keys    tab     # DDWN Symbol folder
    RPA.Desktop.Press Keys    down    down    down    down    down      # 20 value
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    tab     # CHKBX Copy symbol
    RPA.Desktop.Press Keys    space
    RPA.Desktop.Press Keys    space
    RPA.Desktop.Press Keys    space
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    # Settings tab
    RPA.Desktop.Wait For Element    alias:FXE_start_settings_form_tabs    timeout=10    # Tabs locator dims: 395*45
    RPA.Desktop.Click With Offset    alias:FXE_start_settings_form_tabs    x=-70    y=0    action=Click    # Settings tab

    RPA.Desktop.Wait For Element    alias:FXE_start_settings_form_settings_tab    timeout=10
    Log To Console    Settings tab visible

    # RPA.Desktop.Press Keys    tab     # INPUT Cloud folder
    RPA.Desktop.Type Text    ${FXE_TEST_PROJECTS_FOLDER_PATH}
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    tab     # CHKBX Firmware
    RPA.Desktop.Press Keys    space
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    tab     # CHKBX Data Default
    RPA.Desktop.Press Keys    space
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    tab     # CHKBX www Default
    RPA.Desktop.Press Keys    space
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    tab     # CHKBX Print templates
    RPA.Desktop.Press Keys    space
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    tab     # INPUT Project folder
    RPA.Desktop.Type Text    ${FXE_TEST_PROJECT_PATH}
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    tab     # INPUT Template folder
    RPA.Desktop.Type Text    ${FXE_TEMPLATE_FOLDER_PATH}
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    tab     # CHKBX Small icons
    # RPA.Desktop.Press Keys    space
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    tab     # DDWN Task type
    RPA.Desktop.Press Keys    down        # Timer value
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    tab     # DDWN Optimization
    RPA.Desktop.Press Keys    up    up        # normal value
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    tab     # INPUT Priority
    RPA.Desktop.Type Text    2
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    tab     # INPUT Time
    RPA.Desktop.Type Text    500
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    tab     # CHKBX Autoset
    RPA.Desktop.Press Keys    space
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    # Units tab
    RPA.Desktop.Wait For Element    alias:FXE_start_settings_form_tabs    timeout=10    # Tabs locator dims: 395*45
    RPA.Desktop.Click With Offset    alias:FXE_start_settings_form_tabs    x=-10    y=0    action=Click    # Units tab
    RPA.Desktop.Wait For Element    alias:FXE_start_settings_form_units_tab    timeout=10
    Log To Console    Units tab visible

    FOR    ${counter}    IN RANGE    1    46    1
        
        RPA.Desktop.Type Text    ${counter}
        RPA.Desktop.Press Keys    down     # Decimals
        
    END

    # Company tab
    RPA.Desktop.Wait For Element    alias:FXE_start_settings_form_tabs    timeout=10    # Tabs locator dims: 395*45
    RPA.Desktop.Click With Offset    alias:FXE_start_settings_form_tabs    x=60    y=0    action=Click    # Company tab
    RPA.Desktop.Wait For Element    alias:FXE_start_settings_form_company_tab    timeout=10
    Log To Console    Company tab visible

    RPA.Desktop.Press Keys    tab     # INPUT Company name
    RPA.Desktop.Type Text    Fidelix Tech Oy
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    
    RPA.Desktop.Press Keys    tab     # INPUT Company address
    RPA.Desktop.Type Text    Myllynkivenkuja 1
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    tab     # INPUT Place ZIP
    RPA.Desktop.Type Text    Vantaa
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    tab     # INPUT website
    RPA.Desktop.Type Text    www.fidelix.com
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    tab     # INPUT support mail
    RPA.Desktop.Type Text    info@fidelix.com
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    tab     # INPUT service mail
    RPA.Desktop.Type Text    service@fidelix.com
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    tab     # INPUT phone
    RPA.Desktop.Type Text    +358500123452
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    tab     # INPUT support phone
    RPA.Desktop.Type Text    +358500123451
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    tab     # INPUT service phone
    RPA.Desktop.Type Text    +358500123453
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}


    # Modules tab
    # RPA.Desktop.Wait For Element    alias:FXE_start_settings_form_tabs    timeout=10    # Tabs locator dims: 395*45
    # RPA.Desktop.Click With Offset    alias:FXE_start_settings_form_tabs    x=100    y=0    action=Click    # Modules tab
    # RPA.Desktop.Wait For Element    alias:FXE_start_settings_form_modules_tab    timeout=10
    # Log To Console    Modules tab visible
    
    # RPA.Desktop.Wait For Element    alias:FXE_start_settings_form_modules_tab_table_header    timeout=10
    # RPA.Desktop.Click With Offset    alias:FXE_start_settings_form_modules_tab_table_header    x=0    y=25    action=click
    # # RPA.Desktop.Press Keys    tab     # Module row
    # FOR    ${counter}    IN RANGE    1    30    1
        
    #     RPA.Desktop.Press Keys    down     # Next row
    #     Sleep    200ms
    # END
    

    # Tools tab
    RPA.Desktop.Wait For Element    alias:FXE_start_settings_form_tabs    timeout=10    # Tabs locator dims: 395*45
    RPA.Desktop.Click With Offset    alias:FXE_start_settings_form_tabs    x=130    y=0    action=Click    # Tools tab
    RPA.Desktop.Wait For Element    alias:FXE_start_settings_form_tools_tab    timeout=10
    Log To Console    Tools tab visible

    RPA.Desktop.Click    alias:FXE_start_settings_form_new_btn
    RPA.Desktop.Wait For Element    alias:FXE_system_file_open_form_btn    timeout=10
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Type Text    C:\\Program Files (x86)\\Foxit Software\\Foxit Reader\\FoxitReader.exe
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click With Offset    alias:FXE_system_file_open_form_btn    x=-50    y=0    action=click
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    # Display name
    RPA.Desktop.Type Text    Test Tool 
    RPA.Desktop.Press Keys    tab    # INPUT Extern Program path
    RPA.Desktop.Type Text    C:\\Program Files (x86)\\Foxit Software\\Foxit Reader\\FoxitReader.exe
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}


    RPA.Desktop.Press Keys    tab    # INPUT Extern Program run parameters
    RPA.Desktop.Type Text    -h
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    tab    # ICON folder icon
    RPA.Desktop.Press Keys    tab    # INPUT  FXE run constants
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Type Text    -m
    RPA.Desktop.Press Keys    tab    # CHKBX Visible on startpage
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Wait For Element    alias:FXE_start_settings_form_apply_btn    timeout=10
    RPA.Desktop.Click    alias:FXE_start_settings_form_apply_btn
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Wait For Element    alias:FXE_start_settings_form_tools_tab_table_header    timeout=10
    RPA.Desktop.Click With Offset    alias:FXE_start_settings_form_tools_tab_table_header    x=0    y=65    action=click
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Wait For Element    alias:FXE_start_settings_form_delete_btn    timeout=10
    RPA.Desktop.Click    alias:FXE_start_settings_form_delete_btn
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Wait For Element    alias:FXE_start_settings_form_tools_delete_form    timeout=10
    RPA.Desktop.Click    alias:FXE_main_YES_noicon_form_inactive_btn
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Click With Offset    alias:FXE_Save_Cancel_btn    x=50    y=0    action=click
    RPA.Desktop.Wait For Element    alias:FXE_start_settings_save_form    timeout=10
    RPA.Desktop.Click    alias:FXE_main_NO_noicon_form_btn


Start Page Tools Button
    RPA.Desktop.Wait For Element    alias:FXE_start_tools_btn    timeout=10
    RPA.Desktop.Click    alias:FXE_start_tools_btn
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Wait For Element    alias:FXE_start_settings_form_tools_tab    timeout=10
    RPA.Desktop.Click With Offset    alias:FXE_Save_Cancel_btn    x=50    y=0    action=click
    Log To Console    Tools form is visible

Start Page Explore FX-Editor Data Button
    RPA.Desktop.Wait For Element    alias:FXE_start_explore_fx_editor_data_btn    timeout=10
    RPA.Desktop.Click    alias:FXE_start_explore_fx_editor_data_btn
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Wait For Element    alias:FXE_start_explore_fx_editor_data_window    timeout=20
    RPA.Desktop.Click With Offset    alias:FXE_system_window_black_btns    x=40    y=0    action=click   
    Log To Console    Explore form is visible


Start Page License Button
    RPA.Desktop.Wait For Element    alias:FXE_start_license_btn    timeout=10
    RPA.Desktop.Click    alias:FXE_start_license_btn
    RPA.Desktop.Wait For Element    alias:FXE_start_license_form    timeout=10
    RPA.Desktop.Click With Offset    alias:FXE_start_license_form    x=0    y=120    action=click    # Edit and Renew button
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    # License info change
    # RPA.Desktop.Type Text    Fidelix Oy
    RPA.Desktop.Press Keys    tab     # VAT
    # RPA.Desktop.Type Text    1234556789
    RPA.Desktop.Press Keys    tab     # Name
    # RPA.Desktop.Type Text    Nikolai Zhukov
    RPA.Desktop.Press Keys    tab     # Phone
    # RPA.Desktop.Type Text    0509104667
    RPA.Desktop.Press Keys    tab     # email
    # RPA.Desktop.Type Text    nikolai.zhukov@fidelix.fi
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Click With Offset    alias:FXE_start_license_form    x=150    y=160    action=click    # Renew license button
    RPA.Desktop.Wait For Element    alias:FXE_start_license_info_form    timeout=10
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Click With Offset    alias:FXE_start_license_info_form    x=0    y=80    action=click    # Text editor option
    RPA.Desktop.Wait For Element    alias:FXE_start_license_txt_notepad_window    timeout=10
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click    alias:FXE_start_license_txt_notepad_window 
    RPA.Desktop.Press Keys    alt   F4
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Wait For Element    alias:FXE_start_license_btn    timeout=10
    RPA.Desktop.Click    alias:FXE_start_license_btn
    RPA.Desktop.Wait For Element    alias:FXE_start_license_form    timeout=10
    RPA.Desktop.Click With Offset    alias:FXE_start_license_form    x=120    y=120    action=click    # Load license button
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Wait For Element    alias:FXE_system_file_open_form_btn    timeout=10
    RPA.Desktop.Type Text    c:\\QA\\FxTool.lic
    RPA.Desktop.Click With Offset    alias:FXE_system_file_open_form_btn    x=-30    y=0    action=click
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Wait For Element    alias:FXE_start_license_update_form    timeout=10
    RPA.Desktop.Click    alias:FXE_main_OK_noicon_active_form_btn
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Wait For Element    alias:FXE_start_license_form    timeout=10
    RPA.Desktop.Click With Offset    alias:FXE_start_license_form    x=150    y=160    action=click    # Renew license button

    Log To Console    License operation OK


Start Page Fideilx Manual Button
    RPA.Desktop.Wait For Element    alias:FXE_start_Fidelix_manual_btn    timeout=10
    RPA.Desktop.Click    alias:FXE_start_Fidelix_manual_btn

    RPA.Desktop.Wait For Element    alias:FXE_start_fidelix_manual_window    timeout=10
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Press Keys    alt   F4
    Log To Console    Fidelix manual is visible


Start Page FX-Editor Manual Button
    RPA.Desktop.Wait For Element    alias:FXE_start_fxeditor_btn    timeout=10
    RPA.Desktop.Click    alias:FXE_start_fxeditor_btn

    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Wait For Element        alias:FXE_start_fxeditor_manual_window    timeout=10
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    alt   F4
    Log To Console    FX-Editor manual is visible


Start Page OpenPCS Manual Button
    RPA.Desktop.Wait For Element    alias:FXE_start_openpcs_btn    timeout=10
    RPA.Desktop.Click    alias:FXE_start_openpcs_btn
    RPA.Desktop.Wait For Element    alias:FXE_start_openpcs_infoteam_img    timeout=20
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    alt   F4
    # RPA.Desktop.Wait For Element    alias:FXE_start_openpcs_btn    timeout=10
    Log To Console    OpenPCS manual is visible


Start Page Version Up To Date Button
    RPA.Desktop.Wait For Element    alias:FXE_start_your_version_is_up_to_date_btn    timeout=10
    RPA.Desktop.Click    alias:FXE_start_your_version_is_up_to_date_btn
    RPA.Desktop.Wait For Element    alias:FXE_start_version_number_form    timeout=10
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click    alias:FXE_main_OK_noicon_active_form_btn
    Log To Console    Version form visible

Start Page Update History Button

    RPA.Desktop.Wait For Element    alias:FXE_start_update_history_btn    timeout=10
    RPA.Desktop.Click    alias:FXE_start_update_history_btn
    RPA.Desktop.Wait For Element    alias:FXE_start_updates_txt_notepad_window    timeout=10
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    alt   F4
    Log To Console    Update history visible

Start Page Import New PLC Firmware Button Arguments-2
    [Arguments]    ${FW_type}    ${FX_name}
    RPA.Desktop.Move Mouse    alias:FXE_start_license_btn
    RPA.Desktop.Wait For Element    alias:FXE_start_import_new_plc_firmware_btn    timeout=10
    RPA.Desktop.Click    alias:FXE_start_import_new_plc_firmware_btn
    RPA.Desktop.Wait For Element    alias:FXE_start_import_new_plc_firmware_form    timeout=10    # Import firmware form
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    IF    ${FW_type} == 1
            OperatingSystem.Remove File    c:\\ProgramData\\FX-Editor\\Fidelix-IMX6\\${FX_name}
            RPA.Desktop.Click With Offset    alias:FXE_start_import_new_plc_firmware_form    x=0    y=-30    action=click    # Linux option
            RPA.Desktop.Wait For Element    alias:FXE_start_import_new_plc_firmware_linux_folder_window    timeout=10
            RPA.Desktop.Type Text    c:\\Users\\USER\\Downloads\\${FX_name}
            
            RPA.Desktop.Click With Offset    alias:FXE_start_import_new_plc_firmware_linux_folder_window    x=180    y=20     action=click    # Select folder button   
            Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    ELSE IF    ${FW_type} == 2
            Check And Delete Test Project    c:\\ProgramData\\FX-Editor\\Fidelix-ARM\\${FX_name}
            RPA.Desktop.Click With Offset    alias:FXE_start_import_new_plc_firmware_form    x=0    y=30    action=click    # Windows CE option
            RPA.Desktop.Wait For Element    alias:FXE_start_import_new_plc_firmware_wince_folder_window    timeout=10
            RPA.Desktop.Type Text    c:\\Users\\USER\\Downloads\\${FX_name}
            RPA.Desktop.Press Keys    enter
            RPA.Desktop.Click With Offset    alias:FXE_start_import_new_plc_firmware_wince_folder_window    x=150    y=10     action=click    # Select folder button   
            Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    ELSE    
        Log To Console    No FX added
    END

    RPA.Desktop.Wait For Element    alias:FXE_start_import_new_plc_firmware_arm_success_form    timeout=25
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click    alias:FXE_main_OK_noicon_active_form_btn
    Log To Console    WinCE firmware is imported

Start Logo Screen
    RPA.Desktop.Wait For Element    alias:FXE_start_logo_img    timeout=10
    RPA.Desktop.Click    alias:FXE_start_logo_img
    RPA.Desktop.Wait For Element    alias:FXE_start_logo_screen_form    timeout=10
    RPA.Desktop.Click With Offset    alias:FXE_start_logo_screen_form    x=300    y=100    action=click
    # Computer icon
    Log To Console    License screen visible
    RPA.Desktop.Click With Offset    alias:FXE_start_logo_screen_form    x=250    y=200    action=click
    # OK button