*** Settings ***
Documentation       Common resource file

Library             RPA.Desktop
Library             RPA.Windows
Library             OperatingSystem
Library             DateTime
Library             RPA.RobotLogListener


# Resource            resources/common.resource
Resource            common.resource

*** Variables ***
#${FXEditor_app}             c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe
#${FXE_TEST_PROJECTS_FOLDER_PATH}    c:\\QA\\TestProjects
#${FXE_TEST_PROJECT_PATH}    c:\\QA\\TestProjects\\${TEST_PROJECT_NAME}
#${FXE_TEST_PROJECT_FILENAME_PATH}    ${FXE_TEST_PROJECT_PATH}\\${TEST_PROJECT_NAME}.fxp
#${EXCEPTION_SCREENSHOT_PATH}    c:\\QA\RoboCorp\\FXE_01\\exception_images
#${TEST_PROJECT_NAME}    TestProject1234
#${SLEEP_TIMEOUT_DEFAULT}    1s
${current_date}=    Get Current Date    result_format=%d.%m.%y



*** Keywords ***
Project Tab Project Information Subtab
    
    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab    timeout=5
    RPA.Desktop.Click    alias:FXE_main_project_tab
    # Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click    alias:FXE_main_project_tab_project_info_subtab
    # Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Type Text    Test project name
    # Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Type Text    Address line 1
    # Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Type Text    Address line 2
    # Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Type Text    PLCname
    # Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Type Text    Cabinetname
   #  Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Type Text    11.12.2022    #result_format=%d.%m.%y    #${current_date}
    # Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Type Text    1234
    # Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Type Text    12.12.2022
   #  Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Type Text    New user
   #  Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Type Text    13.12.2022
    # Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Type Text    Test project description
   # Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab

Project Tab Communication Settings Subtab
    RPA.Desktop.Wait For Element    alias:FXE_project_main_project_info_bar    timeout=5
    RPA.Desktop.Click    alias:FXE_main_project_tab
    # Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click    alias:FXE_main_project_tab_comm_settings_subtab
    # Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab    # IP connection drop-down
    RPA.Desktop.Press Keys    tab    # Selected IP
    RPA.Desktop.Type Text    10.100.1.198 
    RPA.Desktop.Press Keys    tab    # PLC model
    RPA.Desktop.Press Keys    tab    # Default IP button (space)
    RPA.Desktop.Press Keys    tab    # (S)FTP Passive mode checkbox
    RPA.Desktop.Press Keys    tab    # (S)FTP password show button (click)
    RPA.Desktop.Press Keys    tab    # CONNECT button (space)
    RPA.Desktop.Press Keys    tab    # (S)FTP Password field (selected)
    
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Type Text    demodemo

    RPA.Desktop.Press Keys    tab    # (S)FTP Port number (selected)
    RPA.Desktop.Type Text    22

    RPA.Desktop.Press Keys    tab    # Web server password show button (click)
    RPA.Desktop.Press Keys    tab    # Web server port field (selected)
    RPA.Desktop.Type Text    80

    RPA.Desktop.Press Keys    tab    # Web server username field (selected)
    RPA.Desktop.Type Text    SYSTEM
    
    RPA.Desktop.Press Keys    tab    # Web server password field (selected)
    RPA.Desktop.Type Text    24680

    RPA.Desktop.Press Keys    tab    # OPC password show button (click)
    RPA.Desktop.Press Keys    tab    # OPC port field (selected)
    RPA.Desktop.Type Text    FdxAuth

    RPA.Desktop.Press Keys    tab    # OPC password field (selected)
    RPA.Desktop.Type Text    1235

    RPA.Desktop.Press Keys    tab    # OPENPCS IEC port field (selected)
    RPA.Desktop.Type Text    23042

Project Tab Hardware Configuration Subtab
    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_hardware_conf_subtab    timeout=5
    RPA.Desktop.Click    alias:FXE_main_project_tab
    # Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click    alias:FXE_main_project_tab_hardware_conf_subtab
    # Sleep    ${SLEEP_TIMEOUT_DEFAULT}

Project Tab Hardware Configuration Subtab New Module
    RPA.Desktop.Click    alias:FXE_main_project_tab_hardware_conf_subtab_modules_settings_btn
    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_hardware_conf_modules_form    timeout=5
    # Initial active element is "module address" checkbox list
    
    # Coordinates of elements
    # Project -> Hardw Conf -> Modules form dims: 516*623    central point:258*312
    # 
    RPA.Desktop.Move Mouse    alias:FXE_main_project_tab_hardware_conf_modules_form    # Project -> Hardw Conf -> Modules -> Form -> Central point  
    # 20240814 new form coordinates
    # Mbus checkbox: x-20 y-240
    # Port ddown: x-135 y-240
    # Module ddwn: x-80 y-240
    # TCP chkbx: x-245 y-140
    # IP addr 1: x+170 y-110 
    # IP port: x+70 y-110
    # Address 1: x+115 y-280

    
    ${mouse_position}   RPA.Desktop.Get Mouse Position    # Getting mouse position for current form
    
    # RPA.Desktop.Click With Offset    x=-215    y=-218    action=Click    # Port drop down
    RPA.Desktop.Click With Offset    x=-135    y=-240    action=Click    # Port drop down

    RPA.Desktop.Press Keys    4
    RPA.Desktop.Press Keys    enter    # Port 4 set 

    RPA.Desktop.Move Mouse    ${mouse_position}    # Project -> Hardw Conf -> Modules -> Form -> Central point  
    # RPA.Desktop.Move Mouse    alias:FXE_main_project_tab_hardware_conf_modules_form    # Project -> Hardw Conf -> Modules -> Form -> Central point  
    # RPA.Desktop.Click With Offset    x=-128    y=-218    action=click    # Module type drop down
    RPA.Desktop.Click With Offset    x=-80    y=-240    action=click    # Module type drop down

    # Module type select (MBUS requires port 0 or 6..10)
    ${repeats}    Set Variable    1    # Module type drop down(empty -> MBUS 17 down keys) 6=DI16C 1=Combi36
        FOR    ${index}    IN RANGE    ${repeats}
            RPA.Desktop.Press Keys    down
        END
    RPA.Desktop.Press Keys    enter    # Module type set 

    RPA.Desktop.Move Mouse    ${mouse_position}    # Project -> Hardw Conf -> Modules -> Form -> Central point  
    # RPA.Desktop.Click With Offset    x=123    y=-260    action=click    # Module address 1
    RPA.Desktop.Click With Offset    x=120    y=-280    action=click    # Module address 1
    RPA.Desktop.Click With Offset    x=0    y=16    action=click    # Module address 2 
    RPA.Desktop.Click With Offset    x=0    y=16    action=click    # Module address 3
    RPA.Desktop.Click With Offset    x=0    y=16    action=click    # Module address 4     
    
    RPA.Desktop.Click    alias:FXE_main_OK_form_btn    # Saving form


Project Tab Hardware Configuration Subtab New Module Arguments-3
    [Arguments]    ${port}    ${address}    ${module_type}
    RPA.Desktop.Click    alias:FXE_main_project_tab_hardware_conf_subtab_modules_settings_btn
    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_hardware_conf_modules_form    timeout=5
    # Initial active element is "module address" checkbox list
    
    # Coordinates of elements
    # Project -> Hardw Conf -> Modules form dims: 516*623    central point:258*312
    # 
    RPA.Desktop.Move Mouse    alias:FXE_main_project_tab_hardware_conf_modules_form    # Project -> Hardw Conf -> Modules -> Form -> Central point  
    ${mouse_position}   RPA.Desktop.Get Mouse Position    # Getting mouse position for current form
    
    RPA.Desktop.Click With Offset    x=-205    y=-235    action=Click    # MBus checkbox

    RPA.Desktop.Move Mouse    ${mouse_position}

    # 2024-08-29
    # RPA.Desktop.Click With Offset    x=-205    y=-235    action=Click    # MBus checkbox

    RPA.Desktop.Move Mouse    ${mouse_position}

    RPA.Desktop.Click With Offset    x=-160    y=-240    action=Click    # Port drop down

    RPA.Desktop.Type Text    ${port}
    RPA.Desktop.Press Keys    enter    # Port 3 is set 

    RPA.Desktop.Move Mouse    ${mouse_position}    # Project -> Hardw Conf -> Modules -> Form -> Central point  
    # RPA.Desktop.Move Mouse    alias:FXE_main_project_tab_hardware_conf_modules_form    # Project -> Hardw Conf -> Modules -> Form -> Central point  
    RPA.Desktop.Click With Offset    x=-70    y=-240    action=click    # Module type drop down

    # Module type select (MBUS requires port 0 or 6..10)
    # Combi36 = 1
    ${repeats}    Set Variable    ${module_type}    # Module type drop down(empty -> MBUS 17 down keys) 6=DI16C
    FOR    ${index}    IN RANGE    ${repeats}
        RPA.Desktop.Press Keys    down
    END
    RPA.Desktop.Press Keys    enter    # Module type set 

    RPA.Desktop.Click    alias:FXE_main_project_tab_hardware_conf_subtab_modules_addr_list    action=click
    ${repeats}    Set Variable    ${address}    # Module type drop down(empty -> MBUS 17 down keys) 6=DI16C
    FOR    ${index}    IN RANGE    ${repeats}
        RPA.Desktop.Press Keys    down
    END
    RPA.Desktop.Press Keys    space    # Module address select
    
    RPA.Desktop.Click    alias:FXE_main_OK_form_btn    # Saving form

Project Tab Hardware Configuration Subtab Add Modbus Address
    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_hardware_conf_subtab_ports_list    timeout=5
    # RPA.Desktop.Click    alias:FXE_main_project_tab_hardware_conf_subtab_ports_list    # Project -> Hardw Conf -> Modbus ports -> center form
    # Port 7 is selected when clicking the central point
    # ${mouse_position}   RPA.Desktop.Get Mouse Position    # Getting mouse position for current form
    # RPA.Desktop.Press Keys    down    # Port 8 set started from 7
    # RPA.Desktop.Press Keys    down    # Port 9 set started from 7
    # RPA.Desktop.Press Keys    down    # Port 10 set started from 7
    # RPA.Desktop.Press Keys    up    # Port 6 set started from 7
    # RPA.Desktop.Press Keys    up    # Port 5 set started from 7
    # RPA.Desktop.Press Keys    up    # Port 4 set started from 7
    # RPA.Desktop.Press Keys    up    # Port 3 set started from 7

    RPA.Desktop.Wait For Element    alias:FXE_main_project_hardware_conf_modbus_port3_elem    timeout=3
    RPA.Desktop.Move Mouse    alias:FXE_main_project_hardware_conf_modbus_port3_elem
    RPA.Desktop.Click    alias:FXE_main_project_hardware_conf_modbus_port3_elem    right click
    # ${mouse_position}   RPA.Desktop.Get Mouse Position    # Getting mouse position for current form
     
    RPA.Desktop.Wait For Element    alias:FXE_main_project_hardware_conf_modbus_port_right_menu    timeout=2
    # Right click menu. dims: 144*200, central: 72*100

    RPA.Desktop.Move Mouse    alias:FXE_main_project_hardware_conf_modbus_port_right_menu    # Project -> Hardw Conf -> Modbus -> Port -> Right click menu central point  
    ${mouse_position}   RPA.Desktop.Get Mouse Position    # Getting mouse position for current form
    RPA.Desktop.Click With Offset    x=0    y=60    action=click    # Add device
    #
    # "Add modbus address" form. dims: 318*284, center: 159*142
    # 
    RPA.Desktop.Wait For Element    alias:FXE_main_project_hardware_conf_modbus_add_address_form    timeout=2
    RPA.Desktop.Move Mouse    alias:FXE_main_project_hardware_conf_modbus_add_address_form    # Project -> Hardw Conf -> Modbus -> Port -> Right click -> Add modbus address  
    ${mouse_position}   RPA.Desktop.Get Mouse Position    # Getting mouse position for current form center

    # RPA.Desktop.Click With Offset    x=-107    y=-54    action=click    # Address field
    RPA.Desktop.Press Keys    ctrl    a
    RPA.Desktop.Press Keys    delete
    RPA.Desktop.Type Text    247    # Modbus Address set 
    RPA.Desktop.Press Keys    tab    # Group dropdown
    RPA.Desktop.Type Text    AHU machine
    # RPA.Desktop.Press Keys    tab    # Alarm point ID
    # RPA.Desktop.Press Keys    tab    # TCPIP checkbox
    RPA.Desktop.Click    alias:FXE_main_ADD_form_btn
    RPA.Desktop.Click    alias:FXE_main_CANCEL_form_btn

    # RPA.Desktop.Move Mouse    alias:FXE_main_project_hardware_conf_modbus_add_device_form    # Project -> Hardw Conf -> Modbus -> Port -> Right click -> Add modbus address  
    # ${mouse_position}   RPA.Desktop.Get Mouse Position    # Getting mouse position for current form
    
    # RPA.Desktop.Move Mouse    ${mouse_position}    # return mouse to form center
    # RPA.Desktop.Click With Offset    x=-107    y=-54    action=click    # Address field
    # RPA.Desktop.Press Keys    ctrl    a
    # RPA.Desktop.Press Keys    delete
    # RPA.Desktop.Type Text    246    # Modbus Address set 
    # RPA.Desktop.Press Keys    tab    # Group dropdown
    # RPA.Desktop.Press Keys    tab    # Alarm point ID
    # RPA.Desktop.Press Keys    tab    # TCPIP checkbox
    # RPA.Desktop.Click    alias:FXE_main_ADD_form_btn
    # RPA.Desktop.Click    alias:FXE_main_CANCEL_form_btn
    
    # Port 10 add address TCPIP
    RPA.Desktop.Wait For Element    alias:FXE_main_project_hardware_conf_modbus_port10_elem    timeout=3
    RPA.Desktop.Move Mouse    alias:FXE_main_project_hardware_conf_modbus_port10_elem
    RPA.Desktop.Click    alias:FXE_main_project_hardware_conf_modbus_port10_elem    right click

    RPA.Desktop.Wait For Element    alias:FXE_main_project_hardware_conf_modbus_port_right_menu    timeout=2
    
    RPA.Desktop.Move Mouse    alias:FXE_main_project_hardware_conf_modbus_port_right_menu    # Project -> Hardw Conf -> Modbus -> Port -> Right click menu central point  
    ${mouse_position}   RPA.Desktop.Get Mouse Position    # Getting mouse position for current form
    RPA.Desktop.Click With Offset    x=0    y=60    action=click    # Add device
    #
    # "Add modbus address" form. dims: 318*284, center: 159*142
    # 
    RPA.Desktop.Wait For Element    alias:FXE_main_project_hardware_conf_modbus_add_address_form    timeout=2
    
    RPA.Desktop.Move Mouse    alias:FXE_main_project_hardware_conf_modbus_add_address_form    # Project -> Hardw Conf -> Modbus -> Port -> Right click -> Add modbus address  
    ${mouse_position}   RPA.Desktop.Get Mouse Position    # Getting mouse position for current form center

    # RPA.Desktop.Click With Offset    x=-107    y=-54    action=click    # Address field
    RPA.Desktop.Press Keys    ctrl    a
    RPA.Desktop.Press Keys    delete
    RPA.Desktop.Type Text    247    # Modbus Address set 
    RPA.Desktop.Press Keys    tab    # Group dropdown
    RPA.Desktop.Type Text    TCPIP device
    RPA.Desktop.Press Keys    tab    # Alarm point ID
    RPA.Desktop.Press Keys    tab    # TCPIP checkbox
    RPA.Desktop.Press Keys    space    # TCPIP checkbox activate
    RPA.Desktop.Type Text    10.11.12.13    # IP address
    RPA.Desktop.Press Keys    Tab    # IP Port
    RPA.Desktop.Type Text    502    # IP port set

    RPA.Desktop.Click    alias:FXE_main_ADD_form_btn
    RPA.Desktop.Click    alias:FXE_main_CANCEL_form_btn

Project Tab Hardware Configuration Subtab Add Modbus Device
    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_hardware_conf_subtab_ports_list    timeout=5
    RPA.Desktop.Wait For Element    alias:FXE_main_project_hardware_conf_modbus_port3_elem    timeout=3
    # 
    RPA.Desktop.Move Mouse    alias:FXE_main_project_hardware_conf_modbus_port3_elem
    # Port 3 element open
    RPA.Desktop.Click    alias:FXE_main_project_hardware_conf_modbus_port3_elem    double click

    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_hardware_subtab_modbus_address247_elem    timeout=3
    RPA.Desktop.Click    alias:FXE_main_project_tab_hardware_subtab_modbus_address247_elem    right click
    
    # Address right click menu
    RPA.Desktop.Wait For Element    alias:FXE_main_project_hardware_conf_modbus_address_right_menu    timeout=5
    RPA.Desktop.Move Mouse    alias:FXE_main_project_hardware_conf_modbus_address_right_menu
    ${mouse_position}   RPA.Desktop.Get Mouse Position    # Getting mouse position for current form
    RPA.Desktop.Click With Offset    x=0    y=60    action=click    # Add device

    # Add new modbus device form
    RPA.Desktop.Wait For Element    alias:FXE_main_project_hardware_conf_modbus_add_device_form    timeout=5
    RPA.Desktop.Press Keys    up    # Register type (4input default) -> up -> 3hold
    RPA.Desktop.Press Keys    tab    # Start register
    RPA.Desktop.Press Keys    ctrl    a
    RPA.Desktop.Press Keys    delete
    RPA.Desktop.Type Text    40001    # Start register set 

    RPA.Desktop.Press Keys    tab    # Register count
    RPA.Desktop.Press Keys    ctrl    a
    RPA.Desktop.Press Keys    delete
    RPA.Desktop.Type Text    64    # Register count set 

    RPA.Desktop.Press Keys    tab    # Timeout
    RPA.Desktop.Press Keys    ctrl    a
    RPA.Desktop.Press Keys    delete
    RPA.Desktop.Type Text    5000    # Timout set

    RPA.Desktop.Click    alias:FXE_main_ADD_form_btn
    RPA.Desktop.Click    alias:FXE_main_CANCEL_form_btn
    
    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_hardware_subtab_modbus_address247_elem
    RPA.Desktop.Click    alias:FXE_main_project_tab_hardware_subtab_modbus_address247_elem    double click

    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_hardware_subtab_modbus_holding_elem
    RPA.Desktop.Click    alias:FXE_main_project_tab_hardware_subtab_modbus_holding_elem    double click

    # RPA.Desktop.Click    alias:FXE_main_project_hardware_conf_modbus_port10_elem    double click


Project Tab Point Settings Subtab
    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_point_settings_subtab    timeout=5
    RPA.Desktop.Click    alias:FXE_main_project_tab
    # Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click    alias:FXE_main_project_tab_point_settings_subtab
    # Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    # Resize button
    RPA.Desktop.Move Mouse    alias:FXE_main_project_tab_point_set_subtab_filter_icons    # Point Settings icons dims: 332*65 center: 166*33
    RPA.Desktop.Click With Offset    x=135    y=0    action=click    # Resize columns button

    # Add button
    RPA.Desktop.Move Mouse    alias:FXE_main_project_tab_point_set_subtab_filter_icons    # Point Settings icons dims: 332*65 center: 166*33
    RPA.Desktop.Click With Offset    x=-29    y=0    action=click    # Add prefix button

    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_point_set_subtab_add_prefix_form    timeout=5
    RPA.Desktop.Type Text    Prefix_1
    RPA.Desktop.Click    alias:FXE_main_OK_noicon_form_btn

    # RPA.Desktop.Move Mouse    alias:FXE_main_project_tab_point_set_subtab_filter_icons    # Point Settings icons dims: 332*65 center: 166*33
    # RPA.Desktop.Click With Offset    x=-135    y=0    action=click    # Open prefix button

    # RPA.Desktop.Move Mouse    alias:FXE_main_project_tab_point_set_subtab_filter_icons    # Point Settings icons dims: 332*65 center: 166*33
    # RPA.Desktop.Click With Offset    x=-82    y=0    action=click    # Save prefix button

    # RPA.Desktop.Move Mouse    alias:FXE_main_project_tab_point_set_subtab_filter_icons    # Point Settings icons dims: 332*65 center: 166*33
    # RPA.Desktop.Click With Offset    x=-29    y=0    action=click    # Add prefix button

    # RPA.Desktop.Move Mouse    alias:FXE_main_project_tab_point_set_subtab_filter_icons    # Point Settings icons dims: 332*65 center: 166*33
    # RPA.Desktop.Click With Offset    x=29    y=0    action=click    # Delete prefix button

    # RPA.Desktop.Move Mouse    alias:FXE_main_project_tab_point_set_subtab_filter_icons    # Point Settings icons dims: 332*65 center: 166*33
    # RPA.Desktop.Click With Offset    x=82    y=0    action=click    # Delet All prefixes button

    RPA.Desktop.Move Mouse    alias:FXE_main_project_tab_point_set_subtab_prefix_column    # Pointname settings panel, "Prefix" column header
    RPA.Desktop.Click With Offset    x=0    y=20    action=click    # Column first line
    # Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    #RPA.Desktop.Click    # Column first line click after delay
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    #RPA.Desktop.Type Text    AHU

    RPA.Desktop.Move Mouse    alias:FXE_main_project_tab_point_set_subtab_type_column    # Pointname settings panel, "Type" column header
    RPA.Desktop.Click With Offset    x=0    y=20    action=click    # Column first line -> type dropdown
    RPA.Desktop.Press Keys    down    # Empty
    RPA.Desktop.Press Keys    down    # Cabinet
    RPA.Desktop.Press Keys    down    # Fidleix
    RPA.Desktop.Press Keys    down    # Building
    RPA.Desktop.Press Keys    down    # Object
    # RPA.Desktop.Press Keys    down    # System ?
    RPA.Desktop.Press Keys    enter    # Confirming
    
    RPA.Desktop.Move Mouse    alias:FXE_main_project_tab_point_set_subtab_pointname_build_field    # Pointname build sample text field label
    RPA.Desktop.Click With Offset    x=0    y=20    action=click    # Text field offset  

    RPA.Desktop.Click    action=doubleclick
    RPA.Desktop.Type Text    BUILD_SYSTEM_SUFIX
    RPA.Desktop.Press Keys    enter

Project Tab Settings Subtab
    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_settings_subtab    timeout=5
    # RPA.Desktop.Click    alias:FXE_main_project_tab
    # Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click    alias:FXE_main_project_tab_settings_subtab
    # Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    
    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_settings_subtab_autosave_chkbx     timeout=5
    RPA.Desktop.Click    FXE_main_project_tab_settings_subtab_autosave_chkbx
    # RPA.Desktop.Press Keys    tab    # "Autosave project every" checkbox
    # RPA.Desktop.Press Keys    space     # activate

    RPA.Desktop.Press Keys    tab    # "minutes" textbox - 5 min is default
    RPA.Desktop.Type Text    10    # Changing to 10 min
    RPA.Desktop.Press Keys    Tab    # "prompt before save" checkbox
    RPA.Desktop.Press Keys    space    space     # activate/deactivate -> return in previous position

    RPA.Desktop.Press Keys    tab    # "Auto import points" checkbox
    RPA.Desktop.Press Keys    space    space     # activate/deactivate -> return in previous position


Project Tab Communication Settings Subtab Arguments-6
    [Arguments]    ${ip_address}    ${plc_type}    ${ftp_passw}    ${connect}    ${username}    ${password}

    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab    timeout=5
    RPA.Desktop.Click    alias:FXE_main_project_tab
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click    alias:FXE_main_project_tab_comm_settings_subtab
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab    # IP connection drop-down
    RPA.Desktop.Press Keys    tab    # IP address field
    RPA.Desktop.Press Keys    tab    # PLC model drop-down

    ${repeats}    Set Variable    12    # Number of repeats
    FOR    ${element}    IN RANGE   1    ${repeats}
        RPA.Desktop.Press Keys    up    # PLC type drop-down
        RPA.Desktop.Press Keys    tab    #
    END

    # 11 up moves in drop-down list sets FX2020 PLC type 

    # ${plc_type} == 9 -> FX3000-C
    # ${plc_type} == 11 -> FX3000-X

    ${repeats}    Set Variable    ${plc_type}    # Number of repeats
    FOR    ${element}    IN RANGE   1    ${repeats}
        RPA.Desktop.Press Keys    down    # PLC type drop-down
        RPA.Desktop.Press Keys    tab    #
        IF    ${repeats} >= 11
            Project Tab Communication Settings Subtab Validation            
        END
    END


    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_comm_settings_subtab_selectedip_field    timeout=5    # ! text of IP address field locator 
    RPA.Desktop.Move Mouse    alias:FXE_main_project_tab_comm_settings_subtab_selectedip_field
    RPA.Desktop.Click With Offset    x=0    y=20    action=doubleclick
   
    RPA.Desktop.Type Text    ${ip_address}
    
    RPA.Desktop.Press Keys    tab    # PLC model
    RPA.Desktop.Press Keys    tab    # Default IP button (space)
    RPA.Desktop.Press Keys    tab    # (S)FTP Passive mode checkbox
    RPA.Desktop.Press Keys    space

    RPA.Desktop.Press Keys    tab    # (S)FTP password show button (click)
    RPA.Desktop.Press Keys    tab    # CONNECT button (space)
    RPA.Desktop.Press Keys    tab    # (S)FTP Password field (selected)
    
    RPA.Desktop.Type Text    ${ftp_passw}
    RPA.Desktop.Press Keys    tab    # Port
    RPA.Desktop.Press Keys    tab     # Telnet Port
    
    
    RPA.Desktop.Press Keys    tab    # Predefined password button
    RPA.Desktop.Press Keys    tab    # Web server SEE password button
    RPA.Desktop.Press Keys    tab    # Web server port field
       
    RPA.Desktop.Press Keys    tab    # Web server username

    RPA.Desktop.Type Text    ${username}

    RPA.Desktop.Press Keys    tab     # Web server password
    RPA.Desktop.Type Text    ${password}

    Sleep    1s




Project Tab Communication Settings Subtab Arguments-4
    [Arguments]    ${ip_address}    ${plc_type}    ${ftp_passw}    ${connect}

    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab    timeout=5
    RPA.Desktop.Click    alias:FXE_main_project_tab
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Click    alias:FXE_main_project_tab_comm_settings_subtab
    #Sleep    ${SLEEP_TIMEOUT_DEFAULT}
    RPA.Desktop.Press Keys    tab    # IP connection drop-down
    RPA.Desktop.Press Keys    tab    # IP address field
    RPA.Desktop.Press Keys    tab    # PLC model drop-down

    ${repeats}    Set Variable    11    # Number of repeats
    FOR    ${element}    IN RANGE   1    ${repeats}
        RPA.Desktop.Press Keys    up    # PLC type drop-down
        RPA.Desktop.Press Keys    tab    # Selected IP
    END
    
    IF    ${plc_type} == 9
        ${repeats}    Set Variable    9    # Number of repeats
        FOR    ${element}    IN RANGE   1    ${repeats}
            RPA.Desktop.Press Keys    down    # PLC type drop-down
            RPA.Desktop.Press Keys    tab    # Selected IP
        END
    END
    
    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_comm_settings_subtab_selectedip_field    timeout=5    # ! text of IP address field locator 
    RPA.Desktop.Move Mouse    alias:FXE_main_project_tab_comm_settings_subtab_selectedip_field
    RPA.Desktop.Click With Offset    x=0    y=20    action=doubleclick
   
    RPA.Desktop.Type Text    ${ip_address}
    
    RPA.Desktop.Press Keys    tab    # PLC model
    RPA.Desktop.Press Keys    tab    # Default IP button (space)
    RPA.Desktop.Press Keys    tab    # (S)FTP Passive mode checkbox
    RPA.Desktop.Press Keys    tab    # (S)FTP password show button (click)
    RPA.Desktop.Press Keys    tab    # CONNECT button (space)
    RPA.Desktop.Press Keys    tab    # (S)FTP Password field (selected)
    
    RPA.Desktop.Type Text    ${ftp_passw}
    IF    ${connect} == 1
        
        RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_comm_settings_subtab_connect_btn    timeout=5    # Connect button
        RPA.Desktop.Click    alias:FXE_main_project_tab_comm_settings_subtab_connect_btn    # Connect button
        
        RPA.Desktop.Wait For Element    alias:FXE_main_RUNNING_status_bar    timeout=5    # Running status

    END
    Sleep    1s


    # RPA.Desktop.Press Keys    tab
    # RPA.Desktop.Type Text    somepassword

    # RPA.Desktop.Press Keys    tab    # (S)FTP Port number (selected)
    # RPA.Desktop.Type Text    123

    # RPA.Desktop.Press Keys    tab    # Web server password show button (click)
    # RPA.Desktop.Press Keys    tab    # Web server port field (selected)
    # RPA.Desktop.Type Text    321

    # RPA.Desktop.Press Keys    tab    # Web server username field (selected)
    # RPA.Desktop.Type Text    username
    
    # RPA.Desktop.Press Keys    tab    # Web server password field (selected)
    # RPA.Desktop.Type Text    somepassword

    # RPA.Desktop.Press Keys    tab    # OPC password show button (click)
    # RPA.Desktop.Press Keys    tab    # OPC port field (selected)
    # RPA.Desktop.Type Text    456

    # RPA.Desktop.Press Keys    tab    # OPC password field (selected)
    # RPA.Desktop.Type Text    654

    # RPA.Desktop.Press Keys    tab    # OPENPCS IEC port field (selected)
    # RPA.Desktop.Type Text    78901


Project Tab Communication Settings Subtab Validation
    ${validation_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_validation_form    timeout=5
    IF    ${validation_exists}
        RPA.Desktop.Click    alias:FXE_main_project_tab_validation_start_btn
        Splash Screen Check
        ${validation_success}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_project_tab_validation_success_txt    timeout=30
        IF    ${validation_success}
            Log To Console    Validation successful
        ELSE
            Log To Console    Validation is NOT successful
        END
        RPA.Desktop.Click    alias:FXE_main_project_tab_validation_cancel_btn
    END   