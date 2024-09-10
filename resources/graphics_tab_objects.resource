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
# Library             RPA.JavaAccessBridge

Resource            project_tab.resource
Resource            common.resource
Resource            graphics_tab.resource

*** Variables ***

${current_date}=    Get Current Date    result_format=%d.%m.%y
${button}    
${sleep_local}    Set Variable    0.5s

*** Keywords ***

Graphics Tab Text Create
    [Arguments]    ${pointname}    ${text}    ${left}    ${top}

    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab    timeout=5
    Graphics Tab HTML Editor Left Buttons Text Object Click

    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_text_form    timeout=5

    # x        y
    # -200    -235    pointid
	# 55	-235	point ID ddwn
	# -210	-210	show point value checkbx
	# 90	-235	limit field
	# 100	-190	Option
    # -210    -95    plus
    # -170    -95    delete
    # -200    -55    line 1 value
    # -150    -55    line 1 text
    # 30      -55    line 1 color
    # -200    -40    line 2
    # -200    -25    line 3

    # 110    -80    text size

    # -200    100    position left
    
    # 150    80    border color
    # 150    120    background color

    # -200   170    CSS selector
    # -90    170    user level

    # -30    290    OK
    # 90    290    Apply
    # 200    290    Close


    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=-200    
    ...    y=-235    
    ...    action=click    # Point ID field
    
    RPA.Desktop.Type Text    ${pointname}
    
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=53    
    ...    y=-235    
    ...    action=click    # Point ID field drop-sown
    Sleep    ${sleep_local}
    RPA.Desktop.Click
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=-210    
    ...    y=-210    
    ...    action=click    # show point value checkbx
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    space
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Controller set value
    RPA.Desktop.Press Keys    space
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    space
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Show info
    RPA.Desktop.Press Keys    space
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    space
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=90    
    ...    y=-235    
    ...    action=click    # Limit
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up    # limit 8
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Hiding
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    down
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # At value
    RPA.Desktop.Type Text    123
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=210    
    ...    y=-190    
    ...    action=click    # Option
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=210    
    ...    y=-190    
    ...    action=click    # Option
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=210    
    ...    y=-190    
    ...    action=click    # Option
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down



    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=-200    
    ...    y=-55    
    ...    action=click    # line 1 value
    Sleep    ${sleep_local}

    RPA.Desktop.Type Text    123

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=-150    
    ...    y=-55    
    ...    action=click    # line 1 text
    Sleep    ${sleep_local}

    RPA.Desktop.Type Text    ${text}-1

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=-210    
    ...    y=-95    
    ...    action=click    # plus
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=-200    
    ...    y=-40    
    ...    action=click    # line 2 value
    Sleep    ${sleep_local}

    RPA.Desktop.Type Text    456

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=-150    
    ...    y=-40    
    ...    action=click    # line 2 text
    Sleep    ${sleep_local}

    RPA.Desktop.Type Text    ${text}-2

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=-210    
    ...    y=-95    
    ...    action=click    # plus
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=-170    
    ...    y=-95    
    ...    action=click    # delete
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=110    
    ...    y=-80    
    ...    action=doubleclick    # text size
    Sleep    ${sleep_local}
    RPA.Desktop.Type Text    18
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Text align
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    tab    # Bold checkbox
    RPA.Desktop.Press Keys    space
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Border
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    down    # Solid
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Border color
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    down
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Background color
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    down
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Position left
    RPA.Desktop.Type Text    ${left}

    RPA.Desktop.Press Keys    tab    # Position top
    RPA.Desktop.Type Text    ${top}
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Width
    RPA.Desktop.Type Text    150

    RPA.Desktop.Press Keys    tab    # Height
    RPA.Desktop.Type Text    30
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # User level
    RPA.Desktop.Type Text    0

    RPA.Desktop.Press Keys    tab    # Group
    RPA.Desktop.Type Text    0
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Link input field
    RPA.Desktop.Type Text    new.htm

    # RPA.Desktop.Press Keys    tab    # Link button
    # RPA.Desktop.Type Text    new.htm
    # Sleep    ${sleep_local}

    # RPA.Desktop.Press Keys    space    # Open file Winodws form
    # RPA.Desktop.Type Text    new.htm
    # RPA.Desktop.Press Keys    enter

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=-200    
    ...    y=170    
    ...    action=click    # CSS selector
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    enter
    
    
    Sleep    ${sleep_local}
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=-30    
    ...    y=290    
    ...    action=click    # OK button
    Sleep    ${sleep_local}



Graphics Tab Valuebox Create
    [Arguments]    ${pointname}    ${left}    ${top}

    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab    timeout=5
    Graphics Tab HTML Editor Left Buttons Valuebox Click

    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_valuebox_form    timeout=5

#     x        y
    # -120    -200    pointid
	# 55	-125	point ID ddwn
	# -65	-95		controller set checkbx
	# 80	-125	limit field
	# 205	-80		Option

    # -200    30    position left
    
	# 110    -80    text size
	
    # 205    30    background color
    # 205    75    front color

    # -200   100    CSS selector
    # -100    100    user level

    # -50    175    OK
    # 75    175    Apply
    # 175    175    Close

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_valuebox_form    
    ...    x=55    
    ...    y=-125    
    ...    action=click    # Point ID field drop-sown
    Sleep    ${sleep_local}
    RPA.Desktop.Click
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_valuebox_form    
    ...    x=0    
    ...    y=-125    
    ...    action=click    # Point ID field
    Sleep    ${sleep_local}
    RPA.Desktop.Type Text    ${pointname}
    Sleep    ${sleep_local}


    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_valuebox_form    
    ...    x=-65    
    ...    y=-95    
    ...    action=click    # controller set checkbx
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    space
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Show info
    RPA.Desktop.Press Keys    space
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    space
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_valuebox_form    
    ...    x=80    
    ...    y=-125    
    ...    action=click    # Limit
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up    # limit 8
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Hiding
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    down
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # At value
    RPA.Desktop.Type Text    123
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_valuebox_form    
    ...    x=205    
    ...    y=-80    
    ...    action=click    # Option
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_valuebox_form    
    ...    x=205    
    ...    y=-80    
    ...    action=click    # Option
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_valuebox_form    
    ...    x=205    
    ...    y=-80    
    ...    action=click    # Option
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down


    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_valuebox_form    
    ...    x=-200    
    ...    y=30    
    ...    action=doubleclick    # position left
    Sleep    ${sleep_local}
    RPA.Desktop.Type Text    ${left}
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Position top
    RPA.Desktop.Type Text    ${top}
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Width
    RPA.Desktop.Type Text    150

    RPA.Desktop.Press Keys    tab    # Height
    RPA.Desktop.Type Text    30
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # User level
    RPA.Desktop.Type Text    0

    RPA.Desktop.Press Keys    tab    # Group
    RPA.Desktop.Type Text    0
    Sleep    ${sleep_local}


    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_valuebox_form    
    ...    x=205    
    ...    y=30    
    ...    action=click    # background color
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    up
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    up
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    enter

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_valuebox_form    
    ...    x=205    
    ...    y=75    
    ...    action=click    # front color
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    enter


        RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_valuebox_form    
    ...    x=-200    
    ...    y=100    
    ...    action=click    # CSS selector
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    enter


    
    Sleep    ${sleep_local}
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_valuebox_form    
    ...    x=-50    
    ...    y=175    
    ...    action=click    # OK button
    Sleep    ${sleep_local}


Graphics Tab Button Create
    [Arguments]    ${pointname}    ${text}    ${left}    ${top}

    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab    timeout=5
    Graphics Tab HTML Editor Left Buttons Button Click

    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_button_form    timeout=5

	# 	Button
    # x        y
    # 0    -150    pointid
	# 55	-150	point ID ddwn
	# -215	-105	show info checkbx
	# 80	-150	limit field
	# 205	-100		Option
	
	# -100	0		text
	#	50	0		Fixed value
    # -200    70    position left
    
    # 205    0    background color
    # 205    50    front color

    # -200   135    CSS selector
    # -100    135    user level

    # -50    210    OK
    # 75    210    Apply
    # 175    210    Close


    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_button_form    
    ...    x=55    
    ...    y=-150    
    ...    action=click    # Point ID field drop-sown
    Sleep    ${sleep_local}
    RPA.Desktop.Click
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_button_form    
    ...    x=0    
    ...    y=-150    
    ...    action=click    # Point ID field
    Sleep    ${sleep_local}
    RPA.Desktop.Type Text    ${pointname}
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_button_form    
    ...    x=-215    
    ...    y=-105    
    ...    action=click    # show info checkbx
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    space
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_button_form    
    ...    x=80    
    ...    y=-150    
    ...    action=click    # Limit
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up    # limit 8
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Hiding
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    down
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # At value
    RPA.Desktop.Type Text    123
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_button_form    
    ...    x=205    
    ...    y=-100    
    ...    action=click    # Option
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_button_form    
    ...    x=205    
    ...    y=-100    
    ...    action=click    # Option
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_button_form    
    ...    x=205    
    ...    y=-100    
    ...    action=click    # Option
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_button_form    
    ...    x=-100    
    ...    y=0    
    ...    action=click    # Text
    Sleep    ${sleep_local}
    RPA.Desktop.Type Text    ${text}
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # fixed value
    RPA.Desktop.Type Text    A0 A1
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_button_form    
    ...    x=-200    
    ...    y=70    
    ...    action=doubleclick    # position left
    Sleep    ${sleep_local}
    RPA.Desktop.Type Text    ${left}
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Position top
    RPA.Desktop.Type Text    ${top}
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Width
    RPA.Desktop.Type Text    150

    RPA.Desktop.Press Keys    tab    # Height
    RPA.Desktop.Type Text    30
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # User level
    RPA.Desktop.Type Text    0

    RPA.Desktop.Press Keys    tab    # Group
    RPA.Desktop.Type Text    0
    Sleep    ${sleep_local}


    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_button_form    
    ...    x=205    
    ...    y=0    
    ...    action=click    # background color
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    up
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    up
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    enter

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_button_form    
    ...    x=205    
    ...    y=50    
    ...    action=click    # front color
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    enter


        RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_button_form    
    ...    x=-200    
    ...    y=135    
    ...    action=click    # CSS selector
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    enter

    
    Sleep    ${sleep_local}
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_button_form    
    ...    x=-50    
    ...    y=210    
    ...    action=click    # OK button
    Sleep    ${sleep_local}


Graphics Tab Bar Create
    [Arguments]    ${pointname}    ${left}    ${top}

    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab    timeout=5
    Graphics Tab HTML Editor Left Buttons Bar Click

    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_bar_form    timeout=5

	# 	Bar
    # x        y
    # 0    -190    pointid
	# 60	-190	point ID ddwn
	# -215	-140	show info checkbx
	# 80	-190	limit field
	# 205	-140		Option
	
	# -200	-30		Bar low
	# -150	-30		Bar middle
	# -70	-30		Bar high
	# 65	-30		Orientation

	# 110	-30		Text size
	# -200	-30		Bar low

    # -200   35    position left
    
    # 200    130    background color
    # 200    170    front color

    # -200   100    CSS selector
    # -100    100    user level
	
	# -200	145		link

    # -50    250    OK
    # 75    250    Apply
    # 175    250    Close


    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_bar_form    
    ...    x=60    
    ...    y=-190    
    ...    action=click    # Point ID field drop-sown
    Sleep    ${sleep_local}
    RPA.Desktop.Click
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_bar_form    
    ...    x=0    
    ...    y=-190    
    ...    action=click    # Point ID field
    Sleep    ${sleep_local}
    RPA.Desktop.Type Text    ${pointname}
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_bar_form    
    ...    x=-215    
    ...    y=-140    
    ...    action=click    # show info checkbx
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    space
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_bar_form    
    ...    x=80    
    ...    y=-190    
    ...    action=click    # Limit
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up    # limit 8
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Hiding
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    down
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # At value
    RPA.Desktop.Type Text    123
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_bar_form    
    ...    x=205    
    ...    y=-140    
    ...    action=click    # Option
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_bar_form    
    ...    x=205    
    ...    y=-140    
    ...    action=click    # Option
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_bar_form    
    ...    x=205    
    ...    y=-140    
    ...    action=click    # Option
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down
    Sleep    ${sleep_local}


    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_bar_form    
    ...    x=-200    
    ...    y=-30    
    ...    action=doubleclick    # Bar low
    Sleep    ${sleep_local}
    RPA.Desktop.Type Text    5
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Bar Middle 
    RPA.Desktop.Type Text    55
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Bar Middle 
    RPA.Desktop.Type Text    155
    Sleep    ${sleep_local}


    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_bar_form    
    ...    x=65    
    ...    y=-30    
    ...    action=click    # Orientation
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    enter
    Sleep    ${sleep_local}


    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_bar_form    
    ...    x=-200    
    ...    y=35    
    ...    action=doubleclick    # position left
    Sleep    ${sleep_local}
    RPA.Desktop.Type Text    ${left}
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Position top
    RPA.Desktop.Type Text    ${top}
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Width
    RPA.Desktop.Type Text    150
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Height
    RPA.Desktop.Type Text    60
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_bar_form    
    ...    x=-200    
    ...    y=70    
    ...    action=click    # user level
    Sleep    ${sleep_local}
    RPA.Desktop.Type Text    0
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Group
    RPA.Desktop.Type Text    0
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_bar_form    
    ...    x=-200    
    ...    y=145    
    ...    action=click    # link
    Sleep    ${sleep_local}
    RPA.Desktop.Type Text    new.htm
    Sleep    ${sleep_local}


    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_bar_form    
    ...    x=100    
    ...    y=-30    
    ...    action=doubleclick    # text size
    Sleep    ${sleep_local}
    RPA.Desktop.Type Text    16
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Bold
    RPA.Desktop.Press Keys    space
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Hide text
    RPA.Desktop.Press Keys    space
    RPA.Desktop.Press Keys    space
    Sleep    ${sleep_local}


    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_bar_form    
    ...    x=205    
    ...    y=130    
    ...    action=click    # background color
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    enter
    # RPA.Desktop.Press Keys    esc


    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_bar_form    
    ...    x=205    
    ...    y=170    
    ...    action=click    # front color
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    enter
    # RPA.Desktop.Press Keys    esc
    Sleep    ${sleep_local}


    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_bar_form    
    ...    x=-200    
    ...    y=100    
    ...    action=click    # CSS selector
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down
    # RPA.Desktop.Press Keys    esc
    RPA.Desktop.Press Keys    enter
    # RPA.Desktop.Press Keys    space
    
    Sleep    ${sleep_local}
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_bar_form    
    ...    x=-50    
    ...    y=250    
    ...    action=click    # OK button
    Sleep    ${sleep_local}



Graphics Tab Symbol Create
    [Arguments]    ${pointname}    ${left}    ${top}

    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab    timeout=5
    Graphics Tab HTML Editor Left Buttons Add Symbol Click

    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_symbol_form    timeout=10

    #	symbol selector top part    alias:FXE_main_graphics_tab_editor_symbol_form
	#
	#	x		y	
	#	-250	-10	    Type PNG
	#	-100	-10	    Type SVG
	#	-20		60	    Filter ddwn
	#	20		60    	Filter input

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_symbol_form    
    ...    x=-250    
    ...    y=-10    
    ...    action=click    # Type PNG
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_symbol_form    
    ...    x=-100    
    ...    y=-10    
    ...    action=click    # Type SVG
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_symbol_form    
    ...    x=-250    
    ...    y=-10    
    ...    action=click    # Type PNG
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_symbol_form    
    ...    x=-20    
    ...    y=60    
    ...    action=click    # Filter ddwn
    Sleep    ${sleep_local}

    RPA.Desktop.Type Text    alarm
    RPA.Desktop.Press Keys    enter
    Sleep    ${sleep_local}

    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_symbol_2023_svg_form    timeout=10

	#	symbol selector    alias:FXE_main_graphics_tab_editor_symbol_2023_svg_form
	#
	#	x		y	
	#	-210	-210	Type PNG
	#	-110	-210	Type SVG
	#	-25		-140	Filter ddwn
	#	50		-140	Filter input
	#	0		-90		svg list 1 line
	#	0		-25		svg list 2 line
	#	0		50		svg list 3 line
	#	0		125		svg list 4 line

	#	50		250		OK
	#	160		250		Cancel btn

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_symbol_2023_svg_form    
    ...    x=50    
    ...    y=250    
    ...    action=click    # OK
    Sleep    ${sleep_local}


    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_symbol_alarm_svg_form    timeout=10

	#	SVG symbol form
	#
	#	x		y	
	#	50		-290	point ddwn
	#	-200	-290	point input
	#	70		-270	limit
	#	140		-290	hiding
	#	200		-290	value
	#	200		-245	option ddwn
	#	-225	-245	show info
	#	40		-150	symbol btn
	#	40		-125	resize btn	
	#	40		-25		rotate btn
	#	200		-140	background ddwn
	#	-200	85		left
	#	-150	85		top
	#	-70		85		width
	#	-15		85		lock btn	
	#	20		85		height
	#	-140	150		CSS ddwn
	#	-100	150		User level
	#	-40		150		Group
	#	-100	200		Link input
	#	20		200		Link btn
    #    -50    275    OK
    #    50    275    Apply
    #    150    275    Close

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_symbol_alarm_svg_form    
    ...    x=50    
    ...    y=-290    
    ...    action=click    # point ddwn
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_symbol_alarm_svg_form    
    ...    x=50    
    ...    y=-290    
    ...    action=click    # point ddwn
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_symbol_alarm_svg_form    
    ...    x=-200    
    ...    y=-290    
    ...    action=click    # point input
    Sleep    ${sleep_local}

    RPA.Desktop.Type Text    ${pointname}
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_symbol_alarm_svg_form    
    ...    x=70    
    ...    y=-290    
    ...    action=click    # limit
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_symbol_alarm_svg_form    
    ...    x=140    
    ...    y=-290    
    ...    action=click    # Hiding
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    enter

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_symbol_alarm_svg_form    
    ...    x=200    
    ...    y=-290    
    ...    action=click    # Value
    Sleep    ${sleep_local}

    RPA.Desktop.Type Text    99
    Sleep    ${sleep_local}





    # CLOSE

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_symbol_alarm_svg_form    
    ...    x=150    
    ...    y=275    
    ...    action=click    # Close
    Sleep    ${sleep_local}
