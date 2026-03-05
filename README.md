# Design-and-Control-of-a-Delta-Robot-Leg

## Project Overview
- This project focuses on the design and control of a Delta robot leg, inspired by robotic locomotion systems such as robot dogs.
- The robot uses a parallel Delta robot architecture with three actuated arm, driven by DC motors and controlled by an ESP32 (SoC) microcontroller. The postion of the end effector is calculated using inverse kinematics, allowing the robot leg to move in Cartesian space.
- This project combines MATLAB simulation, CAD modeling, PCB design, and embedded programming.

## Project Stages
### MATLAB
#### Task included:
##### Motion analysis:
- Five-bar linkage analysis
- Forward kinematic calculation
- Inverse kinematic calculation
- Animation of robot motion following Cartesian trajectories
##### Control Interface:
- 3D visualization of the robot mechanism
- Slider control for Cartesian movement
- Real-time calculation of motor angles from inverse kinematics
### Mechanical Design
- The mechanical structure of the robot was designed using SolidWorks
### Electronics Design
- A wiring diagram and PCB layout were created to ensure reliable connections between components
### Embedded Control System
- PWM control
- PID control
- Encoder feedback reading
## Technologies Used
### Software:
- MATLAB
- SolidWorks
- Cadance
- VS Code with platformIO
### Hardware:
- ESP32 microcontroller
- DC motors with encoders
- Motor driver modules
- Power supply system
### Languages
- C/C++ (Embedded)
- MATLAB
## Limitation And Challenges
- During final system integration, the robot prototype encountered mechanical and control stability issues that prevented the system from performing smooth leg movements as expected.
- Although individual subsystems were tested successfully (PWM motor control, encoder reading, PID control, and MATLAB simulation)
## This project was completed as part of a group project
## My Main Contribution
- Implemented MATLAB simulation for the five-bar linkage system, including kinematic modeling and motion visualization
- Assisted in develeoping the MATLAB App Desinger interface
- Implemented PWM-based motor control on the ESP32, enabling speed control of DC motors
- Designed PCB layout and wiring diagram  for intergrating the ESP32, motors, motor drivers
- Contributed to hardware testing and integration of the Delta robot leg prototype
## DEMONSTRATION
### 5-Bar Linkage Simulation:
![Image](https://github.com/user-attachments/assets/b48c6e9a-30bb-440a-a7be-641b6b40ca1f)
### Delta Robot Mechanism & Analysis:
![Image](https://github.com/user-attachments/assets/3e418a74-33fb-4b5b-9149-47e39e397cc8)
### 3D Control Interface:
![Image](https://github.com/user-attachments/assets/b1b0b312-5e6a-4f6e-b422-656d3bc90af6)
### PCB Design:
<img width="730" height="533" alt="Screenshot 2024-09-14 151600" src="https://github.com/user-attachments/assets/d2b183da-df04-4569-86f2-5dad2f09c3d1" />
### Motors Control:
![Image](https://github.com/user-attachments/assets/cf3ac9c4-0f0f-4537-8160-777d5fa8ad89)
### Delta Robot Prototype:
![93fa1d29d2d783f6a5f27b9cddc6bc11](https://github.com/user-attachments/assets/b4323027-9751-47b2-9a07-f4e8018b97cc)
![IMG_8862](https://github.com/user-attachments/assets/45683292-8722-4ae9-9b80-a7fc332d1512)




