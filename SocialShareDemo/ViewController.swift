//
//  ViewController.swift
//  SocialShareDemo
//
//  Created by Shantaram K on 24/01/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var socialMediaList: [(String, UIAlertAction.Style)] {
        
        get {
            var actions: [(String, UIAlertAction.Style)] = []
            
            actions.append(("Facebook", UIAlertAction.Style.default))
            
            actions.append(("Twitter", UIAlertAction.Style.default))
            
            return actions
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    @IBAction func shareButtonClicked(_ sender: UIButton) {
        
        showSocialShareAlert()
        
    }
    
}
// MARK: - Private Methods

extension ViewController {
    
    func showSocialShareAlert() {
        
        
        Alert.showActionsheet(viewController: self, title: "Share", message: "", actions: self.socialMediaList) { (index) in
            
            print("call action \(index)")
            
            if index == 0 {
                
                self.facebookPhotoShare()
                
            } else {
                
                self.twitterPhotoShare()
            }
        }
    }
    
    func facebookPhotoShare() {
        SocialShareManager(serviceType: .facebook,
                           target: self,
                           post: SharablePost(image: #imageLiteral(resourceName: "lorry"),
                                              url: URL(string: "www.google.com"),
                                              text: "Hello find the link"))
        { (error, message) in
            
            if !error {
                
            } else {
                Alert.showAlert(viewController: self, title: "Alert", message: message)
            }
            print(error)
            
            print(message)
        }
            
        .run()
    }
    
    func twitterPhotoShare() {
        SocialShareManager(serviceType: .twitter,
                           target: self,
                           post: SharablePost(image: #imageLiteral(resourceName: "lorry"),
                                              url: URL(string: "www.google.com"),
                                              text: "Hello find the link"))
        { (error, message) in
            
            if !error {
                
            } else {
                Alert.showAlert(viewController: self, title: "Alert", message: message)
            }
            print(error)
            
            print(message)
        }
            
        .run()
    }
    
}

