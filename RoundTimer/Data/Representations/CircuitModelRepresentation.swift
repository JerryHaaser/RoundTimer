//
//  CircuitModelRepresentation.swift
//  RoundTimer
//
//  Created by Jerry haaser on 9/21/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation

struct CircuitModelRepresentation: Codable {
    
    var roundMinute: Int?
    var roundSecond: Int?
    var restMinute: Int?
    var restSecond: Int?
    var numberRounds: Int?
    var circuitName: String?
    
}

struct ReturnedCircuit: Codable {
    let name: String?
}

