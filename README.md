# Swift BLE Manager

### Requirements
The framework is designed to communicate with BLE devices within the iOS application. Developer should be able to do the connectivity with single or multiple devices at the same time. 
The callbacks need to be put up based on the blocks / callbacks that are got from the objects.
Should be able to identify/scan in repititive mode.

### Manager
* Should be able to scan and connect
* Should be abe to notify state changes for the bluetooth
* Should be singleton

#### Scanning
* Should support scanning with open service characteristics
* Should support scanning for a particular time
* Should support continuous scanning with state change . State change should be able send out new list of devices discovered
* Should support scanning for a particular device with ID

#### Connecting
* Should be able to connect to device with an ID
* Should be able to auto connect with a certain device ID. This will enable auto connecting to the device even when its disconnected and discovered again
* Should be able to connect to all the devices with a particular Service
* Should be able to give callback/delegate methods when the state changes for a particular device

#### Peripheral Device
This class enables/ serves as a proxy to the external ble device. This class should
* List down services and characteristics
* Should be able to send data in `string`, `data` , `Number` formats over a characteristic
* Should be able to notify the user about the change in characteristic
* Should be able to notify the user about change in `name` and other properties of the device
* Should be ready to be stored as an object in the `Userdefaults` (Follow `NSCoding`)
* Should be able to give a callback/Notification when service is available

#### Service
* Should have reference to the `Peripheral` device
* Should have list of characteristics
* Should be able to send notification when any characteristic changes
* Should be able to give a callback/notification when any of the characteristics are available

#### Characteristic
* Should be able to notify on `discovery` , `onRead`, `onWrite`
* Should be able to notify when value changes
* Should be able to write data in `String`,`data`,`number` formats

The overall framework needs to have

*  Less number of files to integrate
*  Low footprint
*  Documentation is a must with `jazzy` documents
*  Swift 3 compliant
*  `Pods` , `Carthage` ready
*  Code should be linted properly