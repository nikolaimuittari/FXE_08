*** Settings ***
Library    Process
Resource            resources/common.resource
Resource            resources/recording.resource


*** Keywords ***
Start OBS Recording
    Start Process    obs --startrecording

Stop OBS Recording
    Start Process    obs --stoprecording

Set Video File Name
    [Arguments]    ${robot_file}    ${timestamp}
    ${clean_robot_file}=    Replace String    ${robot_file}    ' '    '_'
    [Return]    ${OUTPUT_DIR}\\${clean_robot_file}_${timestamp}.mp4

Start Screen Recording
    ${timestamp}=    Get Current Timestamp
    ${robot_file}=   Get Current Suite Name
    ${video_file}=   Set Video File Name    ${robot_file}    ${timestamp}

    Log To Console    robot_file: ${robot_file}
    Log To Console    video_file: ${video_file}

    Sleep    1s  # Give some time for FFmpeg to initialize
