import os
import subprocess
from datetime import datetime

# Define the timestamp
timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")

# Define the paths to the robot files
robot_files = [
    "FXE_start_stop.robot",
    "FXE_new_project_wizard.robot",
    "FXE_start_menu_items.robot",
    "FXE_main_view_menu_items.robot",
    "FXE_main_upper_menu.robot",
    "FXE_main_tabs_points_tab.robot",
    "FXE_main_tabs_modules.robot",
    "FXE_main_tabs_others.robot",
    "FXE_main_template.robot",
    "FXE_main_tabs_fidelix_tab.robot",
    "FXE_main_tabs_st_edit_tab.robot",
    "FXE_main_tabs_graphics_tab.robot",
    ]

# Define the output directory
output_dir = "output"

# Run each test suite with a timestamped log file
for robot_file in robot_files:
    test_name = os.path.splitext(os.path.basename(robot_file))[0]  # Get the test name without extension
    log_file = f"{output_dir}/log_{test_name}_{timestamp}.html"
    
    # Run the robot framework test
    subprocess.run([
        "python", "-m", "robot", 
        "--report", "NONE", 
        "--outputdir", output_dir,
        "--log", log_file, 
        robot_file
    ])
