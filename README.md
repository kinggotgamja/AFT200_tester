* This code is designed for reading the AFT200-D80 6-axis force sensor of AIDIN Robotics in South Korea
* it use the CAN version -> Need CAN to Ethernet
* it do not require the ROS system

* Build procedure
  1. at /build
  2. cmake ..
  3. make

* Execution
  1. at /build
  2. ./AFT~
  3. If Sensor Force ID: 1 (normaly 1)
  4. insert "1" at ID request
  5. after that, enter the number "3,1,0~"
