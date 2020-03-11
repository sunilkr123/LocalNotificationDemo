//
//  AlertService.swift
//  LocalNotificationDemo
//
//  Created by MacHD on 23/09/19.
//  Copyright © 2019 MacHD. All rights reserved.
//

import UIKit
class AlertService{
    
    static func actionSheet(in vc: UIViewController,title:String,completion:  @escaping () -> Void){
       let Alert = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        let action = UIAlertAction(title: title, style: UIAlertAction.Style.default) { (UIAlertAction) in
            completion()
        }
        Alert.addAction(action)
        vc.present(Alert, animated: true, completion: nil)
        }
}
