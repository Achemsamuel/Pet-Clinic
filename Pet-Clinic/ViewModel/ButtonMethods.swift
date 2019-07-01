//
//  ButtonMethods.swift
//  Pet-Clinic
//
//  Created by Achem Samuel on 6/25/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//

import UIKit

class ButtonMethods {
    
    public func setUpButton (button : UIButton) {
        
        let cornerRadius : CGFloat = 15.0
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor(red: 0.25, green: 0.96, blue: 0.28, alpha: 1).cgColor
        button.layer.cornerRadius = cornerRadius
    }
}
