//
//  Entry.swift
//  AlcoCount
//
//  Created by David Schwardt on 5/5/18.
//  Copyright © 2018 David Schwardt. All rights reserved.
//

import Foundation

import UIKit


class Entry {
    
    var range: String
    var blurb: String
    var color: UIColor
    
    init(range: String, blurb: String, color: UIColor) {
        self.range = range
        self.blurb = blurb
        self.color = color
        
    }
}
