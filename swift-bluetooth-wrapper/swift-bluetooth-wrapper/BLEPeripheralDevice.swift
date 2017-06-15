//
//  BLEPeripheralDevice.swift
//  swift-bluetooth-wrapper
//
//  Created by Raghu on 07/06/17.
//  Copyright © 2017 TimexUSA. All rights reserved.
//

import UIKit
import CoreBluetooth

class BLEPeripheralDevice: NSObject, CBPeripheralDelegate {
    
    var cbPeripheral: CBPeripheral!
    
    /*!
     *  @method peripheralDidUpdateName:
     *
     *  @param peripheral	The peripheral providing this update.
     *
     *  @discussion			This method is invoked when the @link name @/link of <i>peripheral</i> changes.
     */
    @available(iOS 6.0, *)
    public func peripheralDidUpdateName(_ peripheral: CBPeripheral) {
        
    }
    
    /*!
     *  @method peripheral:didModifyServices:
     *
     *  @param peripheral			The peripheral providing this update.
     *  @param invalidatedServices	The services that have been invalidated
     *
     *  @discussion			This method is invoked when the @link services @/link of <i>peripheral</i> have been changed.
     *						At this point, the designated <code>CBService</code> objects have been invalidated.
     *						Services can be re-discovered via @link discoverServices: @/link.
     */
    @available(iOS 7.0, *)
     public func peripheral(_ peripheral: CBPeripheral, didModifyServices invalidatedServices: [CBService]) {
        
    }
    
    /*!
     *  @method peripheralDidUpdateRSSI:error:
     *
     *  @param peripheral	The peripheral providing this update.
     *	@param error		If an error occurred, the cause of the failure.
     *
     *  @discussion			This method returns the result of a @link readRSSI: @/link call.
     *
     *  @deprecated			Use {@link peripheral:didReadRSSI:error:} instead.
     */
    @available(iOS, introduced: 5.0, deprecated: 8.0)
     public func peripheralDidUpdateRSSI(_ peripheral: CBPeripheral, error: Error?) {
        
    }
    
    /*!
     *  @method peripheral:didReadRSSI:error:
     *
     *  @param peripheral	The peripheral providing this update.
     *  @param RSSI			The current RSSI of the link.
     *  @param error		If an error occurred, the cause of the failure.
     *
     *  @discussion			This method returns the result of a @link readRSSI: @/link call.
     */
    @available(iOS 8.0, *)
     public func peripheral(_ peripheral: CBPeripheral, didReadRSSI RSSI: NSNumber, error: Error?) {
        
    }
    
    /*!
     *  @method peripheral:didDiscoverServices:
     *
     *  @param peripheral	The peripheral providing this information.
     *	@param error		If an error occurred, the cause of the failure.
     *
     *  @discussion			This method returns the result of a @link discoverServices: @/link call. If the service(s) were read successfully, they can be retrieved via
     *						<i>peripheral</i>'s @link services @/link property.
     *
     */
    @available(iOS 5.0, *)
     public func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        
    }
    
    /*!
     *  @method peripheral:didDiscoverIncludedServicesForService:error:
     *
     *  @param peripheral	The peripheral providing this information.
     *  @param service		The <code>CBService</code> object containing the included services.
     *	@param error		If an error occurred, the cause of the failure.
     *
     *  @discussion			This method returns the result of a @link discoverIncludedServices:forService: @/link call. If the included service(s) were read successfully,
     *						they can be retrieved via <i>service</i>'s <code>includedServices</code> property.
     */
    @available(iOS 5.0, *)
    public func peripheral(_ peripheral: CBPeripheral, didDiscoverIncludedServicesFor service: CBService, error: Error?) {
        
    }
    
    /*!
     *  @method peripheral:didDiscoverCharacteristicsForService:error:
     *
     *  @param peripheral	The peripheral providing this information.
     *  @param service		The <code>CBService</code> object containing the characteristic(s).
     *	@param error		If an error occurred, the cause of the failure.
     *
     *  @discussion			This method returns the result of a @link discoverCharacteristics:forService: @/link call. If the characteristic(s) were read successfully,
     *						they can be retrieved via <i>service</i>'s <code>characteristics</code> property.
     */
    @available(iOS 5.0, *)
    public func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        
    }
    
    /*!
     *  @method peripheral:didUpdateValueForCharacteristic:error:
     *
     *  @param peripheral		The peripheral providing this information.
     *  @param characteristic	A <code>CBCharacteristic</code> object.
     *	@param error			If an error occurred, the cause of the failure.
     *
     *  @discussion				This method is invoked after a @link readValueForCharacteristic: @/link call, or upon receipt of a notification/indication.
     */
    @available(iOS 5.0, *)
    public func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        
    }
    
    /*!
     *  @method peripheral:didWriteValueForCharacteristic:error:
     *
     *  @param peripheral		The peripheral providing this information.
     *  @param characteristic	A <code>CBCharacteristic</code> object.
     *	@param error			If an error occurred, the cause of the failure.
     *
     *  @discussion				This method returns the result of a {@link writeValue:forCharacteristic:type:} call, when the <code>CBCharacteristicWriteWithResponse</code> type is used.
     */
    @available(iOS 5.0, *)
    public func peripheral(_ peripheral: CBPeripheral, didWriteValueFor characteristic: CBCharacteristic, error: Error?) {
        
    }
    
    /*!
     *  @method peripheral:didUpdateNotificationStateForCharacteristic:error:
     *
     *  @param peripheral		The peripheral providing this information.
     *  @param characteristic	A <code>CBCharacteristic</code> object.
     *	@param error			If an error occurred, the cause of the failure.
     *
     *  @discussion				This method returns the result of a @link setNotifyValue:forCharacteristic: @/link call.
     */
    @available(iOS 5.0, *)
    public func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?) {
        
    }
    
    /*!
     *  @method peripheral:didDiscoverDescriptorsForCharacteristic:error:
     *
     *  @param peripheral		The peripheral providing this information.
     *  @param characteristic	A <code>CBCharacteristic</code> object.
     *	@param error			If an error occurred, the cause of the failure.
     *
     *  @discussion				This method returns the result of a @link discoverDescriptorsForCharacteristic: @/link call. If the descriptors were read successfully,
     *							they can be retrieved via <i>characteristic</i>'s <code>descriptors</code> property.
     */
    @available(iOS 5.0, *)
    public func peripheral(_ peripheral: CBPeripheral, didDiscoverDescriptorsFor characteristic: CBCharacteristic, error: Error?) {
        
    }
    
    /*!
     *  @method peripheral:didUpdateValueForDescriptor:error:
     *
     *  @param peripheral		The peripheral providing this information.
     *  @param descriptor		A <code>CBDescriptor</code> object.
     *	@param error			If an error occurred, the cause of the failure.
     *
     *  @discussion				This method returns the result of a @link readValueForDescriptor: @/link call.
     */
    @available(iOS 5.0, *)
    public func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor descriptor: CBDescriptor, error: Error?) {
        
    }
    
    /*!
     *  @method peripheral:didWriteValueForDescriptor:error:
     *
     *  @param peripheral		The peripheral providing this information.
     *  @param descriptor		A <code>CBDescriptor</code> object.
     *	@param error			If an error occurred, the cause of the failure.
     *
     *  @discussion				This method returns the result of a @link writeValue:forDescriptor: @/link call.
     */
    @available(iOS 5.0, *)
    public func peripheral(_ peripheral: CBPeripheral, didWriteValueFor descriptor: CBDescriptor, error: Error?) {
        
    }

}
