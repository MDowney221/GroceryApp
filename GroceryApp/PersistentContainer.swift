//
//  PersistentContainer.swift
//  GroceryApp
//
//  Created by Matthew Downey on 1/22/17.
//  Copyright © 2017 Matthew Downey. All rights reserved.
//

import CoreData

protocol PersistentContainer {
    var persistentContainer: NSPersistentContainer { get set }
    var managedObjectContext: NSManagedObjectContext { get }
    
}

extension PersistentContainer {
    var managedObjectContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}
