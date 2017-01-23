//
//  GroceryItemsViewModel.swift
//  GroceryApp
//
//  Created by Matthew Downey on 1/22/17.
//  Copyright © 2017 Matthew Downey. All rights reserved.
//

import Foundation

class GroceryItemsViewModel: ViewModel {
    
    // MARK: - Properties
    
    var groceryList: GroceryList?
    
    var groceryItems: [GroceryItem] {
        let result = groceryList?.groceryItems?.flatMap {
            $0 as? GroceryItem
        }
        return result ?? []
    }
    
    // MARK: - Enum
    
    enum GroceryDataError: Error {
        case Saving(String)
    }
    
    
    // MARK: - Grocery Item Data
    
    func groceryItem(at indexPath: IndexPath) -> (nanme: String?, quantity: Int16) {
        let item: GroceryItem? = groceryItems.value(at: indexPath.row)
        return (item?.itemName, item?.itemQuantity ?? 0)
    }
    
    func createGroceryItem(with name: String?, and quantity: Int?) throws {
        guard name?.isEmpty == false,
            let itemQuantity = quantity,
            let newItem = GroceryItem(managedObjectContext: managedObjectContext) else {
                throw GroceryDataError.Saving("There was an error saving the new grocery items \(name)")
        }
        newItem.itemName = name
        newItem.itemQuantity = Int16(itemQuantity)
        groceryList!.addToGroceryItems(newItem)
        try save()
    }
}
