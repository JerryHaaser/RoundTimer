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
    
    var timerVC = TimerViewController()
    //let timerVCCoordinator = ()
    var setTimerVC = SetTimerViewController()
    
    var roundMinutes: Int?
    var roundSeconds: Int?
    var restMinutes: Int?
    var restSeconds: Int?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        window.makeKeyAndVisible()
        //navigationController.isNavigationBarHidden = true
        window.rootViewController = self.navigationController
        
        toTimerVC()
    }
    
//    func toSetTimerVC() {
//        let vc = SetTimerViewController.instantiate()
//        vc.coordinator = self
//        vc.delegate = self
//        navigationController.pushViewController(vc, animated: true)
//    }
    
//    func toTimerVC() {
//        let vc = TimerViewController.instantiate()
//        vc.coordinator = self
//        vc.delegate = self
//        navigationController.pushViewController(vc, animated: true)
//    }
    
}

extension MainCoordinator: TimerVCCoordinatorDelegate {
//    
//    func toSetTimerVC() {
//        let vc = SetTimerViewController.instantiate()
//        vc.coordinator = self
//        vc.delegate = self
//        navigationController.pushViewController(vc, animated: true)
//    }
    
}

extension MainCoordinator: TimerVCDelegate {
    func toSetTimerVC() {
        let vc = SetTimerViewController.instantiate()
        vc.coordinator = self
        vc.delegate = self
        navigationController.pushViewController(vc, animated: true)
        
    }
}

extension MainCoordinator: SetTimerVCDelegate {
    func toTimerVC() {
        let vc = TimerViewController.instantiate()
        //vc.navigationController = navigationController
        vc.coordinator = self
        vc.delegate = self
        navigationController.pushViewController(vc, animated: true)
        //navigationController.popToRootViewController(animated: true)
    }

}

extension MainCoordinator: SetTimerVCCoordinatorDelegate {
    func setTime() {
        let time = "Time"
    }
}

//extension MainCoordinator: TimerVCDelegate {
//
//    func lovesIt() {
//        let it = "All of it"
//    }
//
//}
