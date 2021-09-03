//
//  Colors.swift
//  BarSF
//
//  Created by Zach Smith on 9/2/21.
//  Copyright © 2021 spaceMuleCode. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    
func addRedGradient() {
    // screen width and height:
    let widtha = UIScreen.main.bounds.size.width
    let heighta = UIScreen.main.bounds.size.height
    

    let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: widtha, height: heighta))
    imageViewBackground.image = UIImage(named: "whitered")!
    imageViewBackground.alpha = 0.8
    
    // you can change the content mode:
    imageViewBackground.contentMode = UIView.ContentMode.scaleToFill

    self.addSubview(imageViewBackground)
    self.sendSubviewToBack(imageViewBackground)
}
    func addGreenGradient() {
        // screen width and height:
        let widtha = UIScreen.main.bounds.size.width
        let heighta = UIScreen.main.bounds.size.height
        

        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: widtha, height: heighta))
        imageViewBackground.image = UIImage(named: "green")!
        imageViewBackground.alpha = 0.8
        
        // you can change the content mode:
        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill

        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
    }
    
    func addRedCircGradient() {
        // screen width and height:
        let widtha = UIScreen.main.bounds.size.width
        let heighta = UIScreen.main.bounds.size.height
        

        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: widtha, height: heighta))
        imageViewBackground.image = UIImage(named: "gradient-2")!
        imageViewBackground.alpha = 0.8
        
        
        // you can change the content mode:
        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill

        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
    }
    func addBlueGradient() {
        // screen width and height:
        let widtha = UIScreen.main.bounds.size.width
        let heighta = UIScreen.main.bounds.size.height
        

        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: widtha, height: heighta))
        imageViewBackground.image = UIImage(named: "blue")!
        imageViewBackground.alpha = 0.8
        
        
        // you can change the content mode:
        imageViewBackground.contentMode = UIView.ContentMode.scaleToFill

        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
    }
    func addGoldGradient() {
        // screen width and height:
        let widtha = UIScreen.main.bounds.size.width
        let heighta = UIScreen.main.bounds.size.height
        

        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: widtha, height: heighta))
        imageViewBackground.image = UIImage(named: "blackb")!
        imageViewBackground.alpha = 1
        
        
        // you can change the content mode:
        imageViewBackground.contentMode = UIView.ContentMode.scaleToFill

        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
    }
    
    
}


//hex #2a7832 green
//

