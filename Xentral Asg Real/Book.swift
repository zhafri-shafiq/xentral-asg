//
//  Book.swift
//  Xentral Asg Real
//
//  Created by Nazri Hussein on 2/2/17.
//  Copyright © 2017 zhafrishafiq. All rights reserved.
//

import UIKit

//an enum that defines a number of content options

/*
 enum Content {
    case Penguin, Koala, Lighthouse
} */

class Book {
    let name: String
    let url: String
    
    //designated initializer for a Book
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
    
    
}
