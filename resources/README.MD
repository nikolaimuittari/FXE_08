Robots set for testing main functionality and features of FX-Editor software tool.

Used frameworks:
RPAframework
Robotframework

FX-Editor is primarily written in Delphi (currently version 12), and none of its visible elements can be directly identified by standard Robot Framework tools using automation locators. As a result, image recognition methods and the RPA.Desktop library are primarily used in all robots.

The current set of robots is primarily designed for attended testing (walkthrough) to oversee the imitation of user actions.
Log To Console commands are used for debugging and tracing process execution.
Sleep commands are used mainly to ensure that application features are fully executed, as FX-Editor versions may exhibit significant performance differences in various features.

**Important Note:**

Due to the limitations of image recognition accuracy, to ensure correct robot operation, the FX-Editor application should be used in maximized window mode on a display with a 1920x1080 resolution and 100% scaling.

The current robots are designed for FX-Editor version 2.0.6.4 (13.12.2024) and utilize image locators (forms, display zones, icons) extracted from this and previous versions. Image locators for newer versions may differ from those used in the current robots.

