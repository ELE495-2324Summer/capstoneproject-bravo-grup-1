[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/5mCoF9-h)
# TOBB ETÜ ELE495 - Autonomous Vehicle Parking Project with Artificial Intelligence

# Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Acknowledgements](#acknowledgements)

## Introduction
This project involves developing an autonomous parking vehicle using a JetBot powered by Jetson Nano. The JetBot will autonomously find its allocated parking space and park without crossing red lines on the platform. It will report a penalty point for each violation to a mobile app, which will track the total penalty points. Each group is assigned a parking space with a license plate number. Starting from a random location, the JetBot must park within three minutes without touching red lines. After parking, a completion message will be sent to the phone, and if no parking space is available, the system will inform the phone.

## Features
- Jetson Nano Platform: Leverages the computational power of Jetson Nano for real-time processing and parking operations.
- Number Recognition Module: Utilizes the Pytesseract OCR module for accurate detection of numbers from images captured by the CSI camera, integrated within a Jupyter Notebook running on Docker.
- Black Line Tracking Module: Employs a custom-trained 'Road Following' model to enable JetBot to follow a black line path on the platform, ensuring precise navigation.
- Parking Module: Implements a road-following based model to guide JetBot into designated parking spaces, converted to the TRT file format for efficient operation.
- Red Line Violation Module: Uses TCS34725 color sensors to detect and report violations of red boundary lines, instantly sending penalty points to the mobile application.
- Mobile Application Interface: Facilitates user input of license plate information and provides real-time updates on JetBot’s parking status, including completion messages and penalty points.

## Installation
To set up your Jetson Nano and JetBot, start by assembling the Jetson Nano with the JetBot kit. Write the appropriate image to a MicroSD card and insert it into the Jetson Nano's slot. For a headless setup, use a MicroUSB cable to connect the Jetson Nano to your internet. Once connected, the Jetson Nano will display an IP address on its screen. Access JupyterLab by navigating to http://IPaddress:8888 in your web browser.
In JupyterLab, we will use the road following file to create our dataset and train models for black line tracking and parking algorithms. To get started, install the necessary libraries:
```
pip install Flask  # For communication with the app
git clone https://github.com/NVIDIA-AI-IOT/torch2trt.git  # Torch2trt for TRT module
pip install numpy  # Numpy
pip install pillow  # PIL.Image
pip install opencv-python
pip install opencv-python-headless  # For systems without GUI support
sudo apt update
sudo apt install -y tesseract-ocr  # Pytesseract
pip install pytesseract
sudo apt install -y i2c-tools
pip install smbus2  # Smbus2
pip install RPi.GPIO  # RPi.GPIO
```

## Images
![WhatsApp Image 2024-07-16 at 22 32 17](https://github.com/user-attachments/assets/26d0410b-32a0-4007-928c-0b787229e069)

## Acknowledgements
- https://github.com/dusty-nv/jetson-inference
- https://developer.nvidia.com/embedded/learn/get-started-jetson-nano-devkit
- https://github.com/winter2897/Real-time-Auto-License-Plate-Recognition-with-Jetson-Nano

