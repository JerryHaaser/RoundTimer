//
//  SetTimerVCCoordinator.swift
//  RoundTimer
//
//  Created by Jerry haaser on 8/13/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation

protocol SetTimerVCCoordinatorDelegate {
    
}

class SetTimerVCCoordinator: BaseCoordinator {
    
    var delegate: SetTimerVCCoordinatorDelegate?
    
    override func start() {
        let viewController = SetTimerViewController.instantiate()
        viewController.coordinator = self
        viewController.delegate = delegate as! SetTimerVCDelegate
        
    }
    
}
