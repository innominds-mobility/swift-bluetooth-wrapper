//
//  ViewController.swift
//  swift-bluetooth-wrapper
//
//  Created by Raghu on 05/06/17.
//  Copyright © 2017 TimexUSA. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, BLEManagerDelegate {
    var bleMangerObj: BLEManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bleMangerObj =  BLEManager.sharedInstance
        bleMangerObj.delegate = self
        
        //self.bleMangerObj.scanForPeripherals(with: nil, and:false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)) {
            self.bleMangerObj.autoScan = true
            self.bleMangerObj.scanForPeripherals(with: ["876B199D-3504-46B2-A3EA-FD8A805B6A40"], and: true)
        }
        
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)) {
//            self.bleMangerObj.scanForPeripherals(with: nil, allowDuplicateDevices: false, andScanTill: 15)
//        }
        
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(15)) {
//            self.bleMangerObj.restartScanning()
//        }
    }
    
    // MARK: BLEManagerDelegate methods
    
    func foundPeripheral(_ peripheral: CBPeripheral) {
        print("==> foundPeripheral")
    }
    
    func connectedToPeripheral(_ peripheral: CBPeripheral) {
        print("==> connectedToPeripheral")
    }
    
    func disconnectedPeripheral(_ peripheral: CBPeripheral) {
        print("==> disconnectedPeripheral")
    }
    
    func failedToConnectPeripheral(_ peripheral: CBPeripheral) {
        print("==> disconnectedPeripheral")
    }
    
    func bluetoothStateChanged(_ state: CBManagerState) {
        print("==> bluetoothStateChanged", state.rawValue)
    }
    
    func failedToStartScanForPeripherals() {
        print("==> failedToStartScanForPeripherals")
        //self.bleMangerObj.scanForPeripherals(with: nil, and:false)
    }
}
