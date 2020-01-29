//
//  FacebookServiceManager.swift
//  SocialShareDemo
//
//  Created by Shantaram K on 23/01/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit
import Social
import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit
import FacebookLogin
import FacebookCore
import FacebookLogin
import FacebookShare

class FacebookServiceManager: NSObject, SocialServiable {
    
    var serviceHandler: Handler?
    
    var target: UIViewController =  UIViewController()
    
    private var post: SocialMediaSharable?

    let loginManager = LoginManager()

    
    required init(completionHandler: @escaping Handler, target: UIViewController, post: SocialMediaSharable) {
        
        
        self.serviceHandler = completionHandler
        
        self.target = target
        
        self.post = post
    }
    
 
    func run() {
      
        shareInFacebook()
     }
    
    func configureLoginButton() {}
    
    private func shareInFacebook() {
        
        if UIApplication.shared.canOpenURL(URL(string: "fb://")!) {
            
            let content = SharePhotoContent()
            
            content.photos = [SharePhoto(image: (post?.image!)!, userGenerated: true)]
            
//            let obj = ShareDialog(fromViewController: self.target, content: content, delegate: self)
            
            let obj = ShareDialog()
            
            obj.fromViewController = self.target
            
            obj.shareContent = content
            
            obj.delegate = self
            
            if obj.canShow {
                
                obj.show()
            }
            
        } else {
            self.serviceHandler!(true, "Facebook Messenger must be installed in order to share to it")
        }
    }
    
}

// MARK: - Share Media Delegate

extension PhotoViewController: SharingDelegate {
    
    func sharer(_ sharer: Sharing, didCompleteWithResults results: [String : Any]) {
        
        Alert.showAlert(viewController: self, title: "Success", message: "Photo uploaded successfullyt")
    }
    
    func sharer(_ sharer: Sharing, didFailWithError error: Error) {
        
        Alert.showAlert(viewController: self, title: "Success", message: error.localizedDescription)

    }
    
    func sharerDidCancel(_ sharer: Sharing) {
        
        Alert.showAlert(viewController: self, title: "Success", message: "User has cancelled photo uploading operation")

    }
    
}

extension FacebookServiceManager: SharingDelegate {
    
   func sharer(_ sharer: Sharing, didCompleteWithResults results: [String : Any]) {
           self.serviceHandler!(false, "photo uploaded successfullyt")
       }
       
       func sharer(_ sharer: Sharing, didFailWithError error: Error) {
           self.serviceHandler!(true, error.localizedDescription)

       }
       
       func sharerDidCancel(_ sharer: Sharing) {
           self.serviceHandler!(true, "User has cancelled photo uploading operation")

       }
}

// MARK: - Facebook Login

extension FacebookServiceManager {
    
    func pushToFacebookView() {
        //loginManager.loginBehavior = .browser
        
        loginManager.logIn(permissions: ["public_profile", "email"], from: target) { (loginResult, error) in
            
            if error == nil {
                
                let fbloginresult: LoginManagerLoginResult = loginResult!
                
                if !fbloginresult.grantedPermissions.isEmpty {
                    
                    if fbloginresult.grantedPermissions.contains("email") {
                        
                        self.getFBUserData()
                    }
                }
            }
        }
    }
    
    func getFBUserData() {
        
        if AccessToken.current != nil {
            
            GraphRequest(graphPath: "me", parameters: ["fields": "id, name, picture.type(large), email"]).start(completionHandler: { (_, result, error) -> Void in
                // self.dismissHUD()
                if error == nil {
                    
                    /*
                    if let info = result as? [String: AnyObject] {
                        
                        let accessToken = AccessToken.current!.tokenString
                        
                       // self.delegate?.didLogInWithUserInformation(facebookId: facebookInfo.id, accessToken: accessToken, userFacebookModel: facebookInfo)
                    } */
                }
            })
        }
    }
    
    func clearSession() {
        loginManager.logOut()
        
    }
}

// MARK: - Facebook login delegate

extension FacebookServiceManager {
    
    func loginButton(_ loginButton: FBLoginButton!, didCompleteWith result: LoginManagerLoginResult!, error: Error!) {
        
        if error == nil {
            
            if AccessToken.current != nil {
                
                getFBUserData()
                
                LoginManager().logOut()
            }
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton!) {
    }
    
    func loginButtonWillLogin(_ loginButton: FBLoginButton!) -> Bool {
        
        return true
    }
}
