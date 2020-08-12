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

extension Storyboarded where Self: UINavigationController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Maine", bundle: Bundle.main)
        return storyboard.instantiateViewController(identifier: id) as! Self
    }
}
