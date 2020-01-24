//
//  SocialShareProtocol.swift
//  SocialShareDemo
//
//  Created by Shantaram K on 23/01/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

protocol SocialServiable {
    
    init(completionHandler: @escaping Handler, target: UIViewController, post: SocialMediaSharable)
    
    func run()
    
    var target  : UIViewController {get set}
    
    var serviceHandler: Handler? { get set }
}
