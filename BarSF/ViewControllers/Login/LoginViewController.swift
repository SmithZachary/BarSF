//
//  LoginViewController.swift
//  BarSF
//
//  Created by Zach Smith on 9/2/21.
//  Copyright © 2021 spaceMuleCode. All rights reserved.
//

import UIKit
import FirebaseAuth
import FBSDKLoginKit
import GoogleSignIn
import JGProgressHUD
import AuthenticationServices
import CryptoKit
import FirebaseOAuthUI


final class LoginViewController: UIViewController, FUIAuthDelegate{
    

    private let spinner = JGProgressHUD(style: .dark)

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bardogbw")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
 
        return imageView
    }()
    private let textField: UILabel = {
        let text = UILabel()
        text.shadowColor = UIColor.lightGray
        text.shadowOffset = CGSize(width: 0.0,height: 1.0)
        text.isUserInteractionEnabled = true
        text.adjustsFontSizeToFitWidth = true
        
        
        let boldText = " Register Here."
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.red.cgColor] as [NSAttributedString.Key : Any]
       
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
        
        
        let normalText = "Don't Have An Account?"
        let oneString = NSMutableAttributedString(string:normalText)
        let normalString = NSMutableAttributedString(string:normalText)
        normalString.append(attributedString)
        attributedString.append(normalString)
        text.attributedText = normalString
        return text
    }()
    private let lostField: UILabel = {
        let text = UILabel()
        text.shadowColor = UIColor.lightGray
        text.shadowOffset = CGSize(width: 0.0,height: 1.0)
        text.textColor = .black
        text.isUserInteractionEnabled = true
        let boldText = " Click Here."
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.red.cgColor] as [NSAttributedString.Key : Any]
       
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
        
        
        let normalText = "Forgot Your Password?"
        let oneString = NSMutableAttributedString(string:normalText)
        let normalString = NSMutableAttributedString(string:normalText)
        normalString.append(attributedString)
        attributedString.append(normalString)
        text.attributedText = normalString
        return text
    }()
  

    private let emailField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.white.cgColor
        field.placeholder = "Email Address..."
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .secondarySystemBackground
        field.layer.shadowColor = UIColor.black.cgColor
        field.layer.shadowOffset = CGSize(width: 2.0,height: 2.0)
        field.layer.masksToBounds = false
        field.layer.shadowOpacity = 1.0
        return field
    }()

    private let passwordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.white.cgColor
        field.placeholder = "Password..."
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .secondarySystemBackground
        field.isSecureTextEntry = true
        field.layer.shadowColor = UIColor.black.cgColor
        field.layer.shadowOffset = CGSize(width: 2.0,height: 2.0)
        field.layer.masksToBounds = false
        field.layer.shadowOpacity = 1.0
        return field
    }()

    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
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
        return button
    }()
    
    
    

    private let facebookLoginButton: FBLoginButton = {
        let button = FBLoginButton()
        button.permissions = ["public_profile", "email"]
//        let buttonText = NSAttributedString(string: "FB")
//        button.setAttributedTitle(buttonText, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12
        
        return button
    }()
    
    private let appleLoginButton: ASAuthorizationAppleIDButton = {
     
        let appleLoginButton = ASAuthorizationAppleIDButton()
        appleLoginButton.addTarget(self, action: #selector(appleSignInButtonTapped), for: .touchUpInside)
        appleLoginButton.cornerRadius = 12
        
        return appleLoginButton
        
    }()

    private let googleLogInButton: GIDSignInButton = {
        let button = GIDSignInButton()
        button.colorScheme = .dark
        button.style = .standard
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        
        return button
    }()
    

    private var loginObserver: NSObjectProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSignInButton()
        view.addBackground()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = ""
      
      
        navigationController?.navigationBar.layer.masksToBounds = true
      
        
//        @IBAction func appleSignInButtonTapped(_sender: Any) {
//            if let authUI = FUIAuth.defaultAuthUI() {
//                authUI.providers = [FUIOAuth.appleAuthProvider()]
//                authUI.delegate = self
//
//                let authViewController = authUI.authViewController()
//                self.present(authViewController, animated: true)
//            }
//        }
        loginObserver = NotificationCenter.default.addObserver(forName: .didLogInNotification, object: nil, queue: .main, using: { [weak self] _ in
            guard let strongSelf = self else {
                return
            }

            strongSelf.navigationController?.dismiss(animated: true, completion: nil)
        })

        
        view.backgroundColor = .systemBackground
//        let barButton = UIButton.init(type: .custom)
//        barButton.setTitle(" Register ", for: .normal)
//
//        barButton.setTitleColor(.black, for: .normal)
//        barButton.setTitleColor(.red, for: .highlighted)
//        barButton.layer.borderWidth = 1
//        barButton.layer.cornerRadius = 5
//        barButton.backgroundColor = .white
//        barButton.layer.borderColor = UIColor.black.cgColor
//        barButton.isHighlighted = false
//        barButton.layer.shadowColor = UIColor.red.cgColor
//       barButton.layer.shadowOffset = CGSize(width: 0.0,height: 1.0)
//        barButton.layer.masksToBounds = false
//        barButton.layer.shadowOpacity = 1.0
//        barButton.showsTouchWhenHighlighted = true
//
//           self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: barButton)
//        barButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)

        loginButton.addTarget(
            self,
            action: #selector(loginButtonTapped),
            for: .touchUpInside
        )

        emailField.delegate = self
        passwordField.delegate = self

        facebookLoginButton.delegate = self

        // Add subviews
        view.addSubview(scrollView)
//        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(loginButton)
        scrollView.addSubview(textField)
        scrollView.addSubview(lostField)
//        scrollView.addSubview(facebookLoginButton)
//        scrollView.addSubview(googleLogInButton)
//        scrollView.addSubview(appleLoginButton)
//        appleLoginButton.addTarget(self, action: #selector(appleSignInButtonTapped), for: .touchUpInside)
        
   
        
        googleLogInButton.addTarget(self, action: #selector(googleSignInButtonTapped), for: .touchUpInside)
        
        let guestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelClicked(_:)))
        textField.addGestureRecognizer(guestureRecognizer)
        
        let lostRecognizer = UITapGestureRecognizer(target: self, action: #selector(lostClicked(_:)))
        lostField.addGestureRecognizer(lostRecognizer)
      
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
       
        scrollView.frame = view.bounds

        let size = scrollView.width/3
        imageView.frame = CGRect(x: (scrollView.width-size)/2,
                                 y: 200,
                                 width: size,
                                 height: size)
        imageView.layer.cornerRadius = imageView.width/2
        emailField.frame = CGRect(x: 30,
                                  y: scrollView.height/3
                                  ,
                                  width: scrollView.width-60,
                                  height: 52)
        passwordField.frame = CGRect(x: 30,
                                     y: emailField.bottom+10,
                                     width: scrollView.width-60,
                                     height: 52)
        loginButton.frame = CGRect(x: 30,
                                   y: passwordField.bottom+10,
                                   width: scrollView.width-60,
                                   height: 52)
        textField.frame = CGRect(x:(scrollView.center.x)/4,
                                   y: loginButton.bottom+2,
                                   width: scrollView.width-60,
                                   height: 52)


        facebookLoginButton.frame = CGRect(x: (scrollView.center.x)/4,
                                   y: loginButton.bottom+10,
                                   width: 100,
                                   height: 52)

        googleLogInButton.frame = CGRect(x: facebookLoginButton.right,
                                   y: loginButton.bottom+10,
                                   width: 70,
                                   height: 52)
        appleLoginButton.frame = CGRect(x: googleLogInButton.right,
                                   y: loginButton.bottom+10,
                                   width: 100,
                                   height: 52)
        lostField.frame = CGRect(x: (scrollView.center.x)/4,
                                 y: scrollView.bottom - 90,
                                 width: scrollView.width-60,
                                 height: 52)
        
    }

    @objc func lostClicked(_ sender: Any){
        textField.isHighlighted = true
        print("----66----------")
        let vc = ForgotPassViewController()
      
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func labelClicked(_ sender: Any){
        textField.isHighlighted = true
        print("--------------")
        let vc = RegisterViewController()
      
        navigationController?.pushViewController(vc, animated: true)
    }
    func setupSignInButton() {
//        let button = ASAuthorizationAppleIDButton()
//        button.addTarget(self, action: #selector (handleSignInWithAppleTapped), for: .touchUpInside)
//        button.center = view.center
//        view.addSubview(button)
       
           }
    @objc func handleSignInWithAppleTapped() {
        performSignIn()
    }
    
    func performSignIn(){
        
        let request = createAppleIDRequest()
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    
    fileprivate var currentNonce: String?

    @available(iOS 13, *)
    func startSignInWithAppleFlow() {
      let nonce = randomNonceString()
      currentNonce = nonce
      let appleIDProvider = ASAuthorizationAppleIDProvider()
      let request = appleIDProvider.createRequest()
      request.requestedScopes = [.fullName, .email]
      request.nonce = sha256(nonce)

      let authorizationController = ASAuthorizationController(authorizationRequests: [request])
      authorizationController.delegate = self
      authorizationController.presentationContextProvider = self
      authorizationController.performRequests()
    }

    @available(iOS 13, *)
    private func sha256(_ input: String) -> String {
      let inputData = Data(input.utf8)
      let hashedData = SHA256.hash(data: inputData)
      let hashString = hashedData.compactMap {
        return String(format: "%02x", $0)
      }.joined()

      return hashString
    }
    
    func createAppleIDRequest() -> ASAuthorizationAppleIDRequest {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        let nonce = randomNonceString()
        request.nonce = sha256(nonce)
        currentNonce = nonce
        return request
    }
   

    deinit {
        if let observer = loginObserver {
            NotificationCenter.default.removeObserver(observer)
        }
    }

  

    @objc private func appleSignInButtonTapped() {
        performSignIn()
    }
  
    // Adapted from https://auth0.com/docs/api-auth/tutorials/nonce#generate-a-cryptographically-random-nonce
    private func randomNonceString(length: Int = 32) -> String {
      precondition(length > 0)
      let charset: Array<Character> =
          Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
      var result = ""
      var remainingLength = length

      while remainingLength > 0 {
        let randoms: [UInt8] = (0 ..< 16).map { _ in
          var random: UInt8 = 0
          let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
          if errorCode != errSecSuccess {
            fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
          }
          return random
        }

        randoms.forEach { random in
          if remainingLength == 0 {
            return
          }

          if random < charset.count {
            result.append(charset[Int(random)])
            remainingLength -= 1
          }
        }
      }

      return result
    }
    @objc private func googleSignInButtonTapped() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
              let signInConfig = appDelegate.signInConfig else {
            return
        }
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            guard let user = user, error == nil else { return }
            appDelegate.handleSessionRestore(user: user)
        }
    }

    @objc private func loginButtonTapped() {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()

        guard let email = emailField.text, let password = passwordField.text,
            !email.isEmpty, !password.isEmpty, password.count >= 6 else {
                alertUserLoginError()
                return
        }

        spinner.show(in: view)

        // Firebase Log In
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] authResult, error in
            guard let strongSelf = self else {
                return
            }

            DispatchQueue.main.async {
                strongSelf.spinner.dismiss()
            }

            guard let result = authResult, error == nil else {
                print("Failed to log in user with email: \(email)")
                let alert = UIAlertController(title: "Woops",
                                              message: error?.localizedDescription,
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title:"Dismiss",
                                              style: .cancel, handler: nil))
                self?.present(alert, animated: true)
                return
            }

            let user = result.user

            let safeEmail = DatabaseManager.safeEmail(emailAddress: email)
            DatabaseManager.shared.getDataFor(path: safeEmail, completion: { result in
                switch result {
                case .success(let data):
                    guard let userData = data as? [String: Any],
                        let firstName = userData["first_name"] as? String,
                        let lastName = userData["last_name"] as? String else {
                            return
                    }
                    UserDefaults.standard.set("\(firstName) \(lastName)", forKey: "name")

                case .failure(let error):
                    print("Failed to read data with error \(error)")
                }
            })

            UserDefaults.standard.set(email, forKey: "email")

            print("Logged In User: \(user)")
            strongSelf.navigationController?.dismiss(animated: true, completion: nil)
        })
    }

    func alertUserLoginError() {
        let alert = UIAlertController(title: "Woops",
                                      message: "Please enter all information to log in.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"Dismiss",
                                      style: .cancel, handler: nil))
        present(alert, animated: true)
    }

    @objc private func didTapRegister() {
        let vc = RegisterViewController()
      
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension LoginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == emailField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            loginButtonTapped()
        }

        return true
    }

}

extension LoginViewController: LoginButtonDelegate {
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        // no operation
    }

    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        guard let token = result?.token?.tokenString else {
            print("User failed to log in with facebook")
            return
        }

        let facebookRequest = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                                         parameters: ["fields":
                                                            "email, first_name, last_name, picture.type(large)"],
                                                         tokenString: token,
                                                         version: nil,
                                                         httpMethod: .get)

        facebookRequest.start(completion: { _, result, error in
            guard let result = result as? [String: Any],
                error == nil else {
                    print("Failed to make facebook graph request")
                    return
            }

            print(result)

            guard let firstName = result["first_name"] as? String,
                let lastName = result["last_name"] as? String,
                let email = result["email"] as? String,
                let picture = result["picture"] as? [String: Any],
                let data = picture["data"] as? [String: Any],
                let pictureUrl = data["url"] as? String else {
                    print("Faield to get email and name from fb result")
                    return
            }

            UserDefaults.standard.set(email, forKey: "email")
            UserDefaults.standard.set("\(firstName) \(lastName)", forKey: "name")

            DatabaseManager.shared.userExists(with: email, completion: { exists in
                if !exists {
                    let chatUser = ChatAppUser(firstName: firstName,
                                               lastName: lastName,
                                               emailAddress: email)
                    DatabaseManager.shared.insertUser(with: chatUser, completion: { success in
                        if success {

                            guard let url = URL(string: pictureUrl) else {
                                return
                            }

                            print("Downloading data from facebook image")

                            URLSession.shared.dataTask(with: url, completionHandler: { data, _,_ in
                                guard let data = data else {
                                    print("Failed to get data from facebook")
                                    return
                                }

                                print("got data from FB, uploading...")

                                // upload iamge
                                let filename = chatUser.profilePictureFileName
                                StorageManager.shared.uploadProfilePicture(with: data, fileName: filename, completion: { result in
                                    switch result {
                                    case .success(let downloadUrl):
                                        UserDefaults.standard.set(downloadUrl, forKey: "profile_picture_url")
                                        print(downloadUrl)
                                    case .failure(let error):
                                        print("Storage maanger error: \(error)")
                                    }
                                })
                            }).resume()
                        }
                    })
                }
            })

            let credential = FacebookAuthProvider.credential(withAccessToken: token)
            FirebaseAuth.Auth.auth().signIn(with: credential, completion: { [weak self] authResult, error in
                guard let strongSelf = self else {
                    return
                }

                guard authResult != nil, error == nil else {
                    if let error = error {
                        let alert = UIAlertController(title: "Woops",
                                                      message: error.localizedDescription,
                                                      preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title:"Dismiss",
                                                      style: .cancel, handler: nil))
                        self?.present(alert, animated: true)
                        print("Facebook credential login failed, MFA may be needed - \(error)")
                    }
                    return
                }

                print("Successfully logged user in_______")
                strongSelf.navigationController?.dismiss(animated: true, completion: nil)
            })
        })
    }
}
extension LoginViewController: ASAuthorizationControllerDelegate {

  func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
    if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
      guard let nonce = currentNonce else {
        fatalError("Invalid state: A login callback was received, but no login request was sent.")
      }
      guard let appleIDToken = appleIDCredential.identityToken else {
        print("Unable to fetch identity token")
        return
      }
      guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
        print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
        return
      }
      // Initialize a Firebase credential.
      let credential = OAuthProvider.credential(withProviderID: "apple.com",
                                                idToken: idTokenString,
                                                rawNonce: nonce)
      // Sign in with Firebase.
      Auth.auth().signIn(with: credential) { [weak self](authResult, error) in
        guard let strongSelf = self else {
            print("----------------")
          // Error. If error.code == .MissingOrInvalidNonce, make sure
          // you're sending the SHA256-hashed nonce as a hex string with
          // your request to Apple.
            print(error?.localizedDescription as Any)
          return
        }
        strongSelf.navigationController?.dismiss(animated: true, completion: nil)        // User is signed in to Firebase with Apple.
        // ...
      }
    }
  }

  func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    // Handle error.
    print("Sign in with Apple errored: \(error)")
    
    let alert = UIAlertController(title: "Woops",
                                  message: "Looks like you have previously signed in with Google or Facebook. Please re-sign in with one of them.",
                                  preferredStyle: .alert)
    alert.addAction(UIAlertAction(title:"Dismiss",
                                  style: .cancel, handler: nil))
    self.present(alert, animated: true)
    
  }
    

}
    

extension LoginViewController: ASAuthorizationControllerPresentationContextProviding{
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}
