//
//  GroceryItem+CoreDataProperties.swift
//  GroceryApp
//
//  Created by Matthew Downey on 1/22/17.
//  Copyright © 2017 Matthew Downey. All rights reserved.
//

import Foundation
import CoreData


extension GroceryItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroceryItem> {
        return NSFetchRequest<GroceryItem>(entityName: AppConstants.Entities.groceryList);
    }

    @NSManaged public var itemName: String?
    @NSManaged public var itemQuantity: Int16
    @NSManaged public var groceryList: GroceryList?

}
