//
//  buttonback.swift
//  BarSF
//
//  Created by Zach Smith on 9/3/21.
//  Copyright © 2021 spaceMuleCode. All rights reserved.
//

//
//  BarD.swift
//  BarSF
//
//  Created by Zach Smith on 9/2/21.
//  Copyright © 2021 spaceMuleCode. All rights reserved.
//

import UIKit

extension UIView {
    func addsack(pic: String) -> String {
    // screen width and height:
    let widtha = 125
    
    let heighta = 125
    
    

    let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: widtha, height: heighta))
    imageViewBackground.image = UIImage(named: pic)!
        imageViewBackground.alpha = 1.0
        imageViewBackground.layer.cornerRadius = 12
        imageViewBackground.layer.masksToBounds = true
    
    // you can change the content mode:
    imageViewBackground.contentMode = UIView.ContentMode.scaleToFill

    self.addSubview(imageViewBackground)
    self.sendSubviewToBack(imageViewBackground)
        return pic
}}
extension UIView {
    func addImage(pic: String) -> String {
    // screen width and height:
    let widtha = 125
    
    let heighta = 125
    
    
      
        let imageViewBackground = UIImageView()
        imageViewBackground.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    imageViewBackground.image = UIImage(named: pic)!
        imageViewBackground.alpha = 1.0
        imageViewBackground.layer.cornerRadius = 12
        imageViewBackground.layer.masksToBounds = true
    
    // you can change the content mode:
    imageViewBackground.contentMode = UIView.ContentMode.scaleToFill

    self.addSubview(imageViewBackground)
    self.sendSubviewToBack(imageViewBackground)
        return pic
}}

