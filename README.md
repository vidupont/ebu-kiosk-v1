# Proximus EBU Kiosk v1

Project : Proximus EBU Kiosk Showcase

The EBU Kiosk is a Demo & IoT Media Totem which demonstrate Proximus services, technology solutions or simply have fun like the "Ring the Bell" app.

Original idea from Henry Boutry & Gaëtan Willems.
Design / Making by Vincent Dupont (Totem Sketch, Woodworking making, IoT & Physical interfaces).

The Project is currently under-development, with basic showcase features.  It will improve with additional apps.


Owner : Vincent Dupont (SIT/NUC) - vincent.dupont@proximus.com
Contributors:
  - Henry Boutry (henry.boutry@proximus.com) - PoC Python WINCAM

Branches:
  - Master : Main branch with committed
  - Production : Version running on EBU Kiosk
  - Playground : testing & new code

Goals:
 - A Physical Kiosk with UI and IoT devices
 - Integration with Proximus EnCo APIs
 - Integration with Spark API

Use Cases:
 - Photo Booth : Employee interacts with the physical UI (push button, keyboard, trackpad ) , take a selfie and put a message which will be published on Spark
 - Ring the Bell : Spark Bot monitor specific Event into a Spark Space and rings the bell
 - Videos : Proximus Youtube Videos
 - Photos Gallery : EBU Photos Gallery, Kiosk Making of ...
 - IoT Demo
 - FMU Demo
 - Spark room topic display
 - Salesforce stats
 - Digital Signage information (weather, trains schedules)

 Design:
 - Raspberry Pi 3 runs the Human Interfaces & Applications + communications to Cloud
 - Arduino focus on local physical buttons & devices, LEDs , watchdog Raspi 3 , power management of Kiosk

 Hardware:
 - Raspberry PI 3 as main Kiosk CPU
   |
   - HDMI IPS Screen with Multitouch
   - USB Keyboard , Bluetooth Touch device
   - Integrated Speakers (via Raspberry Jack)
   - USB Webcam (Logitech C925 Pro)
   - Front ePaper 296x128 pixel (2 colors) SPI display


 - Arduino Mega MCU for sensors, physical UI
   |
   - DI/O : Physical push buttons (1 Big, 4 Smalls) with integrated RGB LEDs
   - RF ID Card / Button reader RC522
   - DO : 2 x 5v/220v Relays
   - IR Receiver / IR Transmitter : Remote controls
   - Sensors:
    |
    - distance (HC-SR04) : detect someone is in front of the Screen
    - loudness (Grove) : measure room noise level
    - light (Grove) : measure room light
    - THP (Grove BME280) : measure room temperature, humidity and pressure
    - GPS (Grove SIM28) : position of the kiosk
    - Magnetic door switch (Grove) : monitor main trap door
    - Air Quality (Grove) : measure air Quality
    - 3-Axis Accelerometer (Grove) : detects when Kiosk is moved
    - PIR (Grove) : presence detection
    - Tilt (Grove) : detect a shock on the Kiosk
   - Motor control shield
    |
    - 12/24v Solenoid : move the physical bell (ring)  

 - Main 4-ports USB HUB : Power USB devices (off-load Raspberry)
 - Second 2-ports USB HUB : External ports for casual usage (mouse, usb stick)

 - Connectivity:
  - Raspberry LAN & WIFI : DHCP/LAN , WIFI/HOTSPOT Internet , WIFI/SSID
  - Arduino : USB to HUB (Power & Uploads) , UART TX/RX to Raspberry


 Framework:
 - Resin.IO OS & Remote Management
 - Arduino sketch for MCU
 - Python & Kivy framework
