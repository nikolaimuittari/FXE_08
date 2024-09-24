** Settings ***
Documentation       Common resource file
# Display parameters:
# Physical resolution: 1920 * 1080
# Windows scaling: 100%

Library             RPA.Desktop
Library             RPA.Windows
# Library             RPA.Assistant
# Library             RPA.Dialogs
Library             OperatingSystem
Library             RPA.FileSystem

Resource    common.resource

*** Variables ***
${FXEditor_app}             FxEditor.exe    # c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe
${FXE_TEST_PROJECTS_FOLDER_PATH}    c:\\QA\\TestProjects
${FXE_TEST_PROJECT_PATH}    c:\\QA\\TestProjects\\${TEST_PROJECT_NAME}
${FXE_TEST_PROJECT_FILENAME_PATH}    ${FXE_TEST_PROJECT_PATH}\\${TEST_PROJECT_NAME}.fxp
${EXCEPTION_SCREENSHOT_PATH}    c:\\QA\RoboCorp\\FXE_01\\exception_images
${TEST_PROJECT_NAME}    Test-Project_1
${FXE_TEST_PROJECT_GROUP_PATH}    c:\\QA\\TestProjects\\Test-Group_12
${FXE_TEMPLATE_FOLDER_PATH}    C:\\ProgramData\\FX-Editor\\Templates\\FXT Templates\\
${replace_new}


*** Keywords ***

Template Selection And Import
    Wait For Element    alias:FXE_main_template_icon    timeout=10
    RPA.Desktop.Click    alias:FXE_main_template_icon
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    
    ${filter_selection}=    Run Keyword And Return Status    Wait For Element    alias:FXE_main_template_filter_select_form    timeout=10
    IF    ${filter_selection}
        RPA.Desktop.Click    alias:FXE_main_template_filter_select_form
        RPA.Desktop.Press Keys    down
        RPA.Desktop.Press Keys    enter
        RPA.Desktop.Click    alias:FXE_main_OK_form_btn
    END

    Wait For Element    alias:FXE_main_template_browser_form_filled    timeout=10
    RPA.Desktop.Click With Offset   alias:FXE_main_template_browser_browse_btn    x=0    y=10    action=click    # Browse button
    Wait For Element    alias:FXE_main_template_browser_select_form    timeout=10    # Folder select form
    RPA.Desktop.Press Keys    esc    # Close form
    
    RPA.Desktop.Click With Offset   alias:FXE_main_template_browser_browse_btn    x=0    y=-10    action=click    # Use default template folder button

    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    down
    
    Wait For Element    alias:FXE_main_template_exhaust_1_icon    timeout=10
    RPA.Desktop.Click    alias:FXE_main_template_exhaust_1_icon    
    Wait For Element    alias:FXE_main_template_open_btn    timeout=10
    RPA.Desktop.Click    alias:FXE_main_template_open_btn
    
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    Wait For Element    alias:FXE_main_template_manager_add_cancel_btn    timeout=10
    
    RPA.Desktop.Click With Offset       alias:FXE_main_template_manager_tabs    x=50    y=0
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click With Offset       alias:FXE_main_template_manager_tabs    x=-20    y=0

    RPA.Desktop.Click    alias:FXE_main_template_manager_zoom_btn
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Click With Offset    alias:FXE_main_template_manager_points_buttons    x=-150    y=0
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Click With Offset    alias:FXE_main_template_manager_add_cancel_btn    x=-50    y=0
    ${replace_new}=    Run Keyword And Return Status    Wait For Element    alias:FXE_main_template_replace_new_form    timeout=10
    Run Keyword If    ${replace_new}    
    ...    RPA.Desktop.Click With Offset    alias:FXE_main_template_replace_new_form    x=0    y=-50
    Splash Screen Check
    
    # RPA.Desktop.Press Keys    alt    F4

Template Selection And Import AHU
    Wait For Element    alias:FXE_main_template_icon    timeout=10
    RPA.Desktop.Click    alias:FXE_main_template_icon
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    ${filter_form}=    Run Keyword And Return Status    Wait For Element    alias:FXE_main_template_filter_select_form    timeout=10
    IF    $filter_form == ${TRUE}
        RPA.Desktop.Click With Offset    
        ...    alias:FXE_main_template_new_modify_form    
        ...    x=50    
        ...    y=40
        ...    action=click    # OK button
    END


    ${add_form}=    Run Keyword And Return Status    
    ...    Wait For Element    
    ...    alias:FXE_main_template_new_modify_form    
    ...    timeout=10

    IF    $add_form == ${TRUE}
        RPA.Desktop.Click With Offset    
        ...    alias:FXE_main_template_new_modify_form    
        ...    x=0    
        ...    y=150
        ...    action=click

        RPA.Desktop.Click    alias:FXE_main_OK_noicon_active_form_btn
    END


    # Wait For Element    alias:FXE_main_template_filter_select_form    timeout=10
    # RPA.Desktop.Click    alias:FXE_main_template_filter_select_form
    # RPA.Desktop.Press Keys    down
    # RPA.Desktop.Press Keys    enter
    # RPA.Desktop.Click    alias:FXE_main_OK_form_btn

    ${unused points}=    Run Keyword And Return Status    
    ...    Wait For Element    
    ...    alias:FXE_main_template_unused_form_SAVE_inactive_btn    
    ...    timeout=10

    IF    ${unused points}
        Wait For Element    alias:FXE_main_CLOSE_points_form_btn    timeout=10
        RPA.Desktop.Click    alias:FXE_main_CLOSE_points_form_btn
    END



    Wait For Element    alias:FXE_main_template_browser_form_filled    timeout=10
    RPA.Desktop.Click With Offset   alias:FXE_main_template_browser_browse_btn    x=0    y=20    # Browse button
    Wait For Element    alias:FXE_main_template_browser_select_form    timeout=10    # Folder select form
    RPA.Desktop.Press Keys    esc    # Close form
    
    RPA.Desktop.Press Keys    down
    # RPA.Desktop.Press Keys    down
    # RPA.Desktop.Press Keys    down
    # RPA.Desktop.Press Keys    down
    # RPA.Desktop.Press Keys    down
    # RPA.Desktop.Press Keys    down
    
    Wait For Element    alias:FXE_main_template_AHU_1_icon    timeout=10
    RPA.Desktop.Click    alias:FXE_main_template_AHU_1_icon    
    Wait For Element    alias:FXE_main_template_open_btn    timeout=10
    RPA.Desktop.Click    alias:FXE_main_template_open_btn
    
    Wait For Element    alias:FXE_main_template_add_active_btn    timeout=60
    
    RPA.Desktop.Click With Offset       alias:FXE_main_template_manager_tabs    x=50    y=0    action=click
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click With Offset       alias:FXE_main_template_manager_tabs    x=-20    y=0    action=click

    RPA.Desktop.Click    alias:FXE_main_template_manager_zoom_btn
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Click With Offset    alias:FXE_main_template_manager_points_buttons    x=-75    y=0    action=click
    Sleep    ${SLEEP_TIMEOUT_DEFAULT}

    RPA.Desktop.Click    alias:FXE_main_template_add_active_btn
    # RPA.Desktop.Click With Offset    alias:FXE_main_template_manager_add_cancel_btn    x=-50    y=0    # Add button
    ${replace_new}=    Run Keyword And Return Status    Wait For Element    alias:FXE_main_template_replace_new_form    timeout=10
    Run Keyword If    ${replace_new}    
    ...    RPA.Desktop.Click With Offset    alias:FXE_main_template_replace_new_form    x=0    y=-50
    Splash Screen Check
    
    ${unused_visible}=    Run Keyword And Return Status    Wait For Element    alias:FXE_main_template_unused_points_form_header     timeout=50
    IF    $unused_visible
        RPA.Desktop.Click    alias:FXE_main_template_unused_select_all_chbx
        Wait For Element    alias:FXE_main_template_unused_from_SAVE_active_btn    timeout=10
        RPA.Desktop.Click    alias:FXE_main_template_unused_from_SAVE_active_btn
    END
    # RPA.Desktop.Press Keys    alt    F4
