# Robot-movement-analysis-MATLAB

<h3> Background: </h3>

In this project, I considered the movement (and control) of a robotic vehicle moving around
a 2D space. For example, a robot vacuum cleaner moving around a room.
This project aims to know a path that the robotic vehicle took during a certain interval of
time. However, any automated vehicle will only save its position (or share it with the central computer)
at regular time intervals. Of course, those intervals may be short, but we still only have access to
finitely many data points. From those points we want to reconstruct, as well as possible, the entire
motion of the vehicle. 


<h3> Problem Statement: </h3>

The project considers the data saved in the posted robpos.mat data file. This file contains a matrix with 61 rows
and 3 columns, with positions of the robot measured every 1 second during an interval of 1 minute.
In each row, the first column represents the timestamp of the measurements (in seconds), the second
column represents the robot’s 𝑥-coordinate in meters at the corresponding time, and the third column
represents its 𝑦-coordinate in meters.

<h3> Disclaimer: </h3>

This project was built for a course's final project. The contents inside robos.mat file is 
not my own intellectual property. However, the analysis and the code was written by me and is only uploaded for 
showcase purposes and may not be recreated for commercial and/or other course projects. 
Thank you for visiting my GitHub and feel free to check out some other projects if you can :) 
