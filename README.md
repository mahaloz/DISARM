# Drone Identification Signal And Retargeting Mimicker
Drone Identification Signal And Retargeting Mimicker (DISARM), a small software package for interacting with SiK radios to disarm rouge drones. 

## About 
DISARM is based on the concept of mimicking ID codes in the Mavlink communication protocol to take arbitrary control on nearby drone. 
This project was a direct product of the SES494: Autonomous Exploration Systems class, from which [Jnaneshwar Das](http://robotics.usc.edu/~jnaneshd/pmwiki.php) mentored the process of this project.  
Also big thanks to Harish Anand. 

## Requirements
To use this software package you will need to purchase a [SiK Radio](https://docs.px4.io/en/telemetry/sik_radio.html), which can be purchased at multiple locations online.
On the software side you will need [Docker](https://docs.docker.com/v17.12/install/) and a `Unix` based system like `MacOs` or `Linux`. Though this project is dockerized, it requires access to the `/dev/` directory so DISARM can automatically interact with your SiK radio. 

## Installation
Once you have `Docker` downloaded, you may need to use `sudo`, use this command to pull the image:
```bash
docker pull mahaloz/DISARM
```

## Useage 
Run this to launch the DISARM system:
```bash
docker run -it --rm -v /dev/:/dev/ mahaloz/DISARM
```
Now plug the SiK radio into any available usb port.
Finnaly run this to start disarming any system in the area:
```bash
./start_disarming
``` 

## Todo
* Add a modify Firmware section 
* Look into MavLink2 Signing 

