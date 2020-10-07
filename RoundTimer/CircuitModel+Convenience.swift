//
//  CircuitModel+Convenience.swift
//  RoundTimer
//
//  Created by Jerry haaser on 9/21/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation
import CoreData

extension CircuitModel {
    
    var circuitModelRepresentation: CircuitModelRepresentation? {
        guard let circuitName = circuitName else { return nil }
        
        //MARK: Ask about all this int casting
        return CircuitModelRepresentation(roundMinute: Int(roundMinute), roundSecond: Int(roundSecond), restMinute: Int(restMinute), restSecond: Int(restSecond), circuitName: circuitName)
    }
    
    @discardableResult convenience init(representation: CircuitModelRepresentation, context: NSManagedObjectContext = .context) {
        self.init(circuitName: representation.circuitName,
                  roundMinute: representation.roundMinute,
                  roundSecond: representation.roundSecond,
                  restMinute: representation.restMinute,
                  restSecond: representation.restSecond,
                  context: context)
    }
    
    @discardableResult convenience init(circuitName: String?,
                                        roundMinute: Int?,
                                        roundSecond: Int?,
                                        restMinute: Int?,
                                        restSecond: Int?,
                                        context: NSManagedObjectContext) {
        self.init(context: context)
        
        if let circuitName = circuitName {
            self.circuitName = circuitName
        }
        if let roundMinute = roundMinute {
            self.roundMinute = Int16(roundMinute)
        }
        if let roundSecond = roundSecond {
            self.roundSecond = Int16(roundSecond)
        }
        if let restMinute = restMinute {
            self.restMinute = Int16(restMinute)
        }
        if let restSecond = restSecond {
            self.restSecond = Int16(restSecond)
        }
    }
    
}
