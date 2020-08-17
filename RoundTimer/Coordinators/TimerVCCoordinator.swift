//
//  TimerVCCoordinator.swift
//  RoundTimer
//
//  Created by Jerry haaser on 8/13/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation
import UIKit

protocol TimerVCCoordinatorDelegate: class {
    
}

class TimerVCCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController?
    var timerVC = TimerViewController.instantiate()
    var delegate: TimerVCCoordinatorDelegate?
    
    override func start() {
       // let viewController = TimerViewController.instantiate()
        let viewController = TimerViewController.instantiate()
        viewController.coordinator = self
        viewController.delegate = delegate
        navigationController?.setViewControllers([viewController], animated: true)
    }
    
}