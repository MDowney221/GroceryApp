//
//  GroceryList+CoreDataClass.swift
//  GroceryApp
//
//  Created by Matthew Downey on 1/22/17.
//  Copyright © 2017 Matthew Downey. All rights reserved.
//

import Foundation
import CoreData


public class GroceryList: NSManagedObject {

    convenience init?(managedObjectContext: NSManagedObjectContext?) {
        guard let manObjCtx = managedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "GroceryList", in: manObjCtx)
            else {
                return nil
        }
        self.init(entity: entity, insertInto: manObjCtx)
    }
    
}
