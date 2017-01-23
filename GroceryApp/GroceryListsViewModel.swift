//
//  GroceryListsViewModel.swift
//  GroceryApp
//
//  Created by Matthew Downey on 1/22/17.
//  Copyright © 2017 Matthew Downey. All rights reserved.
//

import Foundation

class GroceryListsViewModel: ViewModel {
    
    // MARK: - Properties
    
    var groceryLists: [GroceryList] {
        return fetch() ?? []
    }
    
    // MARK: - Enum
    
    enum GroceryDataError: Error {
        case Saving(String)
    }
    
    // MARK: - Transferring Data
    
    func transferGroceryList(at indexPath: IndexPath, to container: inout SelectedGroceryListContainer) {
        container.selectedGroceryList = groceryLists.value(at: indexPath.row)
    }
    
    // MARK: - Grocery List Data
    
    func groceryList(at indexPath: IndexPath) -> (name: String?, itemCount: Int) {
        let list: GroceryList? = groceryLists.value(at: indexPath.row)
        return (list?.name, list?.groceryItems?.count ?? 0)
    }

    func createGroceryList(with name: String?) throws {
        guard name?.isEmpty == false,
            let newList = GroceryList(managedObjectContext: managedObjectContext) else {
                throw GroceryDataError.Saving("Threre was an error while saving \(name)")
        }
        newList.name = name
        try save()
    }
    
}
