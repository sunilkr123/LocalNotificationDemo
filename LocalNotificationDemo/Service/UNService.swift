//
//  UNService.swift
//  LocalNotificationDemo
//
//  Created by MacHD on 23/09/19.
//  Copyright © 2019 MacHD. All rights reserved.
//

import Foundation
import UserNotifications

class UNService: NSObject {
    
    private override init() { }
    static  let  NotiShared  = UNService()
    
    let UNCenter = UNUserNotificationCenter.current()
    func Authorise(){
        let Option:UNAuthorizationOptions = [.alert, . sound, .badge]
        UNCenter.requestAuthorization(options: Option) { (Granted, error) in
        print(error ?? "No UN Auth Error")
            guard Granted else{
                print("User denied acces")
                return
            }
        self.Configure()
        }
    }
  
    func Configure(){
        UNCenter.delegate = self
    }
    
    func timeRequest(With interval:TimeInterval){
     let Content = UNMutableNotificationContent()
     Content.title = "Timer Finished"
     Content.body = "your timer is all Done. YAY!"
     Content.sound = .default
     Content.badge = 1
     let Triger = UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: false)
     let request = UNNotificationRequest(identifier: "userNotification.timer", content: Content, trigger: Triger)
     UNCenter.add(request)
    }
    
    func dateRequest(With dateComponet:DateComponents ){
        let Content = UNMutableNotificationContent()
        Content.title = "Date triger"
        Content.body = "it is now for future"
        Content.sound = .default
        Content.badge = 1
       let triger = UNCalendarNotificationTrigger(dateMatching: dateComponet, repeats: false)
       let request = UNNotificationRequest(identifier: "userNotification.date", content: Content, trigger: triger)
        UNCenter.add(request)
    }
    
    func LocationRequest(){
        let content = UNMutableNotificationContent()
        content.title = "You have returned"
        content.body = "Welcome back you silly coder you!"
        content.sound = .default
        content.badge = 1
        let request = UNNotificationRequest(identifier: "userNotification.location",
                                            content: content,
                                            trigger: nil)
        UNCenter.add(request)
    }
    
}

extension UNService:UNUserNotificationCenterDelegate{
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("UN did receive Notification")
        completionHandler()
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let Options:UNNotificationPresentationOptions = [.alert,.badge,.sound]
        completionHandler(Options)
        print("notification will present????")
    }
}
