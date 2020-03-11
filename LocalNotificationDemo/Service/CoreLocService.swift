//
//  CoreLocService.swift
//  LocalNotificationDemo
//
//  Created by MacHD on 23/09/19.
//  Copyright © 2019 MacHD. All rights reserved.
//

import Foundation
import CoreLocation
class CoreLocService:NSObject {
   private override init(){}
   static let CoreLocShared = CoreLocService()
    let LocationManager = CLLocationManager()
    var ShouldsetRegion = true
    
    
    func Authorization(){
    LocationManager.requestAlwaysAuthorization()
    LocationManager.desiredAccuracy = kCLLocationAccuracyBest
     LocationManager.delegate = self
    }
    
    func UpdatingLocation(){
        ShouldsetRegion = true
        LocationManager.startUpdatingHeading()
    }
    
}
extension CoreLocService:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("got location")
        guard let currentLocation = locations.first, ShouldsetRegion else { return }
        ShouldsetRegion = false
        let region = CLCircularRegion(center: currentLocation.coordinate, radius: 20, identifier: "startPosition")
        manager.startMonitoring(for: region)
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("DID ENTER REGION VIA CL")
        NotificationCenter.default.post(name: NSNotification.Name("internalNotification.enteredRegion"),
                                        object: nil)
    }
}

