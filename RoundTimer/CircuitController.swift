//
//  CircuitController.swift
//  RoundTimer
//
//  Created by Jerry haaser on 9/21/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation
import CoreData

class CircuitController {
    
    var circuts: [CircuitModel] = []
    
    func createCircuit(with circuit: CircuitModelRepresentation) {
        NetworkController.shared.createCircuit(from: circuit) { result in
            switch result {
            case.failure(let error):
                print("Error creating circuit: \(error)")
            case.success(let circuit):
                print("Created circuit")
                self.circuts.append(circuit)
            }
        }
    }
    
//    fucn fetchCircuitFromServer() {
//        NetworkController.shared.fetchCircuits { (result)}
//    }
    
}
