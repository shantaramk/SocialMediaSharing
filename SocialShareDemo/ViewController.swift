//
//  ViewController.swift
//  SocialShareDemo
//
//  Created by Shantaram K on 24/01/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func shareButtonClicked(_ sender: Any) {
        
        SocialShareManager(serviceType: .facebook,
                           target: self,
                           post: SharablePost(image: #imageLiteral(resourceName: "lorry"),
                                                   url: URL(string: "www.google.com"),
                                                   text: "Hello find the link"))
        { (error, message) in
            if !error {
                print(message)
            }
        }.run()
    }
    
}

