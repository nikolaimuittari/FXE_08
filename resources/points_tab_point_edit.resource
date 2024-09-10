*** Settings ***
Documentation       Common resource file

Library             RPA.Desktop
Library             RPA.Windows
Library             OperatingSystem
Library             DateTime
Library             RPA.RobotLogListener

Resource            points_tab.resource
Resource            common.resource


*** Variables ***
#${FXEditor_app}             c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe
#${FXE_TEST_PROJECTS_FOLDER_PATH}    c:\\QA\\TestProjects
#${FXE_TEST_PROJECT_PATH}    c:\\QA\\TestProjects\\${TEST_PROJECT_NAME}
#${FXE_TEST_PROJECT_FILENAME_PATH}    ${FXE_TEST_PROJECT_PATH}\\${TEST_PROJECT_NAME}.fxp
#${EXCEPTION_SCREENSHOT_PATH}    c:\\QA\RoboCorp\\FXE_01\\exception_images
#${TEST_PROJECT_NAME}    TestProject1234
#${# Sleep_TIMEOUT_DEFAULT}    1s
${current_date}=    Get Current Date    result_format=%d.%m.%y
${button}    
${random_hour}    ${EMPTY}
${random_minute}  ${EMPTY}

*** Keywords ***

Points Tab Left Panel First Line Right Button Menu
    ${Add_button_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_add_btn    timeout=10    # Point Add
        IF    ${Add_button_exists}==${True}
        RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_add_btn    # Point line
        RPA.Desktop.Click With Offset    x=0    y=60    action=rightclick
        RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_RIGHT_BTN_menu    timeout=10    # Rightbutton menu  Dims: 233*410
        RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_RIGHT_BTN_menu    # Rightbutton menu
    END



Points Tab Left Panel TE01_FM Right Button Menu
    ${TE01_FM_line_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_TE01_FM_line    timeout=10    # Point line
    ${TE01_FM_selected_line_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_TE01_FM_selected_line    timeout=10    # Point line
    IF    ${TE01_FM_selected_line_exists}==${True}
        RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_TE01_FM_selected_line    # Point line
        RPA.Desktop.Click    action=rightclick
        RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_RIGHT_BTN_menu    timeout=10    # Rightbutton menu  Dims: 233*410
        RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_RIGHT_BTN_menu    # Rightbutton menu
    ELSE
        IF    ${TE01_FM_line_exists}==${True}
            RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_TE01_FM_line    # Point line
            RPA.Desktop.Click    action=rightclick
            RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_RIGHT_BTN_menu    timeout=10    # Rightbutton menu  Dims: 233*410
            RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_RIGHT_BTN_menu    # Rightbutton menu
        END 
    END

Points Tab Left Panel Right Button Menu
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_TE01_FM_line    timeout=10    # Point line
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_TE01_FM_line    # Point line
    RPA.Desktop.Click    action=rightclick
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_RIGHT_BTN_menu    timeout=10    # Rightbutton menu  Dims: 233*410
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_RIGHT_BTN_menu    # Rightbutton menu


Points Tab Left Panel Right Button Menu Arguments-2
    [Arguments]    ${point_name}    ${menu_item}
    
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_TE01_FM_line    timeout=10    # Point line
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_TE01_FM_line    # Point line
    RPA.Desktop.Click    action=rightclick
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_RIGHT_BTN_menu    timeout=10    # Rightbutton menu  Dims: 233*410
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_RIGHT_BTN_menu    # Rightbutton menu


Points Tab Point Edit Form Global Point Arguments-2
    [Arguments]    ${remote_plc}    ${remote_pointname}
    ${section_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_point_edit_form_globalpoint_chkbx    timeout=10    # Global point checkbox
    IF    ${section_exists}==${True}
        RPA.Desktop.Click    alias:FXE_main_points_tab_point_edit_form_globalpoint_chkbx    # Global point select
        RPA.Desktop.Type Text    ${remote_plc}     # Remote PLC name
        RPA.Desktop.Press Keys    tab
        RPA.Desktop.Type Text    ${remote_pointname}    # Remote pointname
        # Sleep    3s
        RPA.Desktop.Click    alias:FXE_main_points_tab_point_edit_form_globalpoint_chkbx    # Global point deselect    
    END

Points Tab ALARM Point Edit Form Alarm Settings Argument-1
    [Arguments]    ${type}
    # ${type} 3 -> going through all options 
    ${section_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_point_tab_ALARM_edit_form_alarmsetting_section    timeout=10    # Alarm settings section
        IF    ${section_exists}==${True}
            IF    ${type}==3
                RPA.Desktop.Move Mouse    alias:FXE_main_point_tab_ALARM_edit_form_alarmsetting_section    # Alarm settings section
                RPA.Desktop.Click
                RPA.Desktop.Press Keys    down    # Limit
                RPA.Desktop.Press Keys    down    # Conflict
                RPA.Desktop.Press Keys    down    # Module
                # Sleep    3s
                RPA.Desktop.Press Keys    up     # Conflict
                RPA.Desktop.Press Keys    up     # Limit       
            END
        END


Points Tab Point Edit Form History Point Select
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_point_edit_form_history_chkbx    timeout=10    # History/Modbus Dims: 217*31 center:108*15
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_point_edit_form_history_chkbx
    RPA.Desktop.Click With Offset    x=-30    y=0    action=click    # History checkbox click


Points Tab Point Edit Form Modbus Point Select
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_point_edit_form_history_modbus_chkbx    timeout=10    # History/Modbus Dims: 217*31 center:108*15
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_point_edit_form_history_modbus_chkbx
    RPA.Desktop.Click With Offset    x=13    y=0    action=click    # Modbus checkbox click


Points Tab Point Edit Form OK-Apply-Cancel Buttons Argument-1    
    # 1->OK    2->Apply    3->Cancel
    [Arguments]    ${button}
        
    ${edit_form_buttons_exist}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_point_edit_form_btns    timeout=10    # Edit form "OK-Apply-Cancel" buttons Dims: 296*29
    
    IF    ${edit_form_buttons_exist}==${True}
        
        IF    ${button}==1
            RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_point_edit_form_btns    timeout=10    # Edit form "OK-Apply-Cancel" buttons Dims: 296*29
            RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_point_edit_form_btns    
            ## Sleep     5s
            RPA.Desktop.Click With Offset    x=-100    y=0    action=click    # OK button click

        ELSE IF    ${button}==2
            RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_point_edit_form_btns    timeout=10    # Edit form "OK-Apply-Cancel" buttons Dims: 296*29
            RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_point_edit_form_btns    
            ## Sleep    5s
            RPA.Desktop.Click With Offset    x=10    y=0    action=click    # APLLY button click

        ELSE    
            RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_point_edit_form_btns    timeout=10    # Edit form "OK-Apply-Cancel" buttons Dims: 296*29
            RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_point_edit_form_btns   
            ## Sleep    5s 
            RPA.Desktop.Click With Offset    x=100    y=0    action=click    # CANCEL button click

            RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_point_edit_form_save_form    timeout=10    # Save changes form
            RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_point_edit_form_save_form
            RPA.Desktop.Click With Offset    x=50    y=55    action=click    # Cancel button

        END
    END



Points Tab Point Edit Exit Form Keep-And-Add
    ${edit_exit_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_points_edit_exit_changed_form    timeout=10    # Importfilter save form
    Run Keyword If     ${edit_exit_form_exists}    RPA.Desktop.Press Keys    down
    Run Keyword If     ${edit_exit_form_exists}    RPA.Desktop.Press Keys    enter
    

Points Tab Point Edit Exit Form Rename
    ${edit_exit_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_points_edit_exit_changed_form    timeout=10    # Importfilter save form
    Run Keyword If     ${edit_exit_form_exists}    RPA.Desktop.Press Keys    enter


Points Tab Point Edit Exit Form Cancel
    ${edit_exit_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_points_edit_exit_changed_form    timeout=10    # Importfilter save form
    Run Keyword If     ${edit_exit_form_exists}    RPA.Desktop.Press Keys    down
    Run Keyword If     ${edit_exit_form_exists}    RPA.Desktop.Press Keys    down
    Run Keyword If     ${edit_exit_form_exists}    RPA.Desktop.Press Keys    enter

Points Tab Point Edit Exit Form Keep-Rename-Cancel Argument-1
    [Arguments]    ${button}

    ${edit_exit_form_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_points_edit_exit_changed_form    timeout=10    # Importfilter save form

    IF    ${edit_exit_form_exists}
        IF    ${button} == 2            # Rename button
            RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_points_edit_exit_changed_form  
            ## Sleep    5s 
            RPA.Desktop.Click With Offset    x=0    y=-30    action=click    # RENAME button click
            #RPA.Desktop.Press Keys    down
            #RPA.Desktop.Press Keys    enter
            # 
        ELSE IF    ${button} == 1       # Keep button
            #RPA.Desktop.Press Keys    enter
            RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_points_edit_exit_changed_form  
            ## Sleep    5s 
            RPA.Desktop.Click With Offset    x=0    y=30    action=click    # RENAME button click
        ELSE                            # Cancel button
            RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_points_edit_exit_changed_form  
            ## Sleep    5s 
            RPA.Desktop.Click With Offset    x=0    y=100    action=click    # RENAME button click
            #RPA.Desktop.Press Keys    down
            #RPA.Desktop.Press Keys    down
            #RPA.Desktop.Press Keys    enter
        END
    END


Points Tab Point Edit Form History Section Arguments-6
    [Arguments]    ${Sample_Max}=4000    ${Sample_Time}=20    ${Sample_Period}=Hour    ${Sample_Tolerance}=0.7    ${Energy_Channel}=No    ${Energy_Channel_Type}=None
    
    ${edit_history_section_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_DO_edit_form_history_section    timeout=10    # Point edit form - History section Dims: 500*122 center: 250*61


    IF    ${edit_history_section_exists}
        RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_DO_edit_form_history_section
        RPA.Desktop.Click With Offset    x=-200    y=-10    action=click    # Samples Max field
        RPA.Desktop.Press Keys    ctrl   a
        RPA.Desktop.Type Text    ${Sample_Max}
        RPA.Desktop.Press Keys    tab

        RPA.Desktop.Press Keys    ctrl   a
        RPA.Desktop.Type Text    ${Sample_Time}
        RPA.Desktop.Press Keys    tab

        IF    ${Sample_Period}=="Hour"
            RPA.Desktop.Press Keys    down
            RPA.Desktop.Press Keys    tab
        ELSE IF    ${Sample_Period}=="Days"
            RPA.Desktop.Press Keys    down
            RPA.Desktop.Press Keys    down
            RPA.Desktop.Press Keys    tab
        ELSE IF    ${Sample_Period}=="Seconds"
            RPA.Desktop.Press Keys    up
            RPA.Desktop.Press Keys    tab    
        ELSE
            RPA.Desktop.Press Keys    tab
        END

        RPA.Desktop.Press Keys    ctrl   a
        RPA.Desktop.Type Text    ${Sample_Tolerance}
        RPA.Desktop.Press Keys    tab
        RPA.Desktop.Press Keys    tab

        IF    ${Energy_Channel}=="Day"
            RPA.Desktop.Press Keys    down
            RPA.Desktop.Press Keys    tab

            IF   ${Energy_Channel_Type}=="Consumption"
                RPA.Desktop.Press Keys    down
                RPA.Desktop.Press Keys    tab
            END

        ELSE IF   ${Energy_Channel}=="Hour"
            RPA.Desktop.Press Keys    down
            RPA.Desktop.Press Keys    tab  
        ELSE
            RPA.Desktop.Press Keys    tab
        END

    END


Points Tab Point Edit Form Modbus Section Arguments-13
    [Arguments]    ${Register_Type}=3    ${Port}=4    ${Address}=20    ${Register}=1    ${Multiplier}=100    ${Bitmask}=${FALSE}    ${Size}=16    ${Group}=Group_1234    ${Float}=${TRUE}    ${Byte_Swap}=${TRUE}    ${Word_swap}=${TRUE}    ${Unsigned}=${TRUE}    ${Access}=3

    ${edit_modbus_section_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_DO_edit_form_modbus_section    timeout=10    # Point edit form - History section Dims: 505*229  center: 253*114

    IF    ${edit_modbus_section_exists}
        RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_DO_edit_form_modbus_section
        RPA.Desktop.Click With Offset    x=0    y=-65    action=click    # Register type drop-down
        RPA.Desktop.Type Text    ${Register_Type}
        RPA.Desktop.Press Keys    enter 

        RPA.Desktop.Press Keys    tab     # Address field
        RPA.Desktop.Type Text    ${Address}
        RPA.Desktop.Press Keys    tab

        RPA.Desktop.Press Keys    tab     # Start register field
        RPA.Desktop.Type Text    ${Register}

        RPA.Desktop.Press Keys    tab    # Size drop-down
        IF    ${Size}==32
            RPA.Desktop.Press Keys    down
            RPA.Desktop.Press Keys    tab
        ELSE IF    ${Size}==64
            RPA.Desktop.Press Keys    down
            RPA.Desktop.Press Keys    down
            RPA.Desktop.Press Keys    tab
        ELSE
            RPA.Desktop.Press Keys    tab
        END    
        
        # RPA.Desktop.Press Keys    tab    # Float checkbox
        IF    ${Float}==${TRUE}
            RPA.Desktop.Press Keys    space            
        END
        
        RPA.Desktop.Press Keys    tab    # Byte Swap checkbox
        IF    ${Byte_Swap}==${TRUE}
            RPA.Desktop.Press Keys    space            
        END
    
        RPA.Desktop.Press Keys    tab    # Word Swap checkbox
        IF    ${Word_Swap}==${TRUE}
            RPA.Desktop.Press Keys    space            
        END

        RPA.Desktop.Press Keys    tab    # Unsigned Swap checkbox
        IF    ${Unsigned}==${TRUE}
            RPA.Desktop.Press Keys    space            
        END
        
        RPA.Desktop.Press Keys    tab    # Bitmask checkbox
        IF    ${Bitmask}==${TRUE}
            RPA.Desktop.Press Keys    space            
        END

        RPA.Desktop.Press Keys    tab    # Access radio-button
        IF    ${Access}==2
            RPA.Desktop.Press Keys    down
            RPA.Desktop.Press Keys    tab
        ELSE IF    ${Access}==3
            RPA.Desktop.Press Keys    down
            RPA.Desktop.Press Keys    down
            RPA.Desktop.Press Keys    tab   
        ELSE
            RPA.Desktop.Press Keys    tab            
        END

        RPA.Desktop.Type Text    ${Port}    # Port number
        #RPA.Desktop.Press Keys    enter

        RPA.Desktop.Press Keys    tab     # Multiplier
        RPA.Desktop.Type Text    ${Multiplier}
        #RPA.Desktop.Press Keys    enter

        RPA.Desktop.Press Keys    tab     # Modbus group
        RPA.Desktop.Type Text    ${Group}

    END

Points Tab Left Panel CONTROL Mode Drop-Down Argument-1
    [Arguments]    ${mode}
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_CONTROL_edit_form_mode_ddwn    timeout=10    # Drop-down title
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_CONTROL_edit_form_mode_ddwn
    RPA.Desktop.Click With Offset    x=0    y=20    action=click    # Drop-down
    IF    ${mode}==0
        RPA.Desktop.Press Keys    down    # Cascade control
        ## Sleep    1s
        RPA.Desktop.Press Keys    down    # Compensation control
        ## Sleep    1s
        RPA.Desktop.Press Keys    up    # Cascade control
        ## Sleep    1s
        RPA.Desktop.Press Keys    up    # Constant value control
        
    END
    RPA.Desktop.Press Keys    enter

Points Tab Left Panel CONTROL Stages Set All Values Argument-1
    [Arguments]    ${mode}
    IF    ${mode} > 6
        ${mode} = 6
    END
    IF    ${mode} < 1
        ${mode} = 1
    END

    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_CONTROL_edit_form_stages_ddwn    timeout=10    # Stages Drop-down title
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_CONTROL_edit_form_stages_ddwn
    RPA.Desktop.Click With Offset    x=50    y=0    action=click    # Stages Drop-down
    # Sleep    1s
    
    RPA.Desktop.Type Text    ${mode}    # Stages used number in drop-down
    RPA.Desktop.Press Keys    enter
    ## Sleep    1s
    RPA.Desktop.Press Keys    tab    # Balance point drop-down
    ## Sleep    1s
    RPA.Desktop.Type Text    ${mode}    # Balance point number in drop-down
    ## Sleep    1s
    RPA.Desktop.Press Keys    tab    # Balance percent drop-down  
    ## Sleep    1s
    RPA.Desktop.Type Text    50
    ## Sleep    1s
    
    FOR    ${element}    IN RANGE    ${mode}
        RPA.Desktop.Press Keys    tab    # Return water stage checkbox
        ## Sleep    1s
        RPA.Desktop.Press Keys    tab    # Name field
        ## Sleep    1s
        RPA.Desktop.Type Text    CONTROL_stage_${element}    # Stage name 
        ## Sleep    1s
        RPA.Desktop.Press Keys    tab    # PBand
        ## Sleep    1s
        RPA.Desktop.Type Text    101    # PBand 
        ## Sleep    1s
        RPA.Desktop.Press Keys    tab    # AO point drop-down
        ## Sleep    1s
        #RPA.Desktop.Type Text    TE01_SS
        RPA.Desktop.Press Keys    down    # AO point drop-down
        ## Sleep    1s
        #RPA.Desktop.Press Keys    enter    # AO point drop-down
        ## Sleep    1s
        RPA.Desktop.Press Keys    tab    # Min output
        ## Sleep    1s
        RPA.Desktop.Type Text    11    # Min output
        ## Sleep    1s
        RPA.Desktop.Press Keys    tab    # Max output  
        ## Sleep    1s
        RPA.Desktop.Type Text    91    # Max output  
        ## Sleep    1s
        RPA.Desktop.Press Keys    tab    # Off state value  
        ## Sleep    1s
        RPA.Desktop.Type Text    51    # Off state value   
        ## Sleep    1s
        RPA.Desktop.Press Keys    tab    # Outdoor temp limit
        ## Sleep    1s
        RPA.Desktop.Type Text    -91    # Outdoor temp limit
        ## Sleep    1s
        RPA.Desktop.Press Keys    tab    # Outdoor temp PBand  
        ## Sleep    1s
        RPA.Desktop.Type Text    101    # Outdoor temp PBand
        ## Sleep    1s

        RPA.Desktop.Press Keys    tab    # Limit value
        ## Sleep    1s 
        RPA.Desktop.Type Text    1    # Limit value
        ## Sleep    1s
        RPA.Desktop.Press Keys    tab    # Limit measurement drop-down
        ## Sleep    1s
        #RPA.Desktop.Type Text    TE01_MV
        RPA.Desktop.Press Keys    down    # Limit measurement
        ## Sleep    1s
        #RPA.Desktop.Press Keys    enter 
        ## Sleep    1s       
        RPA.Desktop.Press Keys    tab    # P-band
        ## Sleep    1s
        RPA.Desktop.Type Text    1001    # P-band
        ## Sleep    1s
        RPA.Desktop.Press Keys    tab    # Type drop-down 
        ## Sleep    1s
        RPA.Desktop.Press Keys    down    # Type drop-down
        ## Sleep    1s 
        RPA.Desktop.Press Keys    down    # Type drop-down
        ## Sleep    1s
        RPA.Desktop.Press Keys    down    # Type drop-down 
        ## Sleep    1s
        
    END

### DIFFERENT POINT TYPES EDIT FORMS
    
Points Tab Left Panel DO Right Button Edit Argument-1

    [Arguments]    ${pointname}
    Points Filter Name Filter Field Select Argument-1    ${pointname}
    Points Tab Left Panel First Line Right Button Menu
    RPA.Desktop.Click With Offset    x=0    y=195    action=click     # Edit 
    #RPA.Desktop.Press Keys    enter
    # Sleep    1s
    # ${error_message}=    Run Keyword And Return Status    Wait For Element    alias:FXE_main_points_edit_property_missing_error_form    timeout=10    # Message if state text is missing
    # IF    ${error_message}
    #     RPA.Desktop.Press Keys    enter    # Error message
    # END

    #RPA.Desktop.Click    alias:FXE_main_OK_noicon_form_btn
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_DO_edit_form    timeout=10    # DO point edit form   Dims: 524*646  center: 262*323
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_DO_edit_form    # DO point edit form
    RPA.Desktop.Click With Offset    x=0    y=-220    action=click    # Pointname field
    RPA.Desktop.Press Keys    ctrl    a
    RPA.Desktop.Type Text    ${pointname}  # Point name field
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Press Keys    tab
 
    #RPA.Desktop.Press Keys    ctrl    a    # Point text field
    RPA.Desktop.Type Text    ${pointname} text Field    
    RPA.Desktop.Press Keys    tab    # Picture field
    RPA.Desktop.Press Keys    tab    # Auto checkbox
    RPA.Desktop.Press Keys    space
   
    #RPA.Desktop.Press Keys    tab    # History point checkbox
    Points Tab Point Edit Form History Point Select
    Points Tab Point Edit Form History Section Arguments-6   3000    15    "Seconds"    0.6    "Day"    "Consumption"
    # Sleep    3s
    Points Tab Point Edit Form History Point Select
   
    Points Tab Point Edit Form Modbus Point Select
    Points Tab Point Edit Form Modbus Section Arguments-13    "6"    "10"    "247"    "40001"    "100"    ${FALSE}    16    Group_1234    ${TRUE}    ${TRUE}    ${TRUE}    ${TRUE}    3
    # ${Register_Type}=3    ${Port}=4    ${Address}=20    ${Register}=1    ${Multiplier}=100    ${Bitmask}=${FALSE}    ${Size}=16    ${Group}=Group_1234    ${Float}=${TRUE}    ${Byte_Swap}=${TRUE}    ${Word_swap}=${TRUE}    ${Unsigned}=${TRUE}    ${Access}=3
    Points Tab Point Edit Form Modbus Point Select

    #RPA.Desktop.Press Keys    tab    # Modbus point checkbox

    RPA.Desktop.Press Keys    tab    # Port module drop-down
    RPA.Desktop.Press Keys    tab    # Point connect drop-down
    RPA.Desktop.Press Keys    tab    # Global point checkbox

    RPA.Desktop.Press Keys    tab    # 230V checkbox
    RPA.Desktop.Press Keys    tab    # Include point to label list checkbox
    RPA.Desktop.Press Keys    tab    # Physical point checkbox
    RPA.Desktop.Press Keys    space    # checkbox select


    RPA.Desktop.Press Keys    tab    # Multi24 checkbox

    RPA.Desktop.Press Keys    tab    # Start deyay (sec) field
    RPA.Desktop.Type Text    10  
    
    RPA.Desktop.Press Keys    tab    # Stop delay (sec) field
    RPA.Desktop.Type Text    10

    RPA.Desktop.Press Keys    tab    # Tristate checkbox
    RPA.Desktop.Press Keys    tab    # Default value in module dropbox ("Old value" is lowest value -up-> "Off" -up-> "On")

    RPA.Desktop.Press Keys    tab    # State text drop-down
    RPA.Desktop.Press Keys    tab    # Time scedule drop-down
    
    RPA.Desktop.Press Keys    tab    # BACnet server object

    #RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_point_edit_form_btns    timeout=10    # Edit form "OK-Apply-Cancel" buttons Dims: 296*29
    #RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_point_edit_form_btns    
    #RPA.Desktop.Click With Offset    x=-100    y=0    action=click    # OK button click
    # Sleep    3s
    Points Tab Point Edit Form OK-Apply-Cancel Buttons Argument-1    1    # 1=OK, 2=APPLY, other=Cancel
    # Sleep    3s
    Points Tab Point Edit Exit Form Keep-Rename-Cancel Argument-1    2    # 1=Keep, 2=APPLY, other=Cancel
    

Points Tab Left Panel ALARM Right Button Edit Argument-1

    [Arguments]    ${pointname}
    
    Points Filter Name Filter Field Select Argument-1    ${pointname}
    Points Tab Left Panel First Line Right Button Menu

    RPA.Desktop.Click With Offset    x=0    y=195    action=click     # Edit feature
    # Sleep    1s
    ${error_message}=    Run Keyword And Return Status    Wait For Element    alias:FXE_main_points_edit_property_missing_error_form    timeout=10    # Message if state text is missing
    IF    ${error_message}
        RPA.Desktop.Press Keys    enter    # Error message
    END

    # RPA.Desktop.Press Keys    enter    # Error 
    #RPA.Desktop.Click    alias:FXE_main_OK_noicon_form_btn

    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_ALARM_edit_form    timeout=10    # ALARM point edit form   Dims: 968*555  center: 484*277
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_ALARM_edit_form    # ALARM point edit form
    RPA.Desktop.Click    
    RPA.Desktop.Press Keys    ctrl    a
    RPA.Desktop.Type Text    ${pointname}  # Point name field
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Press Keys    tab
 
    #RPA.Desktop.Press Keys    ctrl    a    # Point text field
    RPA.Desktop.Type Text    ${pointname} text Field    
    RPA.Desktop.Press Keys    tab    # Picture field
    RPA.Desktop.Press Keys    tab    # Auto checkbox
    RPA.Desktop.Press Keys    space    # Auto checkbox select
   
    #RPA.Desktop.Press Keys    tab    # History point checkbox
    Points Tab Point Edit Form History Point Select    # Select checkbox
    Points Tab Point Edit Form History Section Arguments-6   3000    15    "Seconds"    0.6    "Day"    "Consumption"
    # Sleep    3s
    Points Tab Point Edit Form History Point Select    # Checkbox deselect
   
    Points Tab Point Edit Form Modbus Point Select    # Select checkbox
    Points Tab Point Edit Form Modbus Section Arguments-13    "6"    "10"    "247"    "40001"    "100"    ${FALSE}    16    Group_1234    ${TRUE}    ${TRUE}    ${TRUE}    ${TRUE}    3
    # ${Register_Type}=3    ${Port}=4    ${Address}=20    ${Register}=1    ${Multiplier}=100    ${Bitmask}=${FALSE}    ${Size}=16    ${Group}=Group_1234    ${Float}=${TRUE}    ${Byte_Swap}=${TRUE}    ${Word_swap}=${TRUE}    ${Unsigned}=${TRUE}    ${Access}=3
    Points Tab Point Edit Form Modbus Point Select    # Checkbox deselect

    #RPA.Desktop.Press Keys    tab    # Modbus point checkbox

    RPA.Desktop.Press Keys    tab    # Port module drop-down
    RPA.Desktop.Press Keys    tab    # Point connect drop-down
    RPA.Desktop.Press Keys    tab    # Global point checkbox

    RPA.Desktop.Press Keys    tab    # Include point to label list checkbox
    RPA.Desktop.Press Keys    tab    # Physical point checkbox
    RPA.Desktop.Press Keys    space    # checkbox select

    RPA.Desktop.Press Keys    tab    # Multi24 checkbox

    RPA.Desktop.Press Keys    tab    # Alarm group drop-down
    RPA.Desktop.Press Keys    down    # A-ALARM line
    RPA.Desktop.Press Keys    tab    # Priority drop-down
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    down    #  0->1->2
    RPA.Desktop.Press Keys    tab     # Alerta

    RPA.Desktop.Press Keys    tab     # Save to log (activated by default)
    RPA.Desktop.Press Keys    tab     # Name of overriding point drop-down
    RPA.Desktop.Press Keys    tab     # Override to off state
    RPA.Desktop.Press Keys    tab     # Help of alarm drop-down
    RPA.Desktop.Press Keys    down    # text
    RPA.Desktop.Press Keys    tab     # Text field
    RPA.Desktop.Type Text    Alarm help text
    
    RPA.Desktop.Press Keys    tab    # Alarm settings (Normal)
    RPA.Desktop.Press Keys    tab    # Start delay
    RPA.Desktop.Type Text    123

    RPA.Desktop.Press Keys    tab    # Stop delay
    RPA.Desktop.Type Text    321
    RPA.Desktop.Press Keys    tab    # Normally closed contact
    RPA.Desktop.Press Keys    space     # Select checkbox

    RPA.Desktop.Press Keys    tab     # State text drop-down
    RPA.Desktop.Press Keys    up     # select another state text
    RPA.Desktop.Press Keys    up 
   
    RPA.Desktop.Press Keys    tab    # BACnet server object
    Points Tab ALARM Point Edit Form Alarm Settings Argument-1    3

    #RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_point_edit_form_btns    timeout=10    # Edit form "OK-Apply-Cancel" buttons Dims: 296*29
    #RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_point_edit_form_btns    
    #RPA.Desktop.Click With Offset    x=-100    y=0    action=click    # OK button click
    
    # Sleep    3s
    Points Tab Point Edit Form OK-Apply-Cancel Buttons Argument-1    1    # 1=OK, 2=APPLY, other=Cancel
    # Sleep    3s
    Points Tab Point Edit Exit Form Keep-Rename-Cancel Argument-1    2    # 1=Keep, 2=APPLY, other=Cancel
    

Points Tab Left Panel DI Right Button Edit Argument-1

    [Arguments]    ${pointname}
    
    Points Filter Name Filter Field Select Argument-1    ${pointname}
    Points Tab Left Panel First Line Right Button Menu

    RPA.Desktop.Click With Offset    x=0    y=195    action=click     # Edit feature
    # Sleep    1s
    ${error_message}=    Run Keyword And Return Status    Wait For Element    alias:FXE_main_points_edit_property_missing_error_form    timeout=10    # Message if state text is missing
    IF    ${error_message}
        Sleep    ${SLEEP_TIMEOUT_DEFAULT}
        RPA.Desktop.Press Keys    enter    # Error message
    END
    #RPA.Desktop.Press Keys    enter
    #RPA.Desktop.Click    alias:FXE_main_OK_noicon_form_btn

    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_DI_edit_form    timeout=10    # DI point edit form   Dims: 520*697  center: 260*299
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_DI_edit_form    # DI point edit form

    RPA.Desktop.Click    
    RPA.Desktop.Press Keys    ctrl    a
    RPA.Desktop.Type Text    ${pointname}  # Point name field
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Press Keys    tab
 
    #RPA.Desktop.Press Keys    ctrl    a    # Point text field
    RPA.Desktop.Type Text    ${pointname} text Field    
    RPA.Desktop.Press Keys    tab    # Picture field
    RPA.Desktop.Press Keys    tab    # Auto checkbox
    RPA.Desktop.Press Keys    space    # Auto checkbox select
   
    #RPA.Desktop.Press Keys    tab    # History point checkbox
    Points Tab Point Edit Form History Point Select    # Select checkbox
    Points Tab Point Edit Form History Section Arguments-6   3000    15    "Seconds"    0.6    "Day"    "Consumption"
    # Sleep    3s
    Points Tab Point Edit Form History Point Select    # Checkbox deselect
   
    Points Tab Point Edit Form Modbus Point Select    # Select checkbox
    Points Tab Point Edit Form Modbus Section Arguments-13    "6"    "10"    "247"    "40001"    "100"    ${FALSE}    16    Group_1234    ${TRUE}    ${TRUE}    ${TRUE}    ${TRUE}    3
    # ${Register_Type}=3    ${Port}=4    ${Address}=20    ${Register}=1    ${Multiplier}=100    ${Bitmask}=${FALSE}    ${Size}=16    ${Group}=Group_1234    ${Float}=${TRUE}    ${Byte_Swap}=${TRUE}    ${Word_swap}=${TRUE}    ${Unsigned}=${TRUE}    ${Access}=3
    Points Tab Point Edit Form Modbus Point Select    # Checkbox deselect

    #RPA.Desktop.Press Keys    tab    # Modbus point checkbox

    RPA.Desktop.Press Keys    tab    # Port module drop-down
    RPA.Desktop.Press Keys    tab    # Point connect drop-down
    RPA.Desktop.Press Keys    tab    # Global point checkbox

    #RPA.Desktop.Press Keys    space    # Global point checkbox select
    Points Tab Point Edit Form Global Point Arguments-2    PLC_1    PLC_1_TE01_I
    #${section_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_point_edit_form_globalpoint_chkbx    timeout=5    # Global point checkbox
    #IF    ${section_exists}
    #   RPA.Desktop.Click    alias:FXE_main_points_tab_point_edit_form_globalpoint_chkbx    # Global point deselect
    #END


    RPA.Desktop.Press Keys    tab    # Include point to label list checkbox
    RPA.Desktop.Press Keys    space    # checkbox select
    RPA.Desktop.Press Keys    tab    # Physical point checkbox
    RPA.Desktop.Press Keys    space    # checkbox select
   
    RPA.Desktop.Press Keys    tab    # Multi24 checkbox
    
    RPA.Desktop.Press Keys    tab    # Start delay
    RPA.Desktop.Type Text    123

    RPA.Desktop.Press Keys    tab    # Stop delay
    RPA.Desktop.Type Text    321
    RPA.Desktop.Press Keys    tab    # Normally closed contact
    RPA.Desktop.Press Keys    space     # Select checkbox

    RPA.Desktop.Press Keys    tab     # Tristate checkbox
    RPA.Desktop.Press Keys    tab    # State text drop-down
    RPA.Desktop.Press Keys    up     # select another state text
       
    RPA.Desktop.Press Keys    tab    # BACnet server object
    
    # Sleep    3s
    Points Tab Point Edit Form OK-Apply-Cancel Buttons Argument-1    1    # 1=OK, 2=APPLY, other=Cancel
    # Sleep    3s
    Points Tab Point Edit Exit Form Keep-Rename-Cancel Argument-1    2    # 1=Keep, 2=APPLY, other=Cancel
    


Points Tab Left Panel AI Right Button Edit Arguments-2

    [Arguments]    ${pointname}    ${history}
    
    Points Filter Name Filter Field Select Argument-1    ${pointname}
    Points Tab Left Panel First Line Right Button Menu

    RPA.Desktop.Click With Offset    x=0    y=195    action=click     # Edit feature
    # Sleep    1s
    ${error_message}=    Run Keyword And Return Status    Wait For Element    alias:FXE_main_points_edit_property_missing_error_form    timeout=10    # Message if state text is missing
    IF    ${error_message}
        RPA.Desktop.Press Keys    enter    # Error message
    END
    #RPA.Desktop.Press Keys    enter
    #RPA.Desktop.Click    alias:FXE_main_OK_noicon_form_btn

    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_AI_edit_form    timeout=10    # AI point edit form   Dims: 959*578  center:480*290
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_AI_edit_form    # AI point edit form
    RPA.Desktop.Click    
    RPA.Desktop.Press Keys    ctrl    a
    RPA.Desktop.Type Text    ${pointname}  # Point name field
    RPA.Desktop.Press Keys    tab    # View
    RPA.Desktop.Press Keys    tab    # Manual
    RPA.Desktop.Press Keys    tab    # Prog
    RPA.Desktop.Press Keys    tab    # Point text field
 
    #RPA.Desktop.Press Keys    ctrl    a    # Point text field
    RPA.Desktop.Type Text    ${pointname} text Field    
    RPA.Desktop.Press Keys    tab    # Picture field
    RPA.Desktop.Press Keys    tab    # Auto checkbox
    RPA.Desktop.Press Keys    space    # Auto checkbox select
   
    #RPA.Desktop.Press Keys    tab    # History point checkbox
    Points Tab Point Edit Form History Point Select    # Select checkbox
    Points Tab Point Edit Form History Section Arguments-6   3000    15    "Seconds"    0.6    "Day"    "Consumption"
    # Sleep    3s
    
    IF    ${history} != 1
        Points Tab Point Edit Form History Point Select    # Checkbox deselect
    END
   
    # Points Tab Point Edit Form Modbus Point Select    # Select checkbox
    
    Points Tab Point Edit Form Modbus Section Arguments-13    "6"    "10"    "247"    "40001"    "100"    ${FALSE}    16    Group_1234    ${TRUE}    ${TRUE}    ${TRUE}    ${TRUE}    3
    # ${Register_Type}=3    ${Port}=4    ${Address}=20    ${Register}=1    ${Multiplier}=100    ${Bitmask}=${FALSE}    ${Size}=16    ${Group}=Group_1234    ${Float}=${TRUE}    ${Byte_Swap}=${TRUE}    ${Word_swap}=${TRUE}    ${Unsigned}=${TRUE}    ${Access}=3
    Points Tab Point Edit Form Modbus Point Select    # Checkbox deselect

    #RPA.Desktop.Press Keys    tab    # Modbus point checkbox
    RPA.Desktop.Press Keys    tab    # Port module drop-down
    RPA.Desktop.Press Keys    tab    # Point connect drop-down
    RPA.Desktop.Press Keys    tab    # Global point checkbox

    #RPA.Desktop.Press Keys    space    # Global point checkbox select
    Points Tab Point Edit Form Global Point Arguments-2    PLC_1    PLC_1_TE01_I
    #${section_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_point_edit_form_globalpoint_chkbx    timeout=5    # Global point checkbox
    #IF    ${section_exists}
    #   RPA.Desktop.Click    alias:FXE_main_points_tab_point_edit_form_globalpoint_chkbx    # Global point deselect
    #END

    RPA.Desktop.Press Keys    tab    # Include point to label list checkbox
    RPA.Desktop.Press Keys    tab    # Physical point checkbox
    RPA.Desktop.Press Keys    space    # checkbox select

    RPA.Desktop.Press Keys    tab    # Multi24 checkbox
    
    RPA.Desktop.Press Keys    tab    # Set value
    RPA.Desktop.Press Keys    tab    # Type drop-down (Analog default)
    RPA.Desktop.Press Keys    up    # Type change (Analog -> Counter)
    ${error_exists}=    Run Keyword And Return Status    Wait For Element    alias:FXE_main_argument_out_error_msg    timeout=10    # Argument out of range error message
    IF    ${error_exists}
        RPA.Desktop.Press Keys    enter    # Closing error message            
    END
    RPA.Desktop.Press Keys    down    # Type Changing to Analog
    ${error_exists}=    Run Keyword And Return Status    Wait For Element    alias:FXE_main_argument_out_error_msg    timeout=10    # Argument out of range error message
    IF    ${error_exists}
        RPA.Desktop.Press Keys    enter    # Closing error message            
    END
    RPA.Desktop.Press Keys    tab    # Sample time
    RPA.Desktop.Press Keys    tab    # Time constant
    RPA.Desktop.Press Keys    tab    # Unit drop-down
    FOR    ${element}    IN    17
        RPA.Desktop.Press Keys    down     # C select
    END
    RPA.Desktop.Press Keys    tab    # Decimals
    FOR    ${element}    IN    3
        RPA.Desktop.Press Keys    down     # 4 line select
    END
    RPA.Desktop.Press Keys    tab    # Tolerance
    RPA.Desktop.Press Keys    tab    # Offset

    RPA.Desktop.Press Keys    tab    # Lookup table
    FOR    ${element}    IN    26
        RPA.Desktop.Press Keys    down     # 26 line select (NTC10)
    END

    RPA.Desktop.Press Keys    tab    # Runtime point
    RPA.Desktop.Press Keys    down     # 2 line select

    RPA.Desktop.Press Keys    tab     # Limit #1 name
    RPA.Desktop.Type Text    Limit_1
    ## Sleep    1s
    RPA.Desktop.Press Keys    down    # Limit #2    name
    RPA.Desktop.Type Text    Limit_2
    ## Sleep    1s
    RPA.Desktop.Press Keys    down    # Limit #3    name
    RPA.Desktop.Type Text    Limit_3
    ## Sleep    1s
    RPA.Desktop.Press Keys    down    # Limit #4    name
    RPA.Desktop.Type Text    Limit_4
    ## Sleep    1s
    RPA.Desktop.Press Keys    down    # Limit #4    name
    RPA.Desktop.Type Text    Limit_5
    ## Sleep    1s
    RPA.Desktop.Press Keys    down    # Limit #4    name
    RPA.Desktop.Type Text    Limit_6
    ## Sleep    1s
    RPA.Desktop.Press Keys    down    # Limit #4    name
    RPA.Desktop.Type Text    Limit_7
    ## Sleep    1s
    RPA.Desktop.Press Keys    down    # Limit #4    name
    RPA.Desktop.Type Text    Limit_8
    ## Sleep    1s
    RPA.Desktop.Press Keys    enter     # Names finished
    RPA.Desktop.Press Keys    right     # Limit #8    value
    RPA.Desktop.Type Text    1.23    # Limit #8    value
    ## Sleep    1s
    RPA.Desktop.Press Keys    up    # Limit #7    value
    RPA.Desktop.Type Text    2.34    # Limit #7    value
    ## Sleep    1s
    RPA.Desktop.Press Keys    up    # Limit #6   value
    RPA.Desktop.Type Text    3.45    # Limit #6    value
    ## Sleep    1s
    RPA.Desktop.Press Keys    up    # Limit #5    value
    RPA.Desktop.Type Text    4.56    # Limit #5    value
    ## Sleep    1s
    RPA.Desktop.Press Keys    up    # Limit #4    value
    RPA.Desktop.Type Text    5.67    # Limit #4    value
    ## Sleep    1s
    RPA.Desktop.Press Keys    up    # Limit #3    value
    RPA.Desktop.Type Text    6.78    # Limit #3    value
    ## Sleep    1s
    RPA.Desktop.Press Keys    up    # Limit #2    value
    RPA.Desktop.Type Text    7.89    # Limit #2    value
    ## Sleep    1s
    RPA.Desktop.Press Keys    up    # Limit #1    value
    RPA.Desktop.Type Text    8.90    # Limit #1    value
    ## Sleep    1s
    RPA.Desktop.Press Keys    tab    # BACnet server object

    # Sleep    3s
    Points Tab Point Edit Form OK-Apply-Cancel Buttons Argument-1    1    # 1=OK, 2=APPLY, other=Cancel
    # Sleep    3s
    Points Tab Point Edit Exit Form Keep-Rename-Cancel Argument-1    2    # 1=Keep, 2=APPLY, other=Cancel
    



Points Tab Left Panel AO Right Button Edit Arguments-2

    [Arguments]    ${pointname}    ${history}
    
    Points Filter Name Filter Field Select Argument-1    ${pointname}
    Points Tab Left Panel First Line Right Button Menu

    RPA.Desktop.Click With Offset    x=0    y=195    action=click     # Edit feature
    # Sleep    1s
    # ${error_message}=    Run Keyword And Return Status    Wait For Element    alias:FXE_main_points_edit_property_missing_error_form    timeout=10    # Message if state text is missing
    # IF    ${error_message}
    #     RPA.Desktop.Press Keys    enter    # Error message
    # END
    #RPA.Desktop.Press Keys    enter
    #RPA.Desktop.Click    alias:FXE_main_OK_noicon_form_btn

    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_AO_edit_form    timeout=10    # AI point edit form   Dims: 959*578  center:480*290
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_AO_edit_form    # AI point edit form
    RPA.Desktop.Click With Offset    x=0    y=-200    action=click     # Point name field   
    RPA.Desktop.Press Keys    ctrl    a
    RPA.Desktop.Type Text    ${pointname}  # Point name field
    RPA.Desktop.Press Keys    tab    # View
    RPA.Desktop.Press Keys    tab    # Manual
    RPA.Desktop.Press Keys    tab    # Prog
    RPA.Desktop.Press Keys    tab    # Point text field
 
    #RPA.Desktop.Press Keys    ctrl    a    # Point text field
    RPA.Desktop.Type Text    ${pointname} text Field    
    RPA.Desktop.Press Keys    tab    # Picture field
    RPA.Desktop.Press Keys    tab    # Auto checkbox
    RPA.Desktop.Press Keys    space    # Auto checkbox select
   
    #RPA.Desktop.Press Keys    tab    # History point checkbox
    Points Tab Point Edit Form History Point Select    # Select checkbox
    Points Tab Point Edit Form History Section Arguments-6   3000    15    "Seconds"    0.6    "Day"    "Consumption"
    # Sleep    3s
    IF    ${history} != 1
        Points Tab Point Edit Form History Point Select    # Checkbox deselect
    END
   
    Points Tab Point Edit Form Modbus Point Select    # Select checkbox
    Points Tab Point Edit Form Modbus Section Arguments-13    "6"    "10"    "247"    "40001"    "100"    ${FALSE}    16    Group_1234    ${TRUE}    ${TRUE}    ${TRUE}    ${TRUE}    3
    # ${Register_Type}=3    ${Port}=4    ${Address}=20    ${Register}=1    ${Multiplier}=100    ${Bitmask}=${FALSE}    ${Size}=16    ${Group}=Group_1234    ${Float}=${TRUE}    ${Byte_Swap}=${TRUE}    ${Word_swap}=${TRUE}    ${Unsigned}=${TRUE}    ${Access}=3
    Points Tab Point Edit Form Modbus Point Select    # Checkbox deselect

    #RPA.Desktop.Press Keys    tab    # Modbus point checkbox
    RPA.Desktop.Press Keys    tab    # Port module drop-down
    RPA.Desktop.Press Keys    tab    # Point connect drop-down
    RPA.Desktop.Press Keys    tab    # Global point checkbox

    #RPA.Desktop.Press Keys    space    # Global point checkbox select
    Points Tab Point Edit Form Global Point Arguments-2    PLC_1    PLC_1_TE01_I
    #${section_exists}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_point_edit_form_globalpoint_chkbx    timeout=5    # Global point checkbox
    #IF    ${section_exists}
    #   RPA.Desktop.Click    alias:FXE_main_points_tab_point_edit_form_globalpoint_chkbx    # Global point deselect
    #END

    RPA.Desktop.Press Keys    tab    # Include point to label list checkbox
    RPA.Desktop.Press Keys    tab    # Physical point checkbox
    RPA.Desktop.Press Keys    space    # checkbox select

    RPA.Desktop.Press Keys    tab    # Multi24 checkbox
    
    RPA.Desktop.Press Keys    tab    # Min voltage
    RPA.Desktop.Type Text    2.2    
    RPA.Desktop.Press Keys    tab    # Max Voltage
    RPA.Desktop.Type Text    8.8

    RPA.Desktop.Press Keys    tab    # Sample time
    RPA.Desktop.Type Text    10

    RPA.Desktop.Press Keys    tab    # Tolerance
    RPA.Desktop.Type Text    0.5

    RPA.Desktop.Press Keys    tab    # Default value drop-down (Old value default)
    RPA.Desktop.Press Keys    down    # Old value
    RPA.Desktop.Press Keys    tab    # Value
    RPA.Desktop.Type Text    3.3

    # Sleep    3s
    Points Tab Point Edit Form OK-Apply-Cancel Buttons Argument-1  1    # 1=OK, 2=APPLY, other=Cancel
    # Sleep    3s
    Points Tab Point Edit Exit Form Keep-Rename-Cancel Argument-1    2    # 1=Keep, 2=APPLY, other=Cancel
    

Points Tab Left Panel CONTROL Right Button Edit Argument-1

    [Arguments]    ${pointname}
    
    Points Filter Name Filter Field Select Argument-1    ${pointname}
    Points Tab Left Panel First Line Right Button Menu

    RPA.Desktop.Click With Offset    x=0    y=195    action=click     # Edit feature
    # Sleep    1s
    # ${error_message}=    Run Keyword And Return Status    Wait For Element    alias:FXE_main_points_edit_property_missing_error_form    timeout=10    # Message if state text is missing
    # IF    ${error_message}
    #     RPA.Desktop.Press Keys    enter    # Error message
    # END
    #RPA.Desktop.Press Keys    enter
    #RPA.Desktop.Click    alias:FXE_main_OK_noicon_form_btn

    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_CONTROL_edit_form    timeout=10    # CONTROL point edit form   Dims: 959*578  center:480*290
    # RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_CONTROL_edit_form    # CONTROL point edit form
    
    # RPA.Desktop.Wait For Element    alias:alias:FXE_main_points_tab_POINTNAME_txt    timeout=5
    # RPA.Desktop.Click With Offset    alias:alias:FXE_main_points_tab_POINTNAME_txt    x=0    y=10    action=click    
    RPA.Desktop.Click With Offset    alias:FXE_main_points_tab_CONTROL_edit_form    x=-400    y=-250    action=click    # Pointname field   
    RPA.Desktop.Press Keys    ctrl    a
    RPA.Desktop.Type Text    ${pointname}  # Point name field
    RPA.Desktop.Press Keys    tab    # View
    RPA.Desktop.Press Keys    tab    # Manual
    RPA.Desktop.Press Keys    tab    # Prog
    RPA.Desktop.Press Keys    tab    # Point text field
 
    #RPA.Desktop.Press Keys    ctrl    a    # Point text field
    RPA.Desktop.Type Text    ${pointname} text Field    
    RPA.Desktop.Press Keys    tab    # Picture field
    RPA.Desktop.Type Text    NEW.htm
    RPA.Desktop.Press Keys    tab    # Auto checkbox
    RPA.Desktop.Press Keys    space    # Auto checkbox select
   
    RPA.Desktop.Press Keys    tab    # History point checkbox
    #Points Tab Point Edit Form History Point Select    # Select checkbox
    #Points Tab Point Edit Form History Section Arguments-6   3000    15    "Seconds"    0.6    "Day"    "Consumption"
    ## Sleep    5s
    #Points Tab Point Edit Form History Point Select    # Checkbox deselect
   
    #Points Tab Point Edit Form Modbus Point Select    # Select checkbox
    #Points Tab Point Edit Form Modbus Section Arguments-13    "6"    "10"    "247"    "40001"    "100"    ${FALSE}    16    Group_1234    ${TRUE}    ${TRUE}    ${TRUE}    ${TRUE}    3
    # ${Register_Type}=3    ${Port}=4    ${Address}=20    ${Register}=1    ${Multiplier}=100    ${Bitmask}=${FALSE}    ${Size}=16    ${Group}=Group_1234    ${Float}=${TRUE}    ${Byte_Swap}=${TRUE}    ${Word_swap}=${TRUE}    ${Unsigned}=${TRUE}    ${Access}=3
    #Points Tab Point Edit Form Modbus Point Select    # Checkbox deselect

    #RPA.Desktop.Press Keys    tab    # Modbus point checkbox
    
    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_CONTROL_edit_form_main_measurement_ddwn    timeout=10    #  Main measurement  drop-down 
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_CONTROL_edit_form_main_measurement_ddwn       # Main measurement drop-down
    RPA.Desktop.Click With Offset    x=0    y=0    action=click
    #RPA.Desktop.Press Keys    enter    # Main measurement pointname
    #RPA.Desktop.Press Keys    tab    # Main measurement drop-down
    RPA.Desktop.Press Keys    right    # Main measurement pointname
    RPA.Desktop.Press Keys    enter    # Main measurement pointname
    ## Sleep    3s
    RPA.Desktop.Press Keys    tab    # Outdoor drop-down
    RPA.Desktop.Press Keys    right    # Outdoor measurement pointname
    ## Sleep    3s
    RPA.Desktop.Press Keys    tab    # Indication point drop-down
    RPA.Desktop.Press Keys    right    # Indication pointname
    ## Sleep    3s
    RPA.Desktop.Press Keys    tab    # Default value
    RPA.Desktop.Type Text    58    # Default value
    ## Sleep    3s
    RPA.Desktop.Press Keys    tab    # Copy manual to default value
    RPA.Desktop.Press Keys    space    # checkbox select
    ## Sleep    3s
    RPA.Desktop.Press Keys    tab    # Slow speed factor
    RPA.Desktop.Type Text    3    # value
    ## Sleep    3s
    RPA.Desktop.Press Keys    tab    # Integration time
    RPA.Desktop.Type Text    180    # value
    ## Sleep    3s
    RPA.Desktop.Press Keys    tab    # I term sensitivity
    RPA.Desktop.Type Text    0.5    # value
    ## Sleep    3s
    RPA.Desktop.Press Keys    tab    # Execution interval time
    RPA.Desktop.Type Text    10    # value
    ## Sleep    3s
    RPA.Desktop.Press Keys    tab    # Cooling dead zone
    RPA.Desktop.Type Text    2    # value
    ## Sleep    3s

    Points Tab Left Panel CONTROL Mode Drop-Down Argument-1    0
    # Sleep    3s

    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_CONTROL_edit_form_unit_ddwn    timeout=10    # Unit drop-down
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_CONTROL_edit_form_unit_ddwn
    RPA.Desktop.Click With Offset    x=30    y=0    action=click

    #RPA.Desktop.Press Keys    tab    # Unit drop-down
    FOR    ${element}    IN RANGE    17
        RPA.Desktop.Press Keys    down     # C select
        ## Sleep    1s
    END
    RPA.Desktop.Press Keys    enter
    
    #RPA.Desktop.Press Keys    down
    #RPA.Desktop.Press Keys    down
    #RPA.Desktop.Press Keys    down
    ## Sleep    3s
    #RPA.Desktop.Press Keys    tab


    #RPA.Desktop.Press Keys    enter

    RPA.Desktop.Press Keys    tab    # Decimals
    #FOR    ${element}    IN    3
    #    RPA.Desktop.Press Keys    down     # 4 line select
    #    # Sleep    1s
    #END
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    down
    ## Sleep    3s

    #RPA.Desktop.Press Keys    enter

    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_CONTROL_edit_form_statetext_ddwn    timeout=10    # State text drop-down
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_CONTROL_edit_form_statetext_ddwn
    RPA.Desktop.Click With Offset    x=0    y=30    action=click

    ## Sleep    3s
    #RPA.Desktop.Press Keys    tab    # State text drop-down
    RPA.Desktop.Press Keys    down    # 
    RPA.Desktop.Press Keys    down    # 
    RPA.Desktop.Press Keys    down    # State text
    
    ## Sleep   3s
    RPA.Desktop.Press Keys    enter
    ## Sleep    3s
    # Control stages
    RPA.Desktop.Press Keys    tab    # Control stages drop-down (Show more)
    RPA.Desktop.Press Keys    tab    # Number of control stages drop-down

    ## Sleep  3s
    Points Tab Left Panel CONTROL Stages Set All Values Argument-1    2

    # Sleep    3s
    Points Tab Point Edit Form OK-Apply-Cancel Buttons Argument-1    1    # 1=OK, 2=APPLY, other=Cancel
    # Sleep    3s
    Points Tab Point Edit Exit Form Keep-Rename-Cancel Argument-1    2    # 1=Keep, 2=APPLY, other=Cancel
    


Points Tab Left Panel TIMETABLE Right Button Edit Argument-1

    [Arguments]    ${pointname}
    
    Points Filter Name Filter Field Select Argument-1    ${pointname}
    Points Tab Left Panel First Line Right Button Menu

    RPA.Desktop.Click With Offset    x=0    y=195    action=click     # Edit feature
    # Sleep    1s
    ${error_message}=    Run Keyword And Return Status    Wait For Element    alias:FXE_main_points_edit_property_missing_error_form    timeout=10    # Message if state text is missing
    IF    ${error_message}
        RPA.Desktop.Press Keys    enter    # Error message
    END

    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_TIME_edit_form    timeout=10    # TIMETABLE edit form Dims: 707*713  center:354*357    
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_TIME_edit_form
    RPA.Desktop.Click

    RPA.Desktop.Press Keys    tab        # view 
    RPA.Desktop.Press Keys    tab    # Text field
    RPA.Desktop.Type Text    ${pointname}_textfield    # Value
    RPA.Desktop.Press Keys    tab     # Picture field
    RPA.Desktop.Type Text    NEW.htm     # Picture field
    RPA.Desktop.Press Keys    tab     # Auto checkbox
    RPA.Desktop.Press Keys    space     # deselect checkbox
    RPA.Desktop.Press Keys    tab     # History point checkbox
    Points Tab Point Edit Form History Point Select    # Select checkbox
    Points Tab Point Edit Form History Section Arguments-6   3000    15    "Seconds"    0.6    "Day"    "Consumption"
    # Sleep    3s
    Points Tab Point Edit Form History Point Select    # Checkbox deselect
   
    RPA.Desktop.Press Keys    tab     # Use exception days
    RPA.Desktop.Press Keys    space     # Use exception days

    RPA.Desktop.Press Keys    tab     # Syncronize
    RPA.Desktop.Press Keys    space     # Syncronize

    RPA.Desktop.Press Keys    tab     # Monday event 1 Time

    FOR    ${element}    IN RANGE    72
               
        ${random_hour}=      Evaluate   random.randint(1, 23)
        ${random_minute}=    Evaluate   random.randint(1, 59)

        ${hour}=    Set Variable If    ${random_hour} < 10    0${random_hour}    ${random_hour}
        ${minute}=  Set Variable If    ${random_minute} < 10  0${random_minute}  ${random_minute}

        ${random_time}=  Set Variable  ${hour}${minute}
                
        RPA.Desktop.Type Text    ${random_time}     # event Time 
        RPA.Desktop.Press Keys   tab      # value

        RPA.Desktop.Type Text    ${hour}     # random value
        RPA.Desktop.Press Keys   tab      # next event time
        ## Sleep    1s
    END

    # Sleep    5s
    Points Tab Point Edit Form OK-Apply-Cancel Buttons Argument-1  1    # 1=OK, 2=APPLY, other=Cancel
    # Sleep    5s
    Points Tab Point Edit Exit Form Keep-Rename-Cancel Argument-1    2    # 1=Keep, 2=APPLY, other=Cancel


Points Tab Left Panel LOOKUP Right Button Edit Argument-1
    [Arguments]    ${pointname}
    
    Points Filter Name Filter Field Select Argument-1    ${pointname}
    Points Tab Left Panel First Line Right Button Menu

    RPA.Desktop.Click With Offset    x=0    y=195    action=click     # Edit feature
    # Sleep    1s
    ${error_message}=    Run Keyword And Return Status    Wait For Element    alias:FXE_main_points_edit_property_missing_error_form    timeout=10    # Message if state text is missing
    IF    ${error_message}
        RPA.Desktop.Press Keys    enter    # Error message
    END

    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_LOOKUP_edit_form    timeout=10    # TIMETABLE edit form Dims: 843*660  center:422*330    
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_LOOKUP_edit_form
    RPA.Desktop.Click With Offset    x=0    y=-300    action=click    # Edit form click on free space. If clicking on center, right value table is activated 

    RPA.Desktop.Press Keys    tab        # view 
    RPA.Desktop.Press Keys    tab        # Manual
    RPA.Desktop.Press Keys    tab        # Prog 

    RPA.Desktop.Press Keys    tab    # Text field
    RPA.Desktop.Type Text    ${pointname}_textfield    # Value

    RPA.Desktop.Press Keys    tab     # Picture field
    RPA.Desktop.Type Text    NEW.htm     # Picture field
    RPA.Desktop.Press Keys    tab     # Auto checkbox
    RPA.Desktop.Press Keys    space     # deselect checkbox
    RPA.Desktop.Press Keys    tab     # History point checkbox

    Points Tab Point Edit Form History Point Select    # Select checkbox
    Points Tab Point Edit Form History Section Arguments-6   3000    15    "Seconds"    0.6    "Day"    "Consumption"
    # Sleep    3s
    Points Tab Point Edit Form History Point Select    # Checkbox deselect
    ## Sleep    3s
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_LOOKUP_edit_form
    ## Sleep    3s
    RPA.Desktop.Click With Offset    x=115    y=-225    action=doubleclick    # Edit form click on Lookup values "Name of X axis"
    ## Sleep    3s
    RPA.Desktop.Type Text    Outdoor_Temperature
    ## Sleep    3s
    RPA.Desktop.Press Keys    tab    # Name of Y axis field
    ## Sleep    3s
    RPA.Desktop.Type Text    Supply_Temperature
    ## Sleep    3s
    RPA.Desktop.Press Keys    tab     # Offset field
    ## Sleep    3s
    RPA.Desktop.Type Text    1.2    # Value
    ## Sleep    3s
    RPA.Desktop.Press Keys    tab     # Spider/Compact type drop-down
    ## Sleep    3s
    RPA.Desktop.Press Keys    down
    ## Sleep    3s
    RPA.Desktop.Press Keys    tab    # X-Axis resistive input checkbox
    ## Sleep    3s
    RPA.Desktop.Press Keys    tab     # Table 1 line X-Axis
    ## Sleep    3s

    FOR  ${element}    IN RANGE    15
        ${random_number}=    Evaluate    random.randint(1, 9)
        ${x_axis}=    Evaluate    (${element} * 10) + ${random_number} 
        ${x_axis}=    Convert To String    ${x_axis}
        ${y_axis}=    Evaluate    ${element} * ${element}
        ${y_axis}=    Convert To String    ${y_axis}
        RPA.Desktop.Type Text    ${x_axis}
        RPA.Desktop.Press Keys    tab
        RPA.Desktop.Type Text    ${y_axis}
        RPA.Desktop.Press Keys    tab
    END
    
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_LOOKUP_edit_form
    RPA.Desktop.Click With Offset    x=-350    y=260    action=click    # Edit form click on Show values checkbox
    RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_LOOKUP_edit_form
    RPA.Desktop.Click With Offset    x=-210    y=260    action=click    # Edit form click on Zoom to fit button

    # TODO: Check correct saving process
    # RPA.Desktop.Move Mouse    alias:FXE_main_points_tab_LOOKUP_edit_form
    # RPA.Desktop.Click With Offset    x=-80    y=260    action=click    # Edit form click on Save to BMP button
        
    # # Saving dialog
    # RPA.Desktop.Wait For Element    alias:FXE_main_WINDOWS_FILE_SAVE_low_bar_form    timeout=10
    # ${random_number}=    Evaluate    random.randint(10000, 99999)
    # ${random_number}=    Convert To String    ${random_number}
    # RPA.Desktop.Type Text    ${random_number}
    # RPA.Desktop.Press Keys    enter     # Saving BMP
    
    # RPA.Desktop.Click    alias:FXE_main_OK_form_btn

    # Sleep    3s
    Points Tab Point Edit Form OK-Apply-Cancel Buttons Argument-1    1    # 1=OK, 2=APPLY, other=Cancel
    # Sleep    3s
    Points Tab Point Edit Exit Form Keep-Rename-Cancel Argument-1    2    # 1=Keep, 2=APPLY, other=Cancel

    # ${properties_form}=    Run Keyword And Return Status    RPA.Desktop.Wait For Element    alias:FXE_main_points_tab_LOOKUP_properties_form    timeout=10
    
    # IF    ${properties_form}
    #     Log To Console    Properties save form visible
    #     RPA.Desktop.Click With Offset    alias:FXE_main_points_tab_LOOKUP_properties_form    x=-20    y=55    action=click
    # ELSE
    #     Log To Console    Properties save form NOT visible
    # END

    
### END OF DIFFERENT POINT TYPES EDIT FORMS

    
