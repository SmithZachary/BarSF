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
    
    
    
    private let wTextField: UILabel = {
       let text = UILabel()
        text.textAlignment = .center
        text.textColor = .red
      
        text.font = UIFont.boldSystemFont(ofSize: 30)
        text.numberOfLines = 20
        text.lineBreakMode = .byWordWrapping
       
        text.sizeToFit()
        text.clipsToBounds = true
        text.text = "Let's Get Started"
        text.layer.masksToBounds = true
        text.tintColor = .white
       
//        text.layer.borderColor = UIColor.black.cgColor
//        text.backgroundColor = .white
        text.layer.cornerRadius = 12
        text.layer.shadowColor = UIColor.black.cgColor
       text.layer.shadowOffset = CGSize(width: 0.0,height: 1.0)
        text.layer.masksToBounds = true
        text.layer.shadowOpacity = 1.0
        text.alpha = 0.9
        
        return text

    }()
    
    private let qtextField: UILabel = {
       let text = UILabel()
        text.textAlignment = .center
        text.textColor = .black
      
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.numberOfLines = 20
        text.lineBreakMode = .byWordWrapping
       
        text.sizeToFit()
        text.clipsToBounds = true
        text.text = " We are excited you are here!\n\n As a part of our move we are introducing QR Stregnth.\n\n It's a great tool for begginers and experts alike.\n To get started click on the QR Icon below and find a QR code to scan."
        text.layer.masksToBounds = true
        text.tintColor = .white
        text.layer.borderWidth = 2
//        text.layer.borderColor = UIColor.black.cgColor
//        text.backgroundColor = .white
        text.layer.cornerRadius = 12
        text.layer.shadowColor = UIColor.black.cgColor
       text.layer.shadowOffset = CGSize(width: 0.0,height: 1.0)
        text.layer.masksToBounds = true
        text.layer.shadowOpacity = 1.0
        text.alpha = 0.9
        
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
        title = "THE BAR"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapProfile))
        navigationItem.rightBarButtonItem?.tintColor = .red
        view.addSubview(scrollView)
       
        scrollView.addSubview(wTextField)
        scrollView.addSubview(qtextField)
        
       
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
            .init(title: "Trainers", style: .default) { _ in
                let vc = MySwipeVC()
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
        )
       
        present(alert, animated: true)
        
        
        
        
        
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]

        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.backgroundColor : UIColor.red]

        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.strokeWidth : 2.0]
        
        let size = scrollView.width/3
        wTextField.frame = CGRect(x: 25,
                                 y: 50,
                                 width: 400,
                                 height: 80)
       
        qtextField.frame = CGRect(x: 75,
                                 y: wTextField.bottom+10,
                                 width: 250,
                                 height: 400)//
    }
    }

