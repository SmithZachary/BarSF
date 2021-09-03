//
//  AppDelegate.swift
//  BarSF
//
//  Created by Zach Smith on 9/2/21.
//

import UIKit
import Firebase
import FBSDKCoreKit
import GoogleSignIn
import FirebaseCore
import FirebaseDynamicLinks

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let customURLScheme = "dlscheme"
    
    public var signInConfig: GIDConfiguration?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        
        FirebaseOptions.defaultOptions()?.deepLinkURLScheme = "projectbar.page.link"
            
            FirebaseApp.configure()
        ApplicationDelegate.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )
      

        GIDSignIn.sharedInstance.restorePreviousSignIn { [weak self] user, error in
            if let user = user, error == nil {
                self?.handleSessionRestore(user: user)
            }
        }

        if let clientId = FirebaseApp.app()?.options.clientID {
            signInConfig = GIDConfiguration.init(clientID: clientId)
        }

        return true
        
    }
  func application(_ application: UIApplication, continue userActivity: NSUserActivity,
    restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
let handled = DynamicLinks.dynamicLinks()
.handleUniversalLink(userActivity.webpageURL!) { dynamiclink, error in

}

return handled
}
    
    
    
    
        func handleIncomingDynamicLink(_ dynamicLink: DynamicLink) {
        guard let url = dynamicLink.url else {
            print ("Thats weird, no url with my link")
            return
        }
    }
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
        if let incomingURL =  userActivity.webpageURL {
            print("incoming URL is \(incomingURL)")
                let linkHandled = DynamicLinks.dynamicLinks().handleUniversalLink(incomingURL)
                { (dynamicLink, error) in
                    guard error == nil else {
                        print("found error \(error!.localizedDescription)")
                        return
                    }
                    if let dynamicLink = dynamicLink {
                        self.handleIncomingDynamicLink(dynamicLink)
                    }
            }
            if linkHandled {
                return true
            } else {
                return false
            }

        }
        return false
    }
 
    

    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        var handled: Bool
        handled = GIDSignIn.sharedInstance.handle(url)
        if handled {
            return true
        }
        return false
    }

    func handleSessionRestore(user: GIDGoogleUser) {
        guard let email = user.profile?.email,
            let firstName = user.profile?.givenName,
            let lastName = user.profile?.familyName else {
                return
        }

        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set("\(firstName) \(lastName)", forKey: "name")

        DatabaseManager.shared.userExists(with: email, completion: { exists in
            if !exists {
                // insert to database
                let chatUser = ChatAppUser(
                    firstName: firstName,
                    lastName: lastName,
                    emailAddress: email
                )
                DatabaseManager.shared.insertUser(with: chatUser, completion: { success in
                    if success {
                        // upload image

                        if user.profile?.hasImage == true {
                            guard let url = user.profile?.imageURL(withDimension: 200) else {
                                return
                            }

                            URLSession.shared.dataTask(with: url, completionHandler: { data, _, _ in
                                guard let data = data else {
                                    return
                                }

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
                    }
                })
            }
        })

        let authentication = user.authentication
        guard let idToken = authentication.idToken else {
            return
        }

        let credential = GoogleAuthProvider.credential(
            withIDToken: idToken,
            accessToken: authentication.accessToken
        )
     

        FirebaseAuth.Auth.auth().signIn(with: credential, completion: { authResult, error in
            guard authResult != nil, error == nil else {
                print("failed to log in with google credential")
                return
            }

            print("Successfully signed in with Google cred.")
            NotificationCenter.default.post(name: .didLogInNotification, object: nil)
        })
    }
    
   
}
