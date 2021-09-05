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
     
        
        return text

    }()
    
    private let qtextField: UILabel = {
       let text = UILabel()
    
        
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
                let vcOne = self.storyboard?.instantiateViewController(identifier: "redVC") as! UIViewController
                self.present(vcOne, animated: true, completion:nil)
            }
        )
      
        present(alert, animated: true)
        
        
        
        
        
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]

        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.backgroundColor : UIColor.red]

        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.strokeWidth : 8.0]
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.strikethroughStyle :  8 ]
        
        
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

