# Proximus EBU Kiosk v1

Project : Proximus EBU Kiosk Showcase
Owner : Vincent Dupont (SIT/NUC) - vincent.dupont@proximus.com

Release: "Ring the Bell"

The EBU Kiosk is a Demo & IoT Media Totem which demonstrate Proximus services, technology solutions or simply have fun like the "Ring the Bell" app.

Original idea from Henry Boutry & Gaëtan Willems.
Design / Making by Vincent Dupont (Totem Sketch, Woodworking making, IoT & Physical interfaces).

The Project is currently under-development, with basic showcase features.  It will improve with additional apps.


Contributors:
  - Vincent Dupont (vincent.dupont@proximus.com) - Main contributor / coding
  - Henry Boutry (henry.boutry@proximus.com) - PoC Python WINCAM
  - Nicolas Rollier (nicolas.rollier@proximus.com) - UI/X Design

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


 Framework:
 - Resin.IO OS & Remote Management
 - Arduino sketch for MCU
 - NodeJs and ElectronJS
 - Node-Red
