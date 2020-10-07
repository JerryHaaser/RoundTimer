//
//  CoreDataStack.swift
//  RoundTimer
//
//  Created by Jerry haaser on 9/21/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()
    
    private init() {}
    
    func save(context: NSManagedObjectContext) throws {
        
        var closureError: Error?
        
        context.performAndWait {
            do {
                try context.save()
                print("Saved")
            } catch {
                NSLog("error saving: \(error)")
                closureError = error
            }
        }
        if let error = closureError {
            throw error
        }
    }
    
    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "RountTimer")
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error {
                fatalError("Failed to load persistent store: \(error)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
}

extension NSManagedObjectContext {
    static let context = CoreDataStack.shared.mainContext
}
