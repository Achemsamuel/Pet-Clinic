//
//  ImageView.swift
//  Pet-Clinic
//
//  Created by Achem Samuel on 6/26/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//

import UIKit

class ImageViewSetUp {
    
    func customImageView (imageView : UIImageView) {
        let cornerRadius : CGFloat = 70.0
        imageView.layer.cornerRadius = cornerRadius
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor(red: 0.15, green: 0.06, blue: 0.98, alpha: 1).cgColor
    }
}
