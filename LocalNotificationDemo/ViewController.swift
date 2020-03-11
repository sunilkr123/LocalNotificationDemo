//
//  ViewController.swift
//  LocalNotificationDemo
//
//  Created by MacHD on 21/09/19.
//  Copyright © 2019 MacHD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       UNService.NotiShared.Authorise()
       CoreLocService.CoreLocShared.Authorization()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didEnteredRegion),
                                               name: NSNotification.Name("internalNotification.enteredRegion"),
                                               object: nil)
    }

    @IBAction func onDateTapped(_ sender:UIButton){
        AlertService.actionSheet(in: self, title: "Some Future time ") {
            print("Date function tapped")
            var dateComponent = DateComponents()
            dateComponent.second = 0
            UNService.NotiShared.dateRequest(With: dateComponent)
        }
    }
    
    
    @IBAction func onTimerTapped(_ sender: UIButton ){
        AlertService.actionSheet(in: self, title: "5 Sec") {
            UNService.NotiShared.timeRequest(With: 5)
        }
   
    }
    
    @IBAction func onLocationTapped(_ sender: UIButton){
        AlertService.actionSheet(in: self, title: "When i return back") {
            CoreLocService.CoreLocShared.UpdatingLocation()
        }
    }
    
    @objc func didEnteredRegion(){
        UNService.NotiShared.LocationRequest()
    }
    
    

}

