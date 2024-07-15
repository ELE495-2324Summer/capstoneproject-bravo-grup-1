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
- This project aims to develop an autonomous parking vehicle using a JetBot powered by Jetson Nano. JetBot will be able to find its allocated parking space and park without crossing the red lines on the platform. The goal of the system is to ensure that JetBot can find the allocated parking space autonomously, park within the specified limits, and report a penalty point (-1 point) to the application on the phone for each violation, so that the total penalty points can be tracked at the end of the parking process.
- In light of the project requirements, each group will be assigned a parking space on a white cardboard platform with a license plate number. Starting from a random location, JetBot must find its assigned parking spot and park within three minutes without touching the red lines. After successful parking, a completion message will be delivered to the phone. If the assigned parking space is not available on the platform, the system will inform the phone that there is no parking space. During the demo, the parking process will be repeated by changing the assigned license plate number. Additionally, JetBot will be moved by violating the red line twice and the total penalty points will be displayed on the phone.


## Features
- Our project consists of three main modules that enable JetBot to park autonomously in a designated parking area. These modules; They are Number Recognition Module, Road Tracking Module and Parking Module. In addition to these modules, there is a 'Red Line Violation Module' that detects whether red lines have been crossed. The operation and integration of each module has been carefully planned, implemented and tested to achieve the goal of the project.
# Number Recognition (Image Processing) Module
This module is designed to detect numbers in images captured by the CSI camera. Initially, models were trained with different methods such as TensorFlow, PyTorch and AlexNet, and although the test and validation values ​​of these models were good, it was observed that they did not provide the expected performance in real-time number recognition. To solve this problem, the 'Pytesseract' module, which uses 'OCR (Optical Character Recognition) technology, was switched to. ‘Pytesseract’ is integrated with Jupyter Notebook by running on ‘Docker’. The images captured by the camera were converted to gray scale and transmitted to the model, and the number read on the output was obtained.
# Black Line Tracking (Road Tracking) Module
This module was developed so that JetBot can follow a specific path. By using the 'Road Following' model among the demo projects in the notebook folder that comes with the JetBot image, JetBot was enabled to follow the black line passing through the middle of the platform. Using the training codes in the demo project, JetBot's own path tracking model was trained and operated successfully. This module plays a critical role in ensuring that the vehicle can proceed on the desired route.
# Parking Module
The parking area was considered as a road following task and therefore a 'Road Following' based model training method was used. The parking model for entering the parking area was trained several times and in the final stage, it was converted to 'TRT' file format and implemented. This module ensures that the vehicle is parked safely in the parking area that it has determined belongs to it.
# Red Line Violation Module
The Red Line Violation Module is designed to detect whether the JetBot violates red boundary lines in the parking area. This module detects red lines marking parking area boundaries using 'TCS34725' color sensors. When JetBot passes over a red line, sensors detect this violation and JetBot instantly sends a penalty point (-1 point) to the smartphone.

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
