[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/5mCoF9-h)
# TOBB ETÜ ELE495 - Autonomous Vehicle Parking Project with Artificial Intelligence

# Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Screenshots](#screenshots)
- [Acknowledgements](#acknowledgements)

## Introduction
This project aims to develop an autonomous parking vehicle using a JetBot powered by Jetson Nano. JetBot will be able to find its allocated parking space and park without crossing the red lines on the platform. The goal of the system is to ensure that JetBot can find the allocated parking space autonomously, park within the specified limits, and report a penalty point (-1 point) to the application on the phone for each violation, so that the total penalty points can be tracked at the end of the parking process.
In light of the project requirements, each group will be assigned a parking space on a white cardboard platform with a license plate number. Starting from a random location, JetBot must find its assigned parking spot and park within three minutes without touching the red lines. After successful parking, a completion message will be delivered to the phone. If the assigned parking space is not available on the platform, the system will inform the phone that there is no parking space. During the demo, the parking process will be repeated by changing the assigned license plate number. Additionally, JetBot will be moved by violating the red line twice and the total penalty points will be displayed on the phone.


## Features
### Method
Our project consists of three main modules that enable JetBot to park autonomously in a designated parking area. These modules; They are Number Recognition Module, Road Tracking Module and Parking Module. In addition to these modules, there is a 'Red Line Violation Module' that detects whether red lines have been crossed. The operation and integration of each module has been carefully planned, implemented and tested to achieve the goal of the project.
#### Number Recognition (Image Processing) Module
- This module is designed to detect numbers in images captured by the CSI camera. Initially, models were trained with different methods such as TensorFlow, PyTorch and AlexNet, and although the test and validation values ​​of these models were good, it was observed that they did not provide the expected performance in real-time number recognition. To solve this problem, the 'Pytesseract' module, which uses 'OCR (Optical Character Recognition) technology, was switched to. ‘Pytesseract’ is integrated with Jupyter Notebook by running on ‘Docker’. The images captured by the camera were converted to gray scale and transmitted to the model, and the number read on the output was obtained.
![image](https://github.com/user-attachments/assets/27dc9fda-74ff-4149-90d2-81f85d0220b3)
#### Black Line Tracking (Road Tracking) Module
- This module was developed so that JetBot can follow a specific path. By using the 'Road Following' model among the demo projects in the notebook folder that comes with the JetBot image, JetBot was enabled to follow the black line passing through the middle of the platform. Using the training codes in the demo project, JetBot's own path tracking model was trained and operated successfully. This module plays a critical role in ensuring that the vehicle can proceed on the desired route.
![image](https://github.com/user-attachments/assets/b45095f8-da2a-4151-92fc-9477b954431a)
#### Parking Module
- The parking area was considered as a road following task and therefore a 'Road Following' based model training method was used. The parking model for entering the parking area was trained several times and in the final stage, it was converted to 'TRT' file format and implemented. This module ensures that the vehicle is parked safely in the parking area that it has determined belongs to it.
![image](https://github.com/user-attachments/assets/80883dd6-8cc3-45d8-bd33-19ed7ca197bd)
#### Red Line Violation Module
- The Red Line Violation Module is designed to detect whether the JetBot violates red boundary lines in the parking area. This module detects red lines marking parking area boundaries using 'TCS34725' color sensors. When JetBot passes over a red line, sensors detect this violation and JetBot instantly sends a penalty point (-1 point) to the smartphone.
![image](https://github.com/user-attachments/assets/be43096c-6b18-43fd-a40a-90992b7b83c5)

Before the application starts running, the path tracking model is loaded into JetBot. This installation process takes a certain amount of time. After the model is loaded, the software starts waiting for license plate input from the mobile application. When the license plate input is received, JetBot moves a certain distance and turns left using the road tracking software. After completing the turn, it reads the number in front of it with the help of number recognition software and compares this number with the license plate input. If the number read matches the plate assigned to it, it loads the parking model and moves to the parking function. During this process, red sensors are activated and send a violation score (-1 point) to the mobile application in case of parking line violation. If the number read does not match the license plate, JetBot returns to the road and moves a certain distance, repeating this process for the first 5 parking spaces. If it cannot find the right match in all 5 parking spaces, it turns in the opposite direction at the end of the black line and repeats this process for 5 parking spaces. If it cannot find the number it is looking for after checking all parking spaces, the mobile application returns the message 'Parking Space Not Found'.

![Akış_Şeması_Final_Raporu](https://github.com/user-attachments/assets/b2f51e18-c708-45b7-af60-924ceac638c0)

### Technical Documentation
#### Jetson Nano 2GB Developer Kit and Waveshare JetBot
 Waveshare JetBot is an autonomous robot platform that works integrated with the Jetson Nano 2GB Developer Kit. It moves with its engines and wheels and senses its environment with various sensors. Jetson Nano runs artificial intelligence applications with its high-performance GPU and stands out with its small size. It runs on Ubuntu/Linux operating system and supports Python programming languages.
#### IMX219-160 CSI Camera
 IMX219-160 Camera is an 8 megapixel CSI camera module used on JetBot. With its 160° wide angle, it provides high accuracy in autonomous driving and object recognition applications.
#### TP-Link TL-WN725N 150Mbps Wireless N Nano USB Wi-Fi Adapter
 TP-Link TL-WN725N is a wireless adapter that allows JetBot to connect to the internet. It provides data transfer at 150Mbps and can be easily installed with its plug-and-play feature.
#### TCS34725 Color Sensors
 TCS34725 Color Sensors are two sensors used to detect red lines. It detects red line violations with its high-precision color detection feature.
#### Samsung Evo Plus Class10 UHS-I U3 128GB Micro SD Card
 Samsung Evo Plus 128 GB Micro SD Card is used for operating system and data storage in Jetson Nano. It has high-speed data reading and writing capacity with Class10 and UHS-I U3 speed class.


## Installation
Describe the steps required to install and set up the project. Include any prerequisites, dependencies, and commands needed to get the project running.

```bash
# Example commands
git clone https://github.com/username/project-name.git
cd project-name
```

## Usage
Provide instructions and examples on how to use the project. Include code snippets or screenshots where applicable.

## Screenshots
Include screenshots of the project in action to give a visual representation of its functionality. You can also add videos of running project to YouTube and give a reference to it here. 

## Acknowledgements
Give credit to those who have contributed to the project or provided inspiration. Include links to any resources or tools used in the project.

[Contributor 1](https://github.com/user1)
[Resource or Tool](https://www.nvidia.com)
