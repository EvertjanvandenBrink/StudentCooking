# ThePushSubscriber  - 2019 edition

With our app the user can  subscribe on hackernews items. 
The user will be able to view items, filter items and he can also subscribe on categorys. 
the user will receive a push notification when he is subscribed on a specific category and there is a new relevant
item posted in that category. 

Possible expansions
If there is time left we will try to create a sublayer which will parse the received api items so that it is possible to use different api's.
So the user will be able to subscribe on for example houses. 

## Table of Contents

* **[1. Prerequisites](#Prerequisites)**

* **[2. Quick start](#Quick_start)** 

  - [2.1 Install XCode](#XCode)
  - [2.2 Install Swift](#Swift)
  - [2.3 How to clone](#HowToClone)
  - [2.4 How to run in XCode](#RunXCode)

* **[3. Release history](#Release_History)**

* **[4. Requirements](#Requirements)**

## 1. Prerequisites <a name="Prerequisites"/>

This application is written in Swift. 

macOS, Ubuntu Linux LTS, and the latest Ubuntu Linux release are the current
supported host development operating systems.
    
## 2. Quick Start <a name="Quick_start"/>

### 2.1 Install XCode <a name="XCode"/>

To build for macOS, you need [Xcode 10.2 beta](https://developer.apple.com/xcode/downloads/).

### 2.2 Install Swift <a name="Swift"/>

You need to [install Swift](https://swift.org/getting-started/#installing-swift)

### 2.3 How to clone <a name="HowToClone"/>

1. Clone the repo and go to that directory

```
$ git clone https://github.com/HANICA-MAD/dia-app2-2019-evertjan-joas.git
``` 

### 2.4 How to run in XCode <a name="RunXCode"/>

Unlock your device and connect it to your computer.

Open the project (.xcworkspace file) in XCode and click on the	Run button or click on Product > Build to compile the project. 
The project will not buidl when you open the .xcodeproj file because the used cocoapods don't work then. So pay attention that you open the correct file!

After	building the project, you will generate an executable. You can run this executable through a	unix	shell or 
through	Xcode. To	setup	Xcode	to run the project go to Product > Scheme >	Edit Scheme.	
Select Run from	the	left panel,	select Info from top and click on	the	drop down	list next to Executable.
Click	Other	and	select the executable that was generated when you compiled your	project. Click Ok.
Now	you	can	run	your project again by clicking the Run button or through Product > Run.

## 3. Release History <a name="Release_History"/>

- 0.1.0
  - Filled the empty readMe file
  - 12 March 2019

## 4. Requirements <a name="Requirements"/>

- [ ] The user can subscribe on categorys 
- [ ] The user can view all current hn items
- [ ] The user can refresh by pulling down
- [ ] The user can view a list of subscriptions
- [ ] The user can remove subscriptions
- [ ] The user retrieves notificationsbased on new subscribed items
- [ ] The user can give permision to use the accelerometor to shake the device and get an subscribed recommendation
- [ ] The user can use the app omn different types of api's.
- [ ] The user can search items
- [ ] The user can filter items

API's:
- Hackernews api

Frameworks:
- CoreMotion 
- pods (alamofire & sweiftyjson)

Screen layout
