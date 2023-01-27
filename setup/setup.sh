#!/bin/bash

###############
# SETUP ROBOT #
###############

### OpenCV ###
function setup_opencv(){
	tput setaf 5
	echo "[OPENCV] Setting up OpenCV."
	tput sgr0

	# Install compiler and bulid tools.
	tput setaf 3
	echo "[OPENCV] Installing compiler g++."
	tput sgr0
	if apt install -y g++; then
		tput setaf 2
		echo "[OPENCV] Install complete"
		tput sgr0
	else
		exit 0
	fi

	tput setaf 3
	echo "[OPENCV] Installing CMake build config tool."
	tput sgr0
	if sudo apt install -y cmake; then
		tput setaf 2
		echo "[OPENCV] Install complete"
		tput sgr0
	else
		exit 0
	fi

	tput setaf 3
	echo "[OPENCV] Installing Make."
	tput sgr0
	if sudo apt install -y make; then
		tput setaf 2
		echo "[OPENCV] Install complete"
		tput sgr0
	else
		exit 0
	fi

	tput setaf 3
	echo "[OPENCV] Installing unzip."
	tput sgr0
	if sudo apt install -y wget unzip; then
		tput setaf 2
		echo "[OPENCV] Install complete"
		tput sgr0
	else
		exit 0
	fi

	# Donlaod sources.
	tput setaf 3
	echo "[OPENCV] Cloning OpenCv repo."
	tput sgr0
	cd /opt
	if wget -O opencv.zip https://github.com/opencv/opencv/archive/4.x.zip; then
		tput setaf 2
		echo "[OPENCV] OpenCv repo cloned successfully."
		tput sgr0

	else
		exit 0
	fi

	# Setting up directories for build.
	unzip opencv.zip
	mv opencv-4.x opencv
	cd opencv && mkdir -p build && cd build
	
	# Configure - generate build scripts.
	tput setaf 3
	echo "[OPENCV] Generating build scripts."
	tput sgr0
	if cmake ../; then
		tput setaf 2
		echo "[OPENCV] Build scripts generated."
	else
		exit 0
	fi

	#Build - run actual compilation process
	tput setaf 3
	echo "[OPENCV] Build."
	tput sgr0
	if make -j4; then
		tput setaf 2
		echo "[OPENCV] Build compplete."
	else
		exit 0
	fi

	# Install
	tput setaf 3
	echo "[OPENCV] Installing software."
	tput sgr0
	if make install; then
		tput setaf 2
		echo "[OPENCV] Installation complete."
	else
		exit 0
	fi

	tput setaf 2
	echo "[OPENCV] OpenCV setup complete."
	tput sgr0
}

### ROS ###
function setup_ros(){
	tput setaf 5
	echo "[ROS] Setting up ROS."

	# Setup source.list
	tput setaf 3
	echo "[ROS] Setup source.list file."
	tput sgr0
	if sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'; then
		tput setaf 2
		echo "[ROS] source.list file successfully setup."
		tput sgr0
	else
		exit 0
	fi

	# Check if the curl command is installed. If not then install it.
	which curl
	if [ $? -eq 1 ]; then
		tput setaf 3
		echo "[ROS] Installing curl."
		tput sgr0
		apt-get -y install curl
	fi

	# Set up keys
	tput setaf 3
	echo "[ROS] Setting up keys."
	tput sgr0
	if curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -; then
		tput setaf 2
		echo "[ROS] Keys setup successfully."
	else
		exit 0
	fi

	# Installating ROS Noetic.
	tput setaf 3
	echo "[ROS] Installing ROS NOETIC: (Bare Bones)."
	tput sgr0
	if apt -y install ros-noetic-ros-base; then
		tput setaf 2
		echo "[ROS] Install complete."
	else
		exit 0
	fi

	# Installling ROS packages.
	tput setaf 3
	echo "[ROS] Installing ROS packages listed in ros_pkgs.txt file."
	# FIXME: Abs path must be specific to different machines.
	if [ ! -f /home/mach1/mach1/config/ros_pkgs.txt ]; then
		# File does not exist.
		tput setaf 1
		echo "[ROS] File not found in /home/mach1/mach1/config/ directory."
		exit 0
	else
		# Install packages.
		for PKG in $(cat /home/mach1/mach1/config/ros_pkgs.txt); do
			tput setaf 3
			echo "[ROS] Installing $PKG."
			tput sgr0
			if apt -y install $PKG; then
				tput setaf 2
				echo "[ROS] Package installation complete."
			fi
		done
	fi

	echo "[ROS] Setup complete."
	tput sgr0
}

### PIGPIO ###
function setup_pigpiod(){
	tput setaf 5
	echo "[PIGPIO] Setting up pigpiod."

	# Download pigpio library.
	tput setaf 3
	echo "[PIGPIO] Downloading lateset version of pigpio."
	tput sgr0
	if wget https://github.com/joan2937/pigpio/archive/master.zip; then
		unzip master.zip # Unzip file.
		tput setaf 2
		echo "[PIGPIO] Download complete."	
	else
		exit 0
	fi

	# Change directory.
	cd pigpio-master/
	
	# Build
	tput setaf 3
	echo "[PIGPIO] Building software."
	tput sgr0
	if make; then
		tput setaf 2
		echo "[PIGPIO] Build complete."
	else
		exit 0
	fi

	# Install
	tput setaf 3
	echo "[PIGPIO] Installing software."
	tput sgr0
	if make install; then
		tput setaf 2
		echo "[PIGPIO] Installation complete."
	else
		exit 0
	fi

	# Create pigpio service.
	tput setaf 3
	echo "[PIGPIO] Creating pigpiod service."
	tput sgr0
	cat > /etc/systemd/system/pigpiod.service <<EOF
[UNIT]
Description=pigpio daemon

[Service]
ExecStart=/usr/local/bin/pigpiod -x 0xFFFFFFF
ExecStop=/bin/systemctl kill -s SIGKILL pigpiod
Type=forking

[Install]
WantedBy=multi-user.target
EOF
	# Appened EOF at the end of pigpiod.service file.
	echo > 'EOF' >> /etc/systemd/system/pigpiod.service

	# Enable service
	tput setaf 3
	echo "[PIGPIO] Enabling pigpiod service."
	tput sgr0
	systemctl enable pigpiod

	# Start service
	echo "[PIGPIO] Starting pigpiod serivce."
	systemctl start pigpiod

	tput setaf 2
	echo "[PIGPIO] Setup complete."
	tput sgr0
}

### Print the help message ###
function display_help_message(){
	cat << EOF
Description: This script downloads, installs and sets up all neccessary
	     packages and dependencies required for the robot to function.
            *NOTE: Do not forget to run sudo if you are not root user.

Usage: sudo ~/mach1/config$0 [options]

Options:
--help, -h      Show this help message.
--ros,  -r      Install ROS as well.
EOF
	# Exit the script
	exit 0
}

function main(){
	# Check if the --help or -h option was passed
	if [[ "$1" == "--help" || "$1" == "-h" ]]; then
		display_help_message
	else
		# Update packages.
		tput setaf 5
		echo "[UPDATE] Updating packages."
		tput sgr0
		apt -y update
		
		tput setaf 2
		echo "[UPDATE] Update completed."
		tput sgr0

		# TODO: REMOVE ONCE DONE 
		# OPENCV
		setup_opencv
		exit 0

		# ROS 
		if [[ "$1" == "--ros" || "$1" == "-r" ]]; then
			setup_ros
		fi	

		# PIGPIO
		cd /opt
		setup_pigpiod

		# OPENCV
		setup_opencv
	fi
}

### RUN SCRPIT ###
main $1