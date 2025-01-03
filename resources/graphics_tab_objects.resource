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
Resource            resources/project_tab.resource
Resource            resources/common.resource
Resource            resources/graphics_tab.resource

*** Variables ***

${current_date}=    Get Current Date    result_format=%d.%m.%y
${button}    
# ${sleep_local}    Set Variable    0.5s

*** Keywords ***

Graphics Tab Text Create
    [Arguments]    ${pointname}    ${text}    ${left}    ${top}    ${target}

    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab    timeout=5
    Graphics Tab HTML Editor Left Buttons Text Object Click

    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_text_form    timeout=5

    # Changes below are started in 2.0.6.4b for form with header/footer
    # x        y
    # -200    -255    pointid
	# 60	-255	point ID ddwn
	# -210	-230	show point value checkbx
	# 85	-255	limit field
	# 150	-210	Option
    # -210    -120    plus
    # -170    -120    delete
    # -200    -80    line 1 value
    # -150    -80    line 1 text
    # 30      -80    line 1 color
    # -200    -60    line 2
    # -200    -40    line 3

    # 110    -100    text size

    # -200    80    position left
    # -150    125    target ddwn
    # 150    30    border ddwn
    # 150    110    border color
    # 150    150    background color
    # -150   190    CSS ddwn selector
    # -90    190    user level
    # -30    190    Group input
    # -150    235    Link input
    # 30    235    Link btn

    # -30    310    OK
    # 80    310    Apply
    # 180    310    Close


    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=-200    
    ...    y=-255    
    ...    action=click    # Point ID field
     Sleep    ${sleep_local}
    RPA.Desktop.Type Text    ${pointname}
     Sleep    ${sleep_local}
    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=60    
    ...    y=-255    
    ...    action=click    # Point ID field drop-sown
    Sleep    ${sleep_local}
    RPA.Desktop.Click
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=-210    
    ...    y=-230    
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
    ...    x=85    
    ...    y=-255    
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
    ...    x=150    
    ...    y=-210    
    ...    action=click    # Option
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=150    
    ...    y=-210    
    ...    action=click    # Option
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=150    
    ...    y=-210    
    ...    action=click    # Option
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=-200    
    ...    y=-80    
    ...    action=click    # line 1 value
    Sleep    ${sleep_local}

    RPA.Desktop.Type Text    123

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=-150    
    ...    y=-80    
    ...    action=click    # line 1 text
    Sleep    ${sleep_local}

    RPA.Desktop.Type Text    ${text}-1

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=-210    
    ...    y=-120    
    ...    action=click    # plus
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=-200    
    ...    y=-60    
    ...    action=click    # line 2 value
    Sleep    ${sleep_local}

    RPA.Desktop.Type Text    456

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=-150    
    ...    y=-60    
    ...    action=click    # line 2 text
    Sleep    ${sleep_local}

    RPA.Desktop.Type Text    ${text}-2

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=-210    
    ...    y=-120    
    ...    action=click    # plus
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=-170    
    ...    y=-120    
    ...    action=click    # delete
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_text_form    
    ...    x=110    
    ...    y=-100    
    ...    action=doubleclick    # text size
    Sleep    ${sleep_local}
    RPA.Desktop.Type Text    18
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Text align
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    tab    # Bold checkbox
    RPA.Desktop.Press Keys    space
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

    RPA.Desktop.Click With Offset
    ...    alias:FXE_main_graphics_tab_editor_text_form
    ...    x=-150    
    ...    y=125    
    ...    action=click    # target ddwn

    IF    $target == 'footer'
        RPA.Desktop.Press Keys    f    # Footer
        RPA.Desktop.Press Keys    enter    # Enter
    ELSE IF    $target == 'header'
        RPA.Desktop.Press Keys    h    # Header
        RPA.Desktop.Press Keys    enter    # Enter
    ELSE
        RPA.Desktop.Press Keys    p    # Picture
        RPA.Desktop.Press Keys    enter    # Enter
    END

    RPA.Desktop.Press Keys    tab    # User level
    RPA.Desktop.Type Text    255

    RPA.Desktop.Press Keys    tab    # Group
    RPA.Desktop.Type Text    1
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    tab    # Link input field
    RPA.Desktop.Type Text    new.htm

    # RPA.Desktop.Press Keys    space    # Open file Winodws form
    # RPA.Desktop.Type Text    new.htm
    # RPA.Desktop.Press Keys    enter

    # RPA.Desktop.Click With Offset    
    # ...    alias:FXE_main_graphics_tab_editor_text_form    
    # ...    x=-200    
    # ...    y=170    
    # ...    action=click    # CSS selector
    # Sleep    ${sleep_local}
    # RPA.Desktop.Press Keys    down
    # RPA.Desktop.Press Keys    enter
    
    
    # Sleep    ${sleep_local}
    # RPA.Desktop.Click With Offset    
    # ...    alias:FXE_main_graphics_tab_editor_text_form    
    # ...    x=-30    
    # ...    y=310    
    # ...    action=click    # OK button

    RPA.Desktop.Wait For Element    alias:FXE_main_OK_form_btn    timeout=5
    RPA.Desktop.Click    alias:FXE_main_OK_form_btn    action=click

    Sleep    ${sleep_local}

    ${result} =    Run Keyword And Return Status    Find Element    alias:FXE_main_graphics_tab_editor_text_form
    Run Keyword If    ${result}    Fail    "Text form is still visible!"


Graphics Tab Valuebox Create
    [Arguments]    ${pointname}    ${left}    ${top}    ${target}

    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab    timeout=5
    Graphics Tab HTML Editor Left Buttons Valuebox Click

    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_valuebox_form    timeout=5


#     x        y
    # -120    -140    pointid
	# 55	-140	point ID ddwn
	# -60	-115	controller set checkbx
	# 85	-140	limit field
	# 205	-95		Option

    # -200    10    position left
    
    # 150    10    background color
    # 150    60    front color

	# -150   60    Target ddwn

    # -150   120    CSS selector
	# -90    120    user level

    # -50    200    OK
    # 75    200    Apply
    # 175    200    Close

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_valuebox_form    
    ...    x=55    
    ...    y=-140    
    ...    action=click    # Point ID field drop-sown
    Sleep    ${sleep_local}
    RPA.Desktop.Click
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_valuebox_form    
    ...    x=-120    
    ...    y=-140    
    ...    action=click    # Point ID field
    Sleep    ${sleep_local}
    RPA.Desktop.Type Text    ${pointname}
    Sleep    ${sleep_local}


    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_valuebox_form    
    ...    x=-65    
    ...    y=-115    
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
    ...    x=85    
    ...    y=-140    
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
    ...    y=-95
    ...    action=click    # Option
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_valuebox_form    
    ...    x=205
    ...    y=-95
    ...    action=click    # Option
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_valuebox_form    
    ...    x=205
    ...    y=-95
    ...    action=click    # Option
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_valuebox_form    
    ...    x=-200
    ...    y=10
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

    RPA.Desktop.Click With Offset
    ...    alias:FXE_main_graphics_tab_editor_valuebox_form
    ...    x=-150    
    ...    y=60    
    ...    action=click    # target ddwn

    IF    $target == 'footer'
        RPA.Desktop.Press Keys    f    # Footer
        RPA.Desktop.Press Keys    enter    # Enter
    ELSE IF    $target == 'header'
        RPA.Desktop.Press Keys    h    # Header
        RPA.Desktop.Press Keys    enter    # Enter
    ELSE
        RPA.Desktop.Press Keys    p    # Picture
        RPA.Desktop.Press Keys    enter    # Enter
    END

    RPA.Desktop.Press Keys    tab    # User level
    RPA.Desktop.Type Text    0

    RPA.Desktop.Press Keys    tab    # Group
    RPA.Desktop.Type Text    0
    Sleep    ${sleep_local}


    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_valuebox_form    
    ...    x=150
    ...    y=10
    ...    action=click    # background color
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    up
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    up
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    enter

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_valuebox_form    
    ...    x=150
    ...    y=60
    ...    action=click    # front color
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    enter


    RPA.Desktop.Click With Offset
    ...    alias:FXE_main_graphics_tab_editor_valuebox_form
    ...    x=-150
    ...    y=120
    ...    action=click    # CSS selector
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    enter


    Sleep    ${sleep_local}
    # RPA.Desktop.Click With Offset
    # ...    alias:FXE_main_graphics_tab_editor_valuebox_form    
    # ...    x=-50    
    # ...    y=200    
    # ...    action=click    # OK button
    # Sleep    ${sleep_local}

    RPA.Desktop.Wait For Element    alias:FXE_main_OK_form_btn    timeout=5
    RPA.Desktop.Click    alias:FXE_main_OK_form_btn    action=click

    ${result} =    Run Keyword And Return Status    Find Element    alias:FXE_main_graphics_tab_editor_valuebox_form
    Run Keyword If    ${result}    Fail    "Valuebox form is still visible!"


Graphics Tab Button Create
    [Arguments]    ${pointname}    ${text}    ${left}    ${top}    ${target}

    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab    timeout=5
    Graphics Tab HTML Editor Left Buttons Button Click

    RPA.Desktop.Wait For Element    alias:FXE_main_graphics_tab_editor_button_form    timeout=5

	# 	Button
    # x        y
    # 0    -175    pointid
	# 60	-175	point ID ddwn
	# -210	-125	show info checkbx
	# 80	-175	limit field
	# 205	-125	Option
	
	# -100	-20		text
	#	50	-20		Fixed value
    # -200   40    position left
    
    # 210    -20    background color
    # 210    30    front color

	# -150	90	Target
	
    # -200   150    CSS selector
    # -100   150    user level

    # -50    230    OK
    # 75    230    Apply
    # 175    230    Close


    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_button_form    
    ...    x=60
    ...    y=-155
    ...    action=click    # Point ID field drop-sown
    Sleep    ${sleep_local}
    RPA.Desktop.Click
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_button_form    
    ...    x=0    
    ...    y=-155    
    ...    action=click    # Point ID field
    Sleep    ${sleep_local}
    RPA.Desktop.Type Text    ${pointname}
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_button_form    
    ...    x=-210
    ...    y=-110
    ...    action=click    # show info checkbx
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    space
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_button_form    
    ...    x=80    
    ...    y=-155
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
    ...    y=-105    
    ...    action=click    # Option
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_button_form    
    ...    x=205    
    ...    y=-105    
    ...    action=click    # Option
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_button_form    
    ...    x=205    
    ...    y=-105    
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
    ...    y=60    
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

    RPA.Desktop.Click With Offset
    ...    alias:FXE_main_graphics_tab_editor_button_form
    ...    x=-150    
    ...    y=110    
    ...    action=click    # target ddwn

    IF    $target == 'footer'
        RPA.Desktop.Press Keys    f    # Footer
        RPA.Desktop.Press Keys    enter    # Enter
    ELSE IF    $target == 'header'
        RPA.Desktop.Press Keys    h    # Header
        RPA.Desktop.Press Keys    enter    # Enter
    ELSE
        RPA.Desktop.Press Keys    p    # Picture
        RPA.Desktop.Press Keys    enter    # Enter
    END

    RPA.Desktop.Press Keys    tab    # User level
    RPA.Desktop.Type Text    255

    RPA.Desktop.Press Keys    tab    # Group
    RPA.Desktop.Type Text    2
    Sleep    ${sleep_local}


    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_button_form    
    ...    x=210    
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
    ...    x=210
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
    ...    y=170
    ...    action=click    # CSS selector
    Sleep    ${sleep_local}
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    enter

    
    # Sleep    ${sleep_local}
    # RPA.Desktop.Click With Offset    
    # ...    alias:FXE_main_graphics_tab_editor_button_form    
    # ...    x=-50    
    # ...    y=250    
    # ...    action=click    # OK button
    # Sleep    ${sleep_local}

    RPA.Desktop.Wait For Element    alias:FXE_main_OK_form_btn    timeout=5
    RPA.Desktop.Click    alias:FXE_main_OK_form_btn    action=click

    ${result} =    Run Keyword And Return Status    Find Element    alias:FXE_main_graphics_tab_editor_button_form
    Run Keyword If    ${result}    Fail    "Button form is still visible!"



Graphics Tab Bar Create
    [Arguments]    ${pointname}    ${left}    ${top}    ${target}

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
    # RPA.Desktop.Click With Offset    
    # ...    alias:FXE_main_graphics_tab_editor_bar_form    
    # ...    x=-50    
    # ...    y=250    
    # ...    action=click    # OK button
    # Sleep    ${sleep_local}

    RPA.Desktop.Wait For Element    alias:FXE_main_OK_form_btn    timeout=5
    RPA.Desktop.Click    alias:FXE_main_OK_form_btn    action=click


Graphics Tab Symbol Create
    [Arguments]    ${pointname}    ${left}    ${top}    ${target}

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
	#	60		-280	point ddwn
	#	-200	-280	point input
	#	90		-280	limit
	#	130		-280	hiding
	#	200		-280	value
	#	200		-235	option ddwn
	#	-210	-235	show info
	#	50		-140	symbol btn
	#	50		-110	resize btn	
	#	rotate btn
	#	200		-120	background ddwn
	#	50		-60		Fixed value
	#	-200	100		left
	#	-130	100		top
	#	disabled -70		85		width
	#	disabled -15		85		lock btn	
	#	disabled 20		85		height
	#	-100	140		Targer ddwn
	#	-140	210		CSS ddwn
	#	-90		210		User level
	#	-30		210		Group
	#	-100	200		Link input
	#	20		255		Link btn
    #    -50    330    OK
    #    50    330    Apply
    #    150    330    Close

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_symbol_alarm_svg_form    
    ...    x=60    
    ...    y=-280    
    ...    action=click    # point ddwn
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_symbol_alarm_svg_form    
    ...    x=60    
    ...    y=-280    
    ...    action=click    # point ddwn
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_symbol_alarm_svg_form    
    ...    x=-200    
    ...    y=-280    
    ...    action=click    # point input
    Sleep    ${sleep_local}

    RPA.Desktop.Type Text    ${pointname}
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_symbol_alarm_svg_form    
    ...    x=90    
    ...    y=-280    
    ...    action=click    # limit
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    ctrl    a
    RPA.Desktop.Press Keys    8

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_symbol_alarm_svg_form    
    ...    x=130    
    ...    y=-280    
    ...    action=click    # Hiding
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    enter

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_symbol_alarm_svg_form    
    ...    x=200    
    ...    y=-280    
    ...    action=click    # Value
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    ctrl    a
    RPA.Desktop.Type Text    123
    Sleep    ${sleep_local}


    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_symbol_alarm_svg_form    
    ...    x=-210    
    ...    y=-235    
    ...    action=click    # show info
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_symbol_alarm_svg_form    
    ...    x=-210    
    ...    y=-235    
    ...    action=click    # show info
    Sleep    ${sleep_local}


    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_symbol_alarm_svg_form    
    ...    x=200    
    ...    y=-120    
    ...    action=click    # backgrouund
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    enter


    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_symbol_alarm_svg_form    
    ...    x=50    
    ...    y=-60    
    ...    action=click    # Fixed value
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    ctrl    a
    RPA.Desktop.Type Text    A0 A1

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_symbol_alarm_svg_form    
    ...    x=-200    
    ...    y=100    
    ...    action=click    # Left
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    ctrl    a
    RPA.Desktop.Type Text    400
    RPA.Desktop.Press Keys    tab
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    ctrl    a
    RPA.Desktop.Type Text    400
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_symbol_alarm_svg_form    
    ...    x=-100    
    ...    y=140    
    ...    action=click    # Target
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    enter
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_symbol_alarm_svg_form    
    ...    x=-140    
    ...    y=210    
    ...    action=click    # CSS
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    enter
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_symbol_alarm_svg_form    
    ...    x=-90    
    ...    y=210    
    ...    action=click    # user level
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    ctrl    a
    RPA.Desktop.Type Text    255
    Sleep    ${sleep_local}

    RPA.Desktop.Click With Offset    
    ...    alias:FXE_main_graphics_tab_editor_symbol_alarm_svg_form    
    ...    x=-100    
    ...    y=200    
    ...    action=click    # link
    Sleep    ${sleep_local}

    RPA.Desktop.Press Keys    ctrl    a
    RPA.Desktop.Type Text    new_1.htm
    Sleep    ${sleep_local}


    RPA.Desktop.Wait For Element    alias:FXE_main_OK_form_btn    timeout=5
    RPA.Desktop.Click    alias:FXE_main_OK_form_btn    action=click


    # CLOSE

    # RPA.Desktop.Click With Offset    
    # ...    alias:FXE_main_graphics_tab_editor_symbol_alarm_svg_form    
    # ...    x=150    
    # ...    y=275    
    # ...    action=click    # Close
    # Sleep    ${sleep_local}
