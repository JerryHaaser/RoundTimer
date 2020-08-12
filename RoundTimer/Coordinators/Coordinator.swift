//
//  Coordinator.swift
//  RoundTimer
//
//  Created by Jerry haaser on 8/11/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
