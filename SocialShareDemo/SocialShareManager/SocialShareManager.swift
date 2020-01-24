//
//  SocialShareManager.swift
//  SocialShareDemo
//
//  Created by Shantaram K on 23/01/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

enum ServiceType {
    
    case facebook
    
    case twitter

}

typealias Handler = (Bool, String) -> Void

class SocialShareManager: NSObject {
    
    //MARK - Properties
    
    private var serviceType: ServiceType?
    
    private var viewController  : UIViewController?
    
    private var service: SocialServiable?
    
    private var serviceHandler: Handler?
    
    private var post: SocialMediaSharable?
    
    //MARK - Initialization
    
    init(serviceType service: ServiceType, target: UIViewController, post: SocialMediaSharable, completionHandler: @escaping Handler) {
        
        super.init()
        
        self.serviceType = service
        
        self.serviceHandler = completionHandler
        
        self.viewController = target
        
        self.post = post
    }
    
    //MARK - Public Method
    
    public func run() {
        
        guard let serviceType = serviceType else { return }
        
        switch serviceType {
            
        case .facebook:
            
            self.service = FacebookServiceManager(completionHandler: serviceHandler!, target: self.viewController!, post: self.post!)
            
        case .twitter:
            
            self.service =  TwitterServiceManager(completionHandler: serviceHandler!, target: self.viewController!, post: self.post!)
        }
        
        self.service!.run()

    }
}


