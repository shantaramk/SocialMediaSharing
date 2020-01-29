//
//  ViewController.swift
//  SocialShareDemo
//
//  Created by Shantaram K on 24/01/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

class PhotoViewController: AbstractViewController {
    
    //MARK:- IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    var imageList = ["1","2","3", "4", "5","6","7"]
    
    var socialMediaList: [(String, UIAlertAction.Style)] {
        
        get {
            var actions: [(String, UIAlertAction.Style)] = []
            
            actions.append(("Facebook", UIAlertAction.Style.default))
            
            actions.append(("Other", UIAlertAction.Style.default))
            
            return actions
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureUI()
    }
    
    
    @IBAction func shareButtonClicked(_ sender: UIButton) {
        
        
        
        showSocialShareAlert(SharablePost(image: UIImage(named: self.imageList[sender.tag]),
        url: URL(string: "https://about.me/kokate"),
        text: "Hello find the photos and profile: https://about.me/kokate"))
        
    }
    
}
// MARK: - Private Methods

extension PhotoViewController {
    
    func showSocialShareAlert(_ post: SharablePost) {
        
        
        Alert.showActionsheet(viewController: self, title: "Share", message: "", actions: self.socialMediaList) { (index) in
            
            print("call action \(index)")
            
            if index == 0 {
                
                self.facebookPhotoShare(post)
                
            } else {
                
                self.twitterPhotoShare(post)
            }
        }
    }
    
    func facebookPhotoShare(_ post: SharablePost) {
        SocialShareManager(serviceType: .facebook,
                           target: self,
                           post: post)
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
    
    func twitterPhotoShare(_ post: SharablePost) {
        SocialShareManager(serviceType: .twitter,
                           target: self,
                           post: post)
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

