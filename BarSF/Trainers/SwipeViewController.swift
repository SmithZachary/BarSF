//
//  SwipeViewController.swift
//  BarSF
//
//  Created by Zach Smith on 9/2/21.
//  Copyright © 2021 spaceMuleCode. All rights reserved.
//

import UIKit
// import EZSwipeController // if using Cocoapods
class MySwipeVC: EZSwipeController {
    
    private let ascrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    private let bscrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    private let cscrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    
    
    
    private let label: UILabel = {
        let text = UILabel()
        text.text = "Derek Hered Personal Training"
        text.numberOfLines = 1
        text.textColor = .white
        return text
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Derek_JPG-modified")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
 
        return imageView
    }()
    private let labela: UILabel = {
        let text = UILabel()
        text.text = """
        -ACE Certified Personal Trainer
        -USPA Certified Powerlifiting Coach
        -BS in Exercise Science
        -8 Years of Coaching/Personal Training
        ​
        -1 on 1 Personal training
        -Online coaching/personal training
        -Nutritional Coaching
        -Powerlifting competition preparation
        -General strength training programs
        -General health and fitness programs
        """
        text.numberOfLines = 12
        text.textColor = .white
        return text
    }()
    private let instaB: UIButton = {
    let button = UIButton()
        button.setImage(UIImage(named: "insta"), for: .normal)
        button.addTarget(self, action: #selector(didTapBinsta), for: .touchUpInside)
        return button
    }()
    private let instaM: UIButton = {
    let button = UIButton()
        button.setImage(UIImage(named: "insta"), for: .normal)
        button.addTarget(self, action: #selector(didTapMinsta), for: .touchUpInside)
        return button
    }()
    private let fbB: UIButton = {
    let button = UIButton()
        button.setImage(UIImage(named: "fb"), for: .normal)
        button.addTarget(self, action: #selector(didTapfbB), for: .touchUpInside)
        return button
    }()
    private let fbM: UIButton = {
    let button = UIButton()
        button.setImage(UIImage(named: "fb"), for: .normal)
        button.addTarget(self, action: #selector(didTapfbM), for: .touchUpInside)
        return button
    }()
    
    override func setupView() {
        
        datasource = self
//        navigationBarShouldBeOnBottom = true
//        navigationBarShouldNotExist = true
//        cancelStandardButtonEvents = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 231/255, green: 231/255, blue: 231/255, alpha: 1)
    }
    @objc func didTapBinsta(_ sender: UIButton) {
        let instagramHooks = "instagram://user?username=derek_gains"
        let instagramUrl = NSURL(string: instagramHooks)
        if UIApplication.shared.canOpenURL(instagramUrl! as URL) {
            UIApplication.shared.open(instagramUrl! as URL)
        } else {
          //redirect to safari because the user doesn't have Instagram
            UIApplication.shared.open(NSURL(string: "https://www.instagram.com/derek_gains/")! as URL)
        }
        
        
    }
    @objc func didTapMinsta(_ sender: UIButton) {
        let instagramHooks = "instagram://user?username=milburystrength"
        let instagramUrl = NSURL(string: instagramHooks)
        if UIApplication.shared.canOpenURL(instagramUrl! as URL) {
            UIApplication.shared.open(instagramUrl! as URL)
        } else {
          //redirect to safari because the user doesn't have Instagram
            UIApplication.shared.open(NSURL(string: "https://www.instagram.com/milburystrength/")! as URL)
        }
        
        
    }
    @objc func didTapfbB(_ sender: UIButton) {
        let instagramHooks = "facebook://user?username=Derek-Hered-Personal-Training-484032975112203"
        let instagramUrl = NSURL(string: instagramHooks)
        if UIApplication.shared.canOpenURL(instagramUrl! as URL) {
            UIApplication.shared.open(instagramUrl! as URL)
        } else {
          //redirect to safari because the user doesn't have Instagram
            UIApplication.shared.open(NSURL(string: "https://www.facebook.com/Derek-Hered-Personal-Training-484032975112203/")! as URL)
        }
        
    }
    @objc func didTapfbM(_ sender: UIButton) {
        let instagramHooks = "facebook://user?username=matt.milbury.9"
        let instagramUrl = NSURL(string: instagramHooks)
        if UIApplication.shared.canOpenURL(instagramUrl! as URL) {
            UIApplication.shared.open(instagramUrl! as URL)
        } else {
          //redirect to safari because the user doesn't have Instagram
            UIApplication.shared.open(NSURL(string: "https://www.facebook.com/matt.milbury.9/")! as URL)
        }
        
    }
}

extension MySwipeVC: EZSwipeControllerDataSource {
   
    
    
    
    
    func viewControllerData() -> [UIViewController] {
        
        
        
        let redVC = UIViewController()
        redVC.view.backgroundColor = UIColor.white
     let derek = UIImageView(x: 50, y: 100, imageName: "Derek_JPG-modified", scaleToWidth: 200)
        derek.layer.borderWidth = 5
        derek.layer.borderColor = UIColor.black.cgColor
        derek.layer.masksToBounds = true
        derek.layer.cornerRadius = 100
      
        let label = UILabel()
        label.text = "Derek Hered Personal Training"
        label.frame = CGRect(x: 30, y: derek.top - 40, width: 300, height: 20)
        let longLabel = UILabel()
        longLabel.numberOfLines = 12
        longLabel.text = """
            -ACE Certified Personal Trainer
            -USPA Certified Powerlifiting Coach
            -BS in Exercise Science
            -8 Years of Coaching/Personal Training
            ​
            -1 on 1 Personal training
            -Online coaching/personal training
            -Nutritional Coaching
            -Powerlifting competition preparation
            -General strength training programs
            -General health and fitness programs
            """
        longLabel.frame = CGRect(x: 30, y: derek.bottom, width: 400, height: 300)
        instaB.frame = CGRect(x: derek.right, y: derek.top, width: 90, height: 90)
        fbB.frame = CGRect(x: derek.right, y: instaB.bottom + 30, width: 90, height: 90)
        redVC.view.addSubview(derek)
        redVC.view.addSubview(label)
        redVC.view.addSubview(longLabel)
        redVC.view.addSubview(instaB)
        redVC.view.addSubview(fbB)
       
        
      
      
    
        
        let blueVC = UIViewController()
        blueVC.view.backgroundColor = UIColor.white
     let matt = UIImageView(x: 50, y: 100, imageName: "matt_PNG-modified", scaleToWidth: 200)
        matt.layer.borderWidth = 5
        matt.layer.borderColor = UIColor.black.cgColor
        matt.layer.masksToBounds = true
        matt.layer.cornerRadius = 100
      
        let mlabel = UILabel()
        mlabel.text = "Matt Milbury Personal Training"
        mlabel.frame = CGRect(x: 30, y: matt.top - 40, width: 300, height: 20)
        let mlongLabel = UILabel()
        mlongLabel.numberOfLines = 12
        mlongLabel.text = """
            -ACE Certified Personal Trainer
            -USPA Certified Powerlifting Coach
            -BS in Exercise Science
            -5+ Years of Coaching/Personal Training
            ​
            -Online personal programming available upon request
            -One on one in person training available-- focusing on physique/bodybuilding goals & strength training.
            ​
            """
        mlongLabel.frame = CGRect(x: 30, y: matt.bottom, width: 400, height: 300)
        instaM.frame = CGRect(x: matt.right, y: matt.top, width: 90, height: 90)
        fbM.frame = CGRect(x: matt.right, y: instaM.bottom + 30, width: 90, height: 90)
        blueVC.view.addSubview(matt)
        blueVC.view.addSubview(mlabel)
        blueVC.view.addSubview(mlongLabel)
        blueVC.view.addSubview(instaM)
        blueVC.view.addSubview(fbM)

        let greenVC = UIViewController()
        greenVC.view.backgroundColor = UIColor.green
        let bulb = UIImageView(x: 50, y: 125, imageName: "bulb", scaleToWidth: 300)
        greenVC.view.addSubview(bulb)

        return [redVC, blueVC, greenVC]
    }
    
    func navigationBarDataForPageIndex(_ index: Int) -> UINavigationBar {
        var title = ""
        if index == 0 {
            title = "The Bar Personal Trainers"
        } else if index == 1 {
            title = "The Bar Personal Trainers"
        } else if index == 2 {
            title = "The Bar Personal Trainers"
        }
        navigationController?.isToolbarHidden = true
        let navigationBar = UINavigationBar()
        navigationBar.barStyle = UIBarStyle.default
        navigationBar.barTintColor = UIColor(red: 231/255, green: 231/255, blue: 231/255, alpha: 1)
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let navigationItem = UINavigationItem(title: title)
        navigationItem.hidesBackButton = true
        
        if index == 0 {
            var sImage = UIImage(named: "swipe")
            sImage = scaleTo(image: sImage!, w: 22, h: 22)
            let rightButtonItem = UIBarButtonItem(image: sImage, style: .plain, target: self, action: nil)
            rightButtonItem.tintColor = UIColor.white
            let widtha = UIScreen.main.bounds.size.width
            let heighta = UIScreen.main.bounds.size.height
            
            let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: widtha, height: heighta))
            imageViewBackground.image = UIImage(named: "swipe")!
            imageViewBackground.alpha = 0.3
            
            imageViewBackground.contentMode = UIView.ContentMode.scaleToFill
            navigationItem.leftBarButtonItem = nil
            navigationItem.rightBarButtonItem = rightButtonItem
        } else if index == 1 {
            var cImage = UIImage(named: "swipe")!
            cImage = scaleTo(image: cImage, w: 22, h: 22)
            let leftButtonItem = UIBarButtonItem(image: cImage, style: .plain, target: self, action: nil)
            leftButtonItem.tintColor = UIColor.white
            
            var bImage = UIImage(named: "swipe")!
            bImage = scaleTo(image: bImage, w: 22, h: 22)
            let rightButtonItem = UIBarButtonItem(image: bImage, style: .plain, target: self, action: nil)
            rightButtonItem.tintColor = UIColor.white
            
            navigationItem.leftBarButtonItem = leftButtonItem
            navigationItem.rightBarButtonItem = rightButtonItem
        } else if index == 2 {
            var sImage = UIImage(named: "bardogpower")!
            sImage = scaleTo(image: sImage, w: 22, h: 22)
            let leftButtonItem = UIBarButtonItem(image: sImage, style: .plain, target: self, action: nil)
            leftButtonItem.tintColor = UIColor.white
            
            navigationItem.leftBarButtonItem = leftButtonItem
            navigationItem.rightBarButtonItem = nil
        }
        navigationBar.pushItem(navigationItem, animated: false)
        return navigationBar
    }
    
    func changedToPageIndex(_ index: Int) {
        print("Page has changed to: \(index)")
    }
    
    @objc func moveToEnd() {
        self.moveToPage(2, animated: true)
    }
    
    func alert(title: String?, message: String, action: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: action, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

private func scaleTo(image: UIImage, w: CGFloat, h: CGFloat) -> UIImage {
    let newSize = CGSize(width: w, height: h)
    UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
    image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
    let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return newImage
}


private extension UIImageView {
    
    /// EZSwiftExtensions
    convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, imageName: String) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h))
        image = UIImage(named: imageName)
    }
    
    /// EZSwiftExtensions
    convenience init(x: CGFloat, y: CGFloat, imageName: String, scaleToWidth: CGFloat) {
        self.init(frame: CGRect(x: x, y: y, width: 0, height: 0))
        image = UIImage(named: imageName)
        scaleImageFrameToWidth(width: scaleToWidth)
    }
    
    /// EZSwiftExtensions
    convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, image: UIImage) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h))
        self.image = image
    }
    
    /// EZSwiftExtensions
    convenience init(x: CGFloat, y: CGFloat, image: UIImage, scaleToWidth: CGFloat) {
        self.init(frame: CGRect(x: x, y: y, width: 0, height: 0))
        self.image = image
        scaleImageFrameToWidth(width: scaleToWidth)
    }
    
    /// EZSwiftExtensions, scales this ImageView size to fit the given width
    func scaleImageFrameToWidth(width: CGFloat) {
        let widthRatio = image!.size.width / width
        let newWidth = image!.size.width / widthRatio
        let newHeigth = image!.size.height / widthRatio
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: newWidth, height: newHeigth)
    }
    
}
