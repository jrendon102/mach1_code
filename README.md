# MACH 1

### Overview
This is a small personal project of mine which simply aims to expand my knowledge in Robotics and programming in general. I assembled a headless mobile tank robot using a [Yahboom G1 tank kit](https://category.yahboom.net/collections/featured/products/g1tank), [RPLiDAR-A3](https://www.amazon.com/dp/B07TJW5SXF?ref=nb_sb_ss_w_as-reorder-t1_ypp_rep_k1_1_5&amp&crid=33YV1R0JHUBZR&amp&sprefix=rplid) and a [Raspberry Pi 4 (8GB RAM)](https://www.amazon.com/Raspberry-Pi-Computer-Suitable-Workstation/dp/B0899VXM8F/ref=sr_1_3?crid=3RDC2N4EY4LD5&keywords=raspberry+pi+4+8gb+ram&qid=1654793978&s=electronics&sprefix=raspberry+pi+4+8gb+ram%2Celectronics%2C77&sr=1-3). The SSD card was wiped clean to install and configure a headless Ubuntu Sever 20.04 along with ROS Noetic (Bare Bones).

### Setup
1. Clone the repository and the submodule(s).
   ```
   git clone --recurse-submodules git@github.com:jrendon102/mach1.git
   ```
### Dependencies
1. gpiozero
   - Download, installation and documentation can be found [here](https://gpiozero.readthedocs.io/en/stable/installing.html).
   - This library is used to communicate with the gpio pins on the Raspberry Pi.

2. OpenCV 4
   - Download, installation and set up can be found [here](http://www.codebind.com/linux-tutorials/how-to-install-opencv-in-ubuntu-20-04-lts-for-c-c/).
   - Needed to setup the usb connected camera.
3. Clang 12 
   - run the following commands in a terminal session.
      ```
      sudo apt install clang-12 --install-suggests
      ```
   - Used to format cpp files in `camera_usb_driver` package.

   <mark>**Note:**</mark> More info can be found in each packages `README.md` files.
### Videos
***Coming soon.***

### Author
Julian Rendon (julianrendon514@gmail.com)