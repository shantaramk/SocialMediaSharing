//
//  SocialMediaSharable.swift
//  SocialShareDemo
//
//  Created by Shantaram K on 24/01/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

protocol SocialMediaSharable {
    
    var image: UIImage? {get set}
    
    var url: URL? {get set}
    
    var text: String? {get set}
    
}
