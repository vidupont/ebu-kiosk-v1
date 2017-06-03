# Proximus EBU Kiosk v1

Project : Proximus EBU Kiosk Showcase
Owner : Vincent Dupont (SIT/NUC) - vincent.dupont@proximus.com
Contributors:
  - Henry Boutry (henry.boutry@proximus.com)

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

 Hardware:
 - Raspberry PI 3 as main Kiosk CPU
 - Arduino Mega MCU for sensors, physical UI
 - HDMI Screen with Multitouch
 - USB Keyboard , USB Trackball
 - Physical push buttons
 - USB Audio Speaker
 - Pi Cam v2

 Framework:
 - Resin.IO OS & Remote Management
 - Arduino sketch for MCU
 - Python & Kivy framework
