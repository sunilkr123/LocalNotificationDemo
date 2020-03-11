//
//  ShadowView.swift
//  LocalNotificationDemo
//
//  Created by MacHD on 21/09/19.
//  Copyright © 2019 MacHD. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
   //     layer.shadowPath = CGPath(ellipseIn: layer.bounds, transform: nil)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 5
        layer.cornerRadius = 5
    }

}
