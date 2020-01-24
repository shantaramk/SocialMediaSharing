//
//  TwitterServiceManager.swift
//  SocialShareDemo
//
//  Created by Shantaram K on 23/01/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

class TwitterServiceManager: NSObject, SocialServiable {
    
    var serviceHandler: Handler?
    
    var target: UIViewController =  UIViewController()
    
    private var post: SocialMediaSharable?
    
    
    required init(completionHandler: @escaping Handler, target: UIViewController, post: SocialMediaSharable) {
        
        super.init()
        
        self.serviceHandler = completionHandler
        
        self.target = target
        
        self.post = post
    }
    
    func run() {
        
        
    }
}

