# Mach1 Robot Project ROS Packages

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

The **Mach1 Robot ROS Packages** (mach1_code) repository contains the collection of ROS packages specifically designed for the Mach1 Robot Project. These packages are responsible for controlling and managing various aspects of the Mach1 robot, including its hardware, navigation, simulation, and more. Below is an overview of the packages available in this repository.

## Packages Overview

### Mach1 Bringup Package
- **Overview**: Responsible for configuring and setting up the Mach1 robot, this package contains the necessary files and configurations required to initialize the robot within the ROS environment.
- **Author & Maintainer**: Julian Rendon (julianrendon514@gmail.com)
- **Repository**: [Mach1 Bringup Package](https://github.com/jrendon102/mach1_bringup)

### Mach1 Hardware Package
- **Overview**: Designed to control the Yahboom 4WD expansion board for the Mach1 robot, this package serves as a communication and control interface for managing the hardware components of the robot.
- **Author & Maintainer**: Julian Rendon (julianrendon514@gmail.com)
- **Repository**: [Mach1 Hardware Package](https://github.com/jrendon102/mach1_hardware)
- **Sub-Packages**:
  1. [Camera Driver](https://github.com/jrendon102/camera_driver): A C++ library for interacting with standard cameras.
  2. [gpiozero_plus](https://github.com/jrendon102/gpiozero_plus): A Python library for controlling hardware components.

### Mach1 Msgs Package
- **Overview**: This package contains custom message (msg), service (srv), and action (action) files for the Mach1 robot. These custom definitions are kept in a separate package for independent compilation and importation into other packages as needed.
- **Author & Maintainer**: Julian Rendon (julianrendon514@gmail.com)
- **Repository**: [Mach1 Msgs Package](https://github.com/jrendon102/mach1_msgs)

### Mach1 Navigation Package
- **Overview**: Provides navigation logic for the Yahboom G1 Tank mobile robot. It includes ROS nodes to control the robot's motion based on various inputs such as joystick controllers, sensor data, and environment maps.
- **Author & Maintainer**: Julian Rendon (julianrendon514@gmail.com)
- **Repository**: [Mach1 Navigation Package](https://github.com/jrendon102/mach1_navigation)

### Mach1 Simulation ROS Package
- **Overview**: Offers a comprehensive simulation environment for the Mach1 robot, including a 3D model of the robot, configuration files, and launch files for visualization and simulation within the ROS framework.
- **Author & Maintainer**: Julian Rendon (julianrendon514@gmail.com)
- **Repository**: [Mach1 Simulation ROS Package](https://github.com/jrendon102/mach1_simulation)

### ROS Utils Package
- **Overview**: A C++ library designed to simplify ROS development by providing utility functions for common ROS tasks, a versatile template class for message handling, and custom exception classes for improved error handling.
- **Author & Maintainer**: Julian Rendon (julianrendon514@gmail.com)
- **Repository**: [ROS Utils Package](https://github.com/jrendon102/ros_utils)

## Get Started

The `mach1_code` repository already functions as a ROS workspace containing all the necessary ROS packages for the Mach1 Robot Project. If you don't have ROS installed, you can refer to the [official ROS website](http://wiki.ros.org/ROS/Installation) for installation instructions. 

To get started, follow these steps:

1. Clone this `mach1_code` repository to your local machine:
   ```bash
   git clone --recurse-submodule git@github.com:MACH1-ROBOT/mach1_code.git
   ```

2. Build the ROS workspace using `catkin_make` or your preferred ROS build tool to compile and make the packages available for use.

3. Customize and extend the packages as needed to match the requirements of your Mach1 robot project.

## License

All the ROS packages in this project are released under various licenses, including the MIT License. Please check the specific package's README or LICENSE file for more details on licensing.

## Author & Maintainer

This repository, including all the ROS packages, is authored and maintained by me, Julian Rendon. If you have questions, require support, or need further information about any of the packages, you can reach out to me via email at julianrendon514@gmail.com.
