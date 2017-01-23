//
//  ViewModel.swift
//  GroceryApp
//
//  Created by Matthew Downey on 1/22/17.
//  Copyright © 2017 Matthew Downey. All rights reserved.
//

import UIKit
import CoreData

class ViewModel {
    
    // MARK: - Properties

    var persistentContainer: PersistentContainer?
    var managedObjectContext: NSManagedObjectContext? {
        return persistentContainer?.managedObjectContext
    }

    // MARK: - Initializer
    
    init(persistentContainer: PersistentContainer? = UIApplication.shared.delegate as? AppDelegate) {
        self.persistentContainer = persistentContainer
    }
    
    func executeRequest<Type: NSManagedObject>() throws -> [Type]? {
        let request = Type.fetchRequest()
        return try request.execute() as? [Type]
    }
 
    func fetch<Type: NSManagedObject>() -> [Type]? {
        var result: [Type]? = nil
        
        managedObjectContext?.performAndWait { [weak self]  in
            do {
                result = try self?.executeRequest()
            }
            catch {
                print(error)
            }
        }
        return result
    }
    
    func save() throws {
        try managedObjectContext?.save()
    }
    
}
