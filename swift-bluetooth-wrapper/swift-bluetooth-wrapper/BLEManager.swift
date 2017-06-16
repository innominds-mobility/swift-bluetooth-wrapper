//
//  BLEManager.swift
//  swift-bluetooth-wrapper
//
//  Created by Raghu on 05/06/17.
//  Copyright © 2017 Innominds Software Pvt Ltd. All rights reserved.
//

import UIKit
import CoreBluetooth

/// Manager that connects and maintains connections
class BLEManager: NSObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    public enum ConnectionStatus: Int {
        
        case initial
        
        case scanning
        
        case connecting
        
        case connectionFailed
        
        case connected
        
        case disconnecting
        
        case disconnected
        
        case bluetoothTurnedOff
        
        case other
    }
    
    private var centralManager: CBCentralManager!
    
    private var servicesArray: [CBUUID] = []
    
    private var scanOption: [String : Any]?
    
    var autoScan: Bool = false
    weak var delegate: BLEManagerDelegate?
    var connectionStatus: ConnectionStatus = .initial
    
    static let sharedInstance = BLEManager()
    
    private override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func scanForPeripherals(with services: [String]?, and allowDuplicateDevices: Bool) {
        if centralManager.state != CBManagerState.poweredOn {
            print("bluetooth is not on and it is in state ", centralManager.state.rawValue)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1), execute: {
                self.delegate?.failedToStartScanForPeripherals!()
            })
            return
        } else {
            self.startScanning(with: services, and: allowDuplicateDevices)
        }
        
    }
    
    private func startScanning(with services: [String]?, and allowDuplicateDevices: Bool) {
        servicesArray = [] // Empty before using
        
        if services != nil {
            for serviceString in services! {
                servicesArray.append(CBUUID(string: serviceString))
            }
        }
        
        connectionStatus = .scanning
        
        scanOption = [CBCentralManagerScanOptionAllowDuplicatesKey: allowDuplicateDevices]
        
        centralManager.scanForPeripherals(withServices: servicesArray, options: scanOption)
        
        print("scanning started")
    }
    
    func scanForPeripherals(with services: [String]?, allowDuplicateDevices: Bool, andScanTill time: Int) {
        
        if centralManager.state != CBManagerState.poweredOn {
            
            print("bluetooth is not on and it is in state ", centralManager.state.rawValue)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1), execute: {
                self.delegate?.failedToStartScanForPeripherals!()
            })
            return
            
        } else {
            self.startScanning(with: services, and: allowDuplicateDevices)
            Timer.scheduledTimer(withTimeInterval: TimeInterval(time), repeats: false, block: { (timer) in
                
                print("scanning time out")
                timer.invalidate()
                self.stopScanning()
            })
        }
    }
    
    func stopScanning() {
        print("stopping the scan")
        centralManager.stopScan()
        
        connectionStatus = .initial
        servicesArray = []
        scanOption = nil
    }
    
    func restartScanning() {
        centralManager.stopScan()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)) {
            print("restarting scan")
            self.centralManager.scanForPeripherals(withServices: self.servicesArray, options: self.scanOption)
        }
    }
    
    func connectTo(peripheral: CBPeripheral) {
        let options: NSDictionary = [CBConnectPeripheralOptionNotifyOnDisconnectionKey: true]
        
        connectionStatus = .connecting
        
        centralManager.connect(peripheral, options: options as? [String : Any])
    }
    
    func disconnect(periheral: CBPeripheral) {
        print("disconnecting peripheral")
        
        connectionStatus = .disconnecting
        
        centralManager.cancelPeripheralConnection(periheral)
    }
    
// MARK: CBCentralManagerDelegate methods
    
    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if centralManager.state == CBManagerState.poweredOn {
            if connectionStatus !=  .initial {
                print("bluetooth turned on")
                connectionStatus = .initial
                if autoScan {
                    self.restartScanning()
                }
            }
        } else if centralManager.state == CBManagerState.poweredOff {
            print("bluetooth turned off")
            connectionStatus = .bluetoothTurnedOff
        } else {
            print("other bluetooth state found ", centralManager.state)
            connectionStatus = .other
        }
        
        delegate?.bluetoothStateChanged!(centralManager.state)
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("found peripheral", advertisementData as Any)
        //print("found peripheral")
        delegate?.foundPeripheral(peripheral)
    }
    
    public func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("connected to peripheral")
        connectionStatus = .connected
        
        delegate?.connectedToPeripheral(peripheral)
    }
    
    public func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        print("peripheral disconnected")
        connectionStatus = .disconnected
        
        delegate?.disconnectedPeripheral(peripheral)
    }
    
    public func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print("failed to connect to the peripheral")
        connectionStatus = .connectionFailed
        
        delegate?.failedToConnectPeripheral(peripheral)
    }
    
    public func centralManager(_ central: CBCentralManager, willRestoreState dict: [String : Any]) {
        print("central state restored", dict)
    }
    
}

@objc public protocol BLEManagerDelegate: class {
    
    func foundPeripheral(_ peripheral: CBPeripheral)
    
    func connectedToPeripheral(_ peripheral: CBPeripheral)
    
    func disconnectedPeripheral(_ peripheral: CBPeripheral)
    
    func failedToConnectPeripheral(_ peripheral: CBPeripheral)
    
    @objc optional func bluetoothStateChanged(_ state: CBManagerState)
    
    @objc optional func failedToStartScanForPeripherals()
}
