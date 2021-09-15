//
//  ForgotPassViewController.swift
//  BarSF
//
//  Created by Zach Smith on 9/2/21.
//  Copyright © 2021 spaceMuleCode. All rights reserved.
//

import UIKit
import Firebase

class ForgotPassViewController: UIViewController {
    
    
   

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()

    
    private let label : UILabel = {
      let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.text = "Forgot Password?"
        label.textAlignment = .center
        label.layer.shadowColor = UIColor.white.cgColor
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 2.0
        label.layer.shadowOpacity = 1.0
        label.layer.masksToBounds = false
        return label
    }()
    
    private let button : UIButton = {
      let  button = UIButton()
        button.setTitle("Retrive Password", for: .normal)
        button.setTitle("Sent", for: .highlighted)
        button.backgroundColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor.white.cgColor
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.showsTouchWhenHighlighted = true
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 2.0,height: 2.0)
        button.layer.masksToBounds = false
        button.layer.shadowOpacity = 1.0
        button.addTarget(self, action: #selector(recoverClicked), for: .touchUpInside)
        return button
    }()
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 0
        field.layer.borderColor = UIColor.black.cgColor
        field.placeholder = "Email Address..."
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .secondarySystemBackground
        field.layer.shadowColor = UIColor.white.cgColor
        field.layer.shadowOffset = CGSize(width: 2.0,height: 2.0)
        field.layer.masksToBounds = false
        field.layer.shadowOpacity = 1.0
        return field
    }()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        view.addBackground()
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        scrollView.addSubview(label)
        scrollView.addSubview(emailField)
        scrollView.addSubview(button)

        // Do any additional setup after loading the view.
    }
    @objc func recoverClicked(_ sender: Any){
        emailField.isHighlighted = true
        print("----66----------")
        let auth = Auth.auth()
        auth.sendPasswordReset(withEmail: emailField.text!) { (error) in
            if let error = error {
                let alert =  UIAlertController(title: "Error",
                                               message: error.localizedDescription,
                preferredStyle: .alert)
alert.addAction(UIAlertAction(title:"Dismiss",
                style: .cancel, handler: nil))
                self.present(alert, animated: true)
                return
            }
            let alert = UIAlertController(title: "Hurray",
                                          message: "A password reset email has been sent to the email provided!",
           preferredStyle: .alert)
alert.addAction(UIAlertAction(title:"Dismiss",
           style: .cancel, handler: nil))
           self.present(alert, animated: true)
           return
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
       
        scrollView.frame = view.bounds

       
        label.frame = CGRect(x: 0,
                             
                                 y: 200,
                                 width: scrollView.width,
                                 height: 70)
       
        emailField.frame = CGRect(x: 30,
                                  y: label.bottom + 10,
                                  width: scrollView.width-60,
                                  height: 52)
        button.frame = CGRect(x:  30,
                                     y: emailField.bottom+10,
                                     width: scrollView.width-60,
                                     height: 52)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
