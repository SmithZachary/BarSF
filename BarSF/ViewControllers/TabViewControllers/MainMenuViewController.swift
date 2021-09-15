//
//  MainMenuViewController.swift
//  BarSF
//
//  Created by Zach Smith on 9/2/21.
//  Copyright © 2021 spaceMuleCode. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class MainMenuViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = false
       
        scrollView.isScrollEnabled = true
        scrollView.alwaysBounceVertical = true
        scrollView.contentSize = CGSize(width: 200, height: 200)
        
        return scrollView
    }()
    private let bigView: UIStackView = {
        let view = UIStackView()
        view.layer.cornerRadius = 20
                view.backgroundColor = .white
                view.layer.borderColor = UIColor.black.cgColor
                view.layer.borderWidth = 3
        view.alpha = 0.5
      
     
      
        return view
    }()
    private let mondayView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
//        view.backgroundColor = .white
//        view.layer.borderColor = UIColor.lightGray.cgColor
//        view.layer.borderWidth = 3
      
        return view
    }()
    private let tuesdayView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
//        view.backgroundColor = .white
//        view.layer.borderColor = UIColor.red.cgColor
//        view.layer.borderWidth = 3
      
        return view
    }()
    private let wednesdayView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        view.clipsToBounds = true
//        view.backgroundColor = .white
//        view.layer.borderColor = UIColor.lightGray.cgColor
//        view.layer.borderWidth = 3
      
        return view
    }()
    private let thursdayView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
//        view.backgroundColor = .white
//        view.layer.borderColor = UIColor.lightGray.cgColor
//        view.layer.borderWidth = 3
      
        return view
    }()
    private let fridayView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
//        view.backgroundColor = .white
//        view.layer.borderColor = UIColor.lightGray.cgColor
//        view.layer.borderWidth = 3
      
        return view
    }()
    private let saturdayView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
//        view.backgroundColor = .white
//        view.layer.borderColor = UIColor.lightGray.cgColor
//        view.layer.borderWidth = 3
      
        return view
    }()
    private let sundayView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
//        view.backgroundColor = .white
//        view.layer.borderColor = UIColor.lightGray.cgColor
//        view.layer.borderWidth = 3
      
        return view
    }()
    
//    let lbl = UILabel(frame: CGRect(x: 10, y: 50, width: 230, height: 21))
//    lbl.textAlignment = .center //For center alignment
//    lbl.text = "This is my label fdsjhfg sjdg dfgdfgdfjgdjfhg jdfjgdfgdf end..."
//    lbl.textColor = .white
//    lbl.backgroundColor = .lightGray//If required
//    lbl.font = UIFont.systemFont(ofSize: 17)
//
//    //To display multiple lines in label
//    lbl.numberOfLines = 0 //If you want to display only 2 lines replace 0(Zero) with 2.
//    lbl.lineBreakMode = .byWordWrapping //Word Wrap
//    // OR
//    lbl.lineBreakMode = .byCharWrapping //Charactor Wrap
//
//    lbl.sizeToFit()//If required
//    yourView.addSubview(lbl)
    
    
    private let staffTextField: UILabel = {
       let text = UILabel()
        text.text = "Staffed Hours"
        
        return text
    }()
    private let accessTextField: UILabel = {
       let text = UILabel()
        text.text = "24 Hour Memeber Access"
        text.textColor = .red
        text.shadowColor = .black
        text.shadowOffset = CGSize(width: 0, height: 1)
        return text
    }()
    private let mondayTextField: UILabel = {
       let text = UILabel()
        text.text = "Monday"
        
        
        return text

    }()
    private let tuesdayTextField: UILabel = {
       let text = UILabel()
        text.text = "Tuesday"
        return text

    }()
    private let wednesdayTextField: UILabel = {
       let text = UILabel()
        text.text =
            "Wednesay"
        
 
        
        return text

    }()
    private let thursdayTextField: UILabel = {
       let text = UILabel()
        text.text = "Thursday"
     
        
        return text

    }()
    private let fridayTextField: UILabel = {
       let text = UILabel()
        text.text = "Friday"
        
        
        return text

    }()
    private let saturdayTextField: UILabel = {
       let text = UILabel()
        text.text = "Saturday"
       
        
        return text

    }()
    private let sundayTextField: UILabel = {
       let text = UILabel()
        text.text = "Sunday"
   
        
        return text

    }()
    
    private let hoursevenTextField: UILabel = {
       let text = UILabel()
        text.text = "Closed"
    
        
        return text

    }()
    private let hoursixTextField: UILabel = {
       let text = UILabel()
        text.text = "7am - 3pm"
  
        
        return text

    }()
    private let houroneTextField: UILabel = {
       let text = UILabel()
        text.text = "11am-7pm"
        text.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5))
     
        
        return text

    }()
    private let hourtwoTextField: UILabel = {
       let text = UILabel()
        text.text = "11am-7pm"
     
        
        return text

    }()
    private let hourthreeTextField: UILabel = {
       let text = UILabel()
        text.text = "11am-7pm"
     
       
        
        
        return text

    }()
    private let hourfourTextField: UILabel = {
       let text = UILabel()
        text.text = "11am-7pm"
         
  
        
        return text

    }()
    private let hourfiveTextField: UILabel = {
       let text = UILabel()
        text.text = "11am-7pm"
    
        
        return text

    }()
  
    
    func validateAuth() {
        if FirebaseAuth.Auth.auth().currentUser == nil {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBackground()
        view.backgroundColor = .systemBackground
        navigationItem.largeTitleDisplayMode = .always
    
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = true
        title = "Welcome"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapProfile))
        navigationItem.rightBarButtonItem?.tintColor = .red
        view.addSubview(scrollView)
        scrollView.addSubview(bigView)
        scrollView.addSubview(staffTextField)
        scrollView.addSubview(accessTextField)
        bigView.addSubview(mondayView)
        bigView.addSubview(tuesdayView)
        bigView.addSubview(wednesdayView)
        bigView.addSubview(thursdayView)
        bigView.addSubview(fridayView)
        bigView.addSubview(saturdayView)
        bigView.addSubview(sundayView)
        
        mondayView.addSubview(mondayTextField)
        mondayView.addSubview(houroneTextField)
        
        tuesdayView.addSubview(tuesdayTextField)
        tuesdayView.addSubview(hourtwoTextField)
        wednesdayView.addSubview(wednesdayTextField)
        wednesdayView.addSubview(hourthreeTextField)
        thursdayView.addSubview(thursdayTextField)
        thursdayView.addSubview(hourfourTextField)
        fridayView.addSubview(fridayTextField)
        fridayView.addSubview(hourfiveTextField)
        saturdayView.addSubview(saturdayTextField)
        saturdayView.addSubview(hoursixTextField)
        sundayView.addSubview(sundayTextField)
        sundayView.addSubview(hoursevenTextField)
        
        
        bigView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        validateAuth()
        
        view.backgroundColor = .systemGray6
  
 
        
    }
    
    @objc private func didTapProfile() {
        let alert = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet
        )
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
            action in
            
                 // Called when user taps outside
        }))

        alert.addAction(
            .init(title: "Profile", style: .default) { _ in
                let vcOne = self.storyboard?.instantiateViewController(identifier: "ProfileViewController") as! UIViewController
                self.present(vcOne, animated: true, completion:nil)
                
            }
        )

      
        alert.addAction(
            .init(title: "Personal Trainers", style: .default) { _ in
                let vcOne = self.storyboard?.instantiateViewController(identifier: "redVC") as! UIViewController
                self.present(vcOne, animated: true, completion:nil)
            }
        )
      
        present(alert, animated: true)
        
        alert.addAction(
            .init(title: "Shop(Coming Soon)", style: .default) { _ in
              
            }
        )
        alert.addAction(
            .init(title: "Member Services(Coming Soon)", style: .default) { _ in
              
            }
        )
        
        
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]

        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.backgroundColor : UIColor.red]

        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.strokeWidth : 8.0]
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.strikethroughStyle :  8 ]
        let size = scrollView.width/3
        let sizeTwo = bigView.width/3
        scrollView.autoresizesSubviews = true
        bigView.frame = CGRect (x: (scrollView.width-size)/2 - 60 , y: scrollView.height/10, width: size + 120, height: 290)
       
        
       
//        textLabel.center = scrollView.center
//        textLabel.frame = CGRect(x:(scrollView.width-size)/2 - 60 ,
//                                 y: scrollView.height/10,
//                                 width: size + 120,
//                                 height: 104)
        
        
        
        mondayView.frame = CGRect (x: 3 ,
                                   y: 0,
                                   width: bigView.width ,
                                   height: 40)
        tuesdayView.frame = CGRect (x: 03 ,
                                    y: mondayView.bottom,
                                    width: bigView.width ,
                                    height: 40)
        wednesdayView.frame = CGRect (x: 03 ,
                                      y: tuesdayView.bottom,
                                      width: size + 120 ,
                                      height: 40)
        thursdayView.frame = CGRect (x: 03 ,
                                     y: wednesdayView.bottom,
                                     width: bigView.width ,
                                     height: 40)
        fridayView.frame = CGRect (x: 03 ,
                                   y: thursdayView.bottom,
                                   width: bigView.width ,
                                   height: 40)
        saturdayView.frame = CGRect (x: 03 ,
                                     y: fridayView.bottom,
                                     width: bigView.width ,
                                     height: 40)
        sundayView.frame = CGRect (x: 03 ,
                                   y: saturdayView.bottom,
                                   width: bigView.width ,
                                   height: 40)
        
        staffTextField.frame = CGRect (x: (scrollView.width-size)/2 ,
                                       y: bigView.top - 50,
                                       width: size ,
                                       height: 52)
        accessTextField.frame = CGRect (x: (scrollView.width-size)/2 - 40,
                                        y: bigView.bottom,
                                        width: size + 80,
                                        height: 40)
     
        mondayTextField.frame = CGRect(x:15,
                                       y: mondayView.top,
                                 width: 100,
                                 height: 52)
        houroneTextField.frame = CGRect(x: mondayTextField.right,
                                        y: mondayView.top,
                                 width: 200,
                                 height: 52)
        tuesdayTextField.frame = CGRect(x: 15,
                                       y: 0,
                                 width: 100,
                                 height: 52)
        hourtwoTextField.frame = CGRect(x: tuesdayTextField.right,
                                        y: 0,
                                 width: 200,
                                 height: 52)
        wednesdayTextField.frame = CGRect(x: 15,
                                       y: 0,
                                 width: 100,
                                 height: 52)
        hourthreeTextField.frame = CGRect(x: wednesdayTextField.right,
                                        y: 0,
                                 width: 200,
                                 height: 52)
        thursdayTextField.frame = CGRect(x: 15,
                                       y: 0,
                                 width: 100,
                                 height: 52)
        hourfourTextField.frame = CGRect(x: thursdayTextField.right,
                                        y: 0,
                                 width: 200,
                                 height: 52)
        fridayTextField.frame = CGRect(x: 15,
                                       y: 0,
                                 width: 100,
                                 height: 52)
        hourfiveTextField.frame = CGRect(x: fridayTextField.right,
                                        y: 0,
                                 width: 200,
                                 height: 52)
        saturdayTextField.frame = CGRect(x: 15,
                                       y: 0,
                                 width: 100,
                                 height: 52)
        hoursixTextField.frame = CGRect(x: saturdayTextField.right,
                                        y: 0,
                                 width: 200,
                                 height: 52)
        sundayTextField.frame = CGRect(x: 15,
                                       y: 0,
                                 width: 100,
                                 height: 52)
        hoursevenTextField.frame = CGRect(x: sundayTextField.right,
                                        y: 0,
                                 width: 200,
                                 height: 52)
      
    }
    }

