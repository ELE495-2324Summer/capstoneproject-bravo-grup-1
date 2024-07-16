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
 
![image](https://github.com/user-attachments/assets/de262c03-df0b-45f5-a88c-9aaba4d76015)

## Installation
### Setting up Jetson Nano and assembling with Jetbot
Assemble Jetson Nano with Jetbot. Write according image to MicroSD card and insert it Jetson Nano's slot. To work with headless set up, use MicroUsb cable and make Jetson Nano connect your internet. As Jetson Nano connects to internet, it shows an IP adress on its screen. Go to IPadress:8888 to reach JupyterLab. On JupyterLab we will use road following file to make our dataset and train our model for black line tracking and parking algorithms. 
For the overall code, we need to install libraries.
Flask for our communication with app:
```
pip install Flask

```
Torch2trt for TRTmodule:
```
git clone https://github.com/NVIDIA-AI-IOT/torch2trt.git
```
Numpy:
```
pip install numpy
```
PIL.Image:
```
pip install pillow
```
Cv2:
```
pip install opencv-python
pip install opencv-python-headless  # For systems without GUI support

```
Pytesseract:
```
sudo apt update
sudo apt install -y tesseract-ocr
pip install pytesseract
```
Smbus2:
```
sudo apt install -y i2c-tools
pip install smbus2

```
RPi.GPIO:
```
pip install RPi.GPIO

```


## Usage
This code is designed for TOBB University of Economics and Technology's 2024-2025 ELE495 course Final Project named as Parking with AI. It is specifically designed for the requirements of the project. The usage is limited to autonomous movement of Jetbot for finding its park plate and correctly parking in 3 minutes.

## Acknowledgements
### [Contributors]
```
Ahmet Mevlüt Güneşer - github.com/
Mehmet Emin Erdoğan - github.com/
Murat Seymen Gencel - github.com/
Mükremin Kerem Baloğlu - github.com/
```

### [Resources]
```
[1] https://github.com/dusty-nv/jetson-inference
[2] https://developer.nvidia.com/embedded/learn/get-started-jetson-nano-devkit
[3] https://github.com/winter2897/Real-time-Auto-License-Plate-Recognition-with-Jetson-Nano
```
