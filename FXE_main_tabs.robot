*** Settings ***
Documentation       FXE main view tabs walkthrough

Library             RPA.Desktop
Library             RPA.Windows
Library             OperatingSystem

Resource            resources/fidelix_tab.resource
Resource            resources/common.resource
Resource            resources/project_tab.resource
Resource            resources/points_tab_point_edit.resource
Resource            resources/points_tab.resource
Resource            resources/browser_tab.resource
Resource            resources/label_list_tab.resource
Resource            resources/modules_tab.resource
Resource            resources/documents_tab.resource
Resource            resources/history_tab.resource
Resource            resources/fxonline_tab.resource
Resource            resources/st_edit_tab.resource
Resource            resources/start_menu.resource
Resource            resources/start_menu.resource
Resource            resources/start_menu.resource


#Resource            ${CURDIR}\\resources\\common.resource
#Test Teardown        RPA.Desktop.Close Application    ${FXEditor_app}

*** Variables ***
#${FXEditor_app}     c:\\Program Files (x86)\\FX-Editor\\FxEditor.exe

*** Test Cases ***

###### FXE_start_menu_items.robot
# Start Menu Items Walkthrough
#     Check Projects Common Folder Exists
#     # Check And Delete Project Folder Argument-1    c:\\QA\\TestProjects\\Test-Project_1
#     # Check And Delete Project Folder Argument-1    c:\\QA\\TestProjects\\Test-Project_2
#     # Check And Delete Test Group
#     # Clear Test Projects Folder Arguments-2    c:\\QA\\TestProjects\\    Test-Group
#     Recreate Test Projects folder Arguments-1    c:\\QA\\TestProjects\\
    
#     ${app_instance}=    Open FXE
#     Splash Screen Check
   
#     # New Project Wizard Arguments-1    Test-Project_1
#     # Close Opened Project Without Saving
#     # New Project Wizard Arguments-1    Test-Project_2
#     # Close Opened Project Without Saving
#     # Start Page New Group Project Wizard Open Close
    
#     Start Page Settings Form
#     Start Page Settings Project Tab Walkthrough
#     Start Page Explore FX-Editor Data Button
#     Start Page Tools Button
#     Start Page Explore FX-Editor Data Button
#     Start Page License Button
#     Start Page Fideilx Manual Button
#     Start Page FX-Editor Manual Button
#     Start Page OpenPCS Manual Button
#     Start Page Version Up To Date Button
#     Start Page Update History Button
#     Start Page Import New PLC Firmware Button Arguments-2    2    V123010
#     Start Page Import New PLC Firmware Button Arguments-2    1    fidelix-fx3000x-20.0.43-prod.raucb
#     Start Logo Screen
#     Splash Screen Check
#     Log To Console    Start Menu Items Walkthrough Done
#     Current Window System Force Close X Button    
#     # Display Dialog and Wait for User Action

# ####### END OF FXE_start_menu_items.robot


# ####### FXE_new_project_wizard.robot

# New Project Uisng Wizard    
#     Check Projects Common Folder Exists
#     #    Check And Delete Test Project
#     Recreate Test Projects folder    c:\\QA\\TestProjects\\
#     Open FXE
#     New Project Wizard    Test-Project_1    FX3000C
#     Close Opened Project Without Saving
#     Log  New project creation using wizard done.

# # ####### END OF FXE_new_project_wizard.robot
Starting Procedure   

#     Check Projects Common Folder Exists
#     Recreate Test Projects folder    c:\\QA\\TestProjects\\
#     Open FXE
#     New Project Wizard    Test-Project_1    FX3000X
#     Close Opened Project With Saving
#     Start Page Add Delete Favorites
    
#     New Project Wizard    Test-Project_2    FX3000C
#     Close Opened Project With Saving
#     Start Page New Group Project Wizard Open Close
    
#     Current Window System Force Close X Button
#     Splash Screen Check
#     Log To Console    New project creation using wizard done.
    Open Existing Project    ${TEST_PROJECTS_PATH}    ${TEST_PROJECT_NAME}


Project Tab
     Project Tab Project Information Subtab
     Project Tab Communication Settings Subtab
     Project Tab Communication Settings Subtab Arguments-6    10.100.1.200    9    demodemo    1    system    24680
#     #    plc_type 10 = 3000X, 9=3000C   
#     #    [Arguments]    ${ip_address}    ${plc_type}    ${ftp_passw}    ${connect}    ${username}    ${password}
     Project Tab Hardware Configuration Subtab
     Project Tab Hardware Configuration Subtab New Module
     Project Tab Hardware Configuration Subtab Add Modbus Address
     Project Tab Hardware Configuration Subtab Add Modbus Device    
     Project Tab Point Settings Subtab
     Project Tab Settings Subtab

Points Tab
    Points Tab Select
    # Left Panel Resize
    Points Tab Select Filter Create All Kinds Of Points
    State Text Edit Form    save
    Alarm Group Edit Form

    Point Tab Select Filter Delete All Points   

    Left Panel Auto Resize Button
    Right Panel Auto Resize Button

    Points Tab Select Filter Create All Kinds Of Points
   
    Points Tab Left Panel ALARM Right Button Edit Argument-1    TE01_H
    Points Filter Name Filter Clear And De-Select
    
    Points Tab Left Panel AI Right Button Edit Arguments-2    TE01_M    1
    Points Filter Name Filter Clear And De-Select
         
    Points Tab Left Panel DI Right Button Edit Argument-1    TE01_I
    Points Filter Name Filter Clear And De-Select

    Points Tab Left Panel DO Right Button Edit Argument-1    TE01_DO
    Points Filter Name Filter Clear And De-Select

    Points Tab Left Panel AO Right Button Edit Arguments-2    TE01_A    1
    Points Filter Name Filter Clear And De-Select
    
    Points Tab Left Panel CONTROL Right Button Edit Argument-1    TE01_C
    Points Filter Name Filter Clear And De-Select
    
    Points Tab Left Panel TIMETABLE Right Button Edit Argument-1    TE01_T
    Points Filter Name Filter Clear And De-Select

    Points Tab Left Panel LOOKUP Right Button Edit Argument-1    TE01_L
    Points Filter Name Filter Clear And De-Select

    Button Press Upload Alarmgroup To PLC
    Button Press Upload State Text To PLC
    Button Press Upload Changed Points To PLC
    Button Press Upload Displayed Points To PLC
    Button Press Upload Selected Points To PLC
    Button Press Points Panel Resize


    # Points Right Panel Import Filter Edit Form
    # Points Right Panel Button Bar Add Filter Button
    # Points Right Panel Button Bar Copy Selected Filter
    # Points Filter Name Filter Field
    # Points Filter Point Type Filter

    # Points Right Panel Import Filter Edit Form NO Save

Modules Tab

    Modules Tab Select
    Modules Tab Points Binding Argument-1    1
    Modules Tab Points Disconnect Argument-1    5
    # Modules Tab Points Binding Argument-1    1
    # Modules Tab Points Disconnect Argument-1    1




History Tab
    History Tab Select
    History Tab Resize
    History Tab New History Group Create Agrument-1    111
    History Tab New History Group Create RMB Drag-n-Drop Argument-1    222
    History Tab Delete All Groups

    History Tab Open Report Form
    History Tab Report Form Group Create Agrument-1    333
    History Tab Report Form Delete Selected Group
    
    History Tab Report Form Group Create Agrument-1    444
    History Tab Report Form Report Wizard
    History Tab Report Form Report Delete

    History Tab Report Form Column Create Arguments-6    0    17    2    HEADER    0    2&3
    #    [Arguments]    ${column_type}    ${units}    ${decimals}    ${header}    ${graph}    ${compare_columns}
    History Tab Report Form Normalize Change
    History Tab Report Form Close Without Saving


Fidelix Tab    
    
    #    Project Tab Communication Settings Subtab Arguments-6    10.100.1.198    10    demodemo    1    system    24680
    #    plc_type 10 = 3000X, 9 = 3000C   
    #    [Arguments]    ${ip_address}    ${plc_type}    ${ftp_passw}    ${connect}    ${username}    ${password}

    #    Sleep    2s
    Fidelix Tab Select
    #    Sleep    2s
    
    Fidelix Tab Right Panel Connect Button Argument-1    1
    # [Argument] 1= connect, other=disconnect
    Fidelix Tab Left Panel Backup PLC Argument-1    5
    Fidelix Tab Left Panel Watchdog
    Fidelix Tab Left Panel Add Files Argument-1    C:\\QA\\TestProjects\\Test-Project_1\\Log.txt
    
    #    Sleep    2s
    # Fidelix Tab Left Panel FX Folder Upload Argument-1    www
    # Fidelix Tab Right Panel FX Folder Copy Argument-1    www
    # Fidelix Tab Left Panel FX Folder Copy Argument-1    www
    Fidelix Tab Right Panel Connect Button Argument-1    0

Browser Tab

    # Project Tab Communication Settings Subtab Arguments-6    10.100.1.198    11    demodemo    1    system    24680
    # #     [Arguments]    ${ip_address}    ${plc_type}    ${ftp_passw}    ${connect}    ${username}    ${password}
    # Browser Tab Select
    # Browser Tab Home Button Argument-1    11


    # Project Tab Communication Settings Subtab Arguments-6    10.100.1.200    9    demodemo    1    system    24680
    # #    plc_type 10 = 3000X, 9 = 3000C   
    # #    [Arguments]    ${ip_address}    ${plc_type}    ${ftp_passw}    ${connect}    ${username}    ${password}
    
    Browser Tab Select
    Browser Tab Home Button Argument-1    9


Label List Tab
   Label List Tab Select
   Label List Save List To File Arguments-5    -    BB    ROW_1    ROW_2    ROW_3
#     [Arguments]    ${point_separator}    ${label_separator}    ${labelrow_1}    ${labelrow_2}    ${labelrow_3}    ${labelrow_1}

Documents Tab
    Documents Tab Select
    Documents Tab New Folder Create And Delete

Fxonline Tab
    Fxonline Tab Select
    Fxonline Tab Resize
    Project Tab Communication Settings Subtab Arguments-6    10.100.1.200    9    demodemo    1    system    24680    
    # [Arguments]    ${ip_address}    ${plc_type}    ${ftp_passw}    ${connect}    ${username}    ${password}
    Fxonline Tab Select
    Fxonline Tab Resize
    Fxonline Tab Connect-Disconnect

ST-Edit Tab
    ST-Edit Tab Select
    ST-Edit Tab Separate Window Operations
    
    ST-Edit Tab New ST Function Random Name
    Close Opened ST File
    ST-Edit Tab ST Functioin Delete

    ST-Edit Tab New ST Function Block Random Name
    Close Opened ST File
    ST-Edit Tab ST Functioin Block Delete

    ST-Edit Tab New ST Program Random Name
    Close Opened ST File
    ST-Edit Tab ST Program Delete
           
    ST-Edit Tab New ST Program Random Name
    ST-Edit Tab ST Program Modification
    ST-Edit Tab Clean Unused Variables
    ST-Edit Tab Syntax Check
    ST-Edit Tab Search Arguments-1    Variable


Test Finish Without Saving
    Close Opened Project Without Saving
    Current Window System Force Close X Button
    Splash Screen Check
    # Close Opened Project With Saving

    #    Close All
    # Display Dialog and Wait for User Action


 #Start Menu Items Walkthrough
    #Check Projects Common Folder Exists
    #Check And Delete Test Project
    #Open FXE
    #New Project Wizard
    #Close All
    #Sleep    15s
    #Open Existing Project
    #Project Tab Project Information Subtab
    #Project Tab Communication Settings Subtab
        
    #Project Tab Hardware Configuration Subtab
    #Project Tab Hardware Configuration Subtab New Module
    
    #Project Tab Hardware Configuration Subtab Add Modbus Address

    #Project Tab Hardware Configuration Subtab Add Modbus Device
    
    #Project Tab Point Settings Subtab
    #Project Tab Settings Subtab
    
    # Points Tab Select
    # Points Tab Select Filter Create All Kinds Of Points
    # State Text Edit Form
    # Alarm Group Edit Form
    
    #Button Press Upload Alarmgroup To PLC
    #Button Press Upload State Text To PLC
    #Button Press Upload Changed Points To PLC
    #Button Press Upload Displayed Points To PLC
    #Button Press Upload Selected Points To PLC
    #Button Press Points Panel Resize

    # Left Panel Resize
    # Left Panel Auto Resize Button
    # Right Panel Auto Resize Button

    
    # Points Tab Left Panel ALARM Right Button Edit Argument-1    TE01_L
    # Points Filter Name Filter Clear And De-Select
    
    # Points Tab Left Panel AI Right Button Edit Argument-1    TE01_MV
    # Points Filter Name Filter Clear And De-Select
         
    # Points Tab Left Panel DI Right Button Edit Argument-1    TE01_I
    # Points Filter Name Filter Clear And De-Select

    # Points Tab Left Panel DO Right Button Edit Argument-1    TE01_FM
    # Points Filter Name Filter Clear And De-Select
    
    # Points Tab Left Panel CONTROL Right Button Edit Argument-1    TE01_RG
    # Points Filter Name Filter Clear And De-Select
    
    # Points Tab Left Panel TIMETABLE Right Button Edit Argument-1    TE01_TK
    # Points Filter Name Filter Clear And De-Select

    # Points Tab Left Panel LOOKUP Right Button Edit Argument-1    TE01_KRV
    # Points Filter Name Filter Clear And De-Select

    
    
    #Points Filter Name Filter Field Deselect

    #Points Tab Left Panel Right Button Menu

    # Points Right Panel Import Filter Edit Form
    # Points Right Panel Button Bar Add Filter Button
    # Points Right Panel Button Bar Copy Selected Filter
    # #Points Filter Name Filter Field
    # Points Filter Point Type Filter

    # Points Right Panel Import Filter Edit Form NO Save


    # Close Opened Project Without Saving
    # #Close Opened Project With Saving

    # #Close All
    # Display Dialog and Wait for User Action
    # Log    Done.


*** Keywords ***
Set Global Variable    ${RESOURCES}    ${CURDIR}/../resources