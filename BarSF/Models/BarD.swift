//
//  BarD.swift
//  BarSF
//
//  Created by Zach Smith on 9/2/21.
//  Copyright © 2021 spaceMuleCode. All rights reserved.
//

import UIKit

extension UIView {
func addBackground() {
    // screen width and height:
    let widtha = UIScreen.main.bounds.size.width
    let heighta = UIScreen.main.bounds.size.height
    

    let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: widtha, height: heighta))
    imageViewBackground.image = UIImage(named: "bardogpower")!
    imageViewBackground.alpha = 0.3
    
    // you can change the content mode:
    imageViewBackground.contentMode = UIView.ContentMode.scaleToFill

    self.addSubview(imageViewBackground)
    self.sendSubviewToBack(imageViewBackground)
}}

