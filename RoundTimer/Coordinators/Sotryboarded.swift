//
//  Sotryboarded.swift
//  RoundTimer
//
//  Created by Jerry haaser on 8/11/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}

extension Storyboarded where Self: UIView {
    static func instantiate() -> Self {
        let stuff = UIView()
        return stuff as! Self
    }
}
