# Monitoring Remote Patient EKG Readings with MQTT 

Instructions for this exercise are available on [GettingStartedHealth.InterSystems.com](https://gettingstartedhealth.intersystems.com/).

In this exercise, you will use the interoperability tools built into InterSystems IRIS for Health™ to construct a basic user portal that monitors live EKG readings from a set of remote patients. See how you can use a minimal amount of code to quickly take real-time data coming from an MQTT broker, then save and display it on a dashboard.


If you would like to skip the exercise and view the completed application on your instance, navigate to Interoperability > List > Productions in the Management Portal, select Solution.MQTT, and click Open.

In the Production Configuration window, click Start.

Step 1: Installation

[InterSystems IRIS for Health Sandbox](https://www.intersystems.com/try-intersystems-iris-for-free/)

1.	Change the directory: `cd /home/project/shared`
2.	Type `git clone https://github.com/intersystems/Samples-MQTT-EKG-Devices`
3.	Open the web terminal by navigating to InterSystems > Web Terminal and enter the login credentials provided with your sandbox.
4.	At the next three command prompts, type:
    *	`set $Namespace = "INTEROP"`
    *	`do $system.OBJ.Load("/home/project/shared/Samples-MQTT-EKG-Devices/Installer.cls","ck")`
    *	`do ##class(App.Installer).InitializeLearningLab()`
5.	Store the topic string outputted from this process for later use.
6.	Click the Management Portal link in your sandbox.
7.	Change namespace to INTEROP

Docker
1.	Type `git clone https://github.com/intersystems/Samples-MQTT-EKG-Devices`
2.	Change the directory: `cd Samples-MQTT-EKG-Devices`
3.	In the command line, type `docker-compose up -d`
4.	Once complete, type `docker-compose exec iris iris session iris -U %SYS "##class(App.Installer).InitializeDocker()"`
5.	Store the topic string outputted from this process for later use.
6.	Throughout the exercise, use the following connection settings:
•	Username: SuperUser
•	Password: SYS
•	Host: localhost
•	Port: 52773
•	Management Portal URL: http://localhost:52773/csp/sys/UtilHome.csp


