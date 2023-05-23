# AutoInsight

RaspberryPi based Vehicle and Crash Detection system, powered by Flutter, Ongoing as a part of Project based learning.

## Motivation
More than **800,000** accidents occur due to blind spots every year. The side view mirrors in our vehicles cannot show us everything that is behind us. There could be a car in proximity that we might not know about. We could collide into this invisible car while changing lanes. 
To avoid such collisions the driver must know if any vehicle is present in its proximity without having to look in the window and divert attention from the steering wheel. 

## Objective
To construct a software which will alert the driver of a vehicle in their blind spot by using cameras/sensors and construct a Flutter app for the same. 
To implement a cloud-based dash camera system to record footage of an accident. 

## Software Requirements
- Python v3.11.1 
- OpenCV library (Version: OpenCV 4) 
- Yolov5
- Flutter v3.7.7 
- Android Studio – IDE for App Development 
- Android Emulator (for testing the app before deployment) 
- Raspbian OS (Operating System present on Raspberry Pi) 

## Hardware requirement

- Raspberry Pi Microcontroller  
- Raspberry Pi touchscreen display (Link) 
- Proximity Sensors 
- Depth camera for RasPi (Link) 

## Usage

- Using OpenCV / Yolov5 libraries in python to detect objects (vehicles) in blind spots, and displaying the relative positions of the side vehicles, along with other features such as Speedometer, GPS Navigation, etc. on a interactive touchscreen dashboard. 
- To record footage of an accident and upload it to cloud to be presented later as evidence. 

## References

1. https://www.geeksforgeeks.org/opencv-python-program-vehicle-detection-video-frame/?ref=rp 
2. https://www.udemy.com/course/flutter-bootcamp-with-dart/learn/lecture/14485490#overview 
3. https://www.geeksforgeeks.org/opencv-python-tutorial/#getting 
4. https://www.udemy.com/course/python-for-machine-learning-data-science-masterclass/learn/lecture/17770108#overview 
