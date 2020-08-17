//
//  Coordinator.swift
//  RoundTimer
//
//  Created by Jerry haaser on 8/11/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: class {

    var navigationController: UINavigationController { get set }
    
    func start()
}
