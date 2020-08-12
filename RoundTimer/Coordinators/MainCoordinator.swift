//
//  MainCoordinator.swift
//  RoundTimer
//
//  Created by Jerry haaser on 8/11/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: BaseCoordinator {
    
    var window: UIWindow
    
    var navigationController = UINavigationController()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        window.makeKeyAndVisible()
        //navigationController.isNavigationBarHidden = true
        window.rootViewController = self.navigationController
    }
    
}
