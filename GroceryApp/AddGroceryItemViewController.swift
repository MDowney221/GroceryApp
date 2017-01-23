//
//  AddGroceryItemViewController.swift
//  GroceryApp
//
//  Created by Matthew Downey on 1/22/17.
//  Copyright © 2017 Matthew Downey. All rights reserved.
//

import UIKit

class AddGroceryItemViewController: UIViewController, ViewModelContainer {
    
    // MARK: - Properties
    
    var viewModel: GroceryItemsViewModel = GroceryItemsViewModel()

    @IBOutlet var groceryItemName: UITextField?
    @IBOutlet var groceryItemQuantity: UITextField?
    
    var selectedGroceryList: GroceryList? {
        get {
            return viewModel.groceryList
        }
        set {
            viewModel.groceryList = newValue
        }
    }
    
    @IBAction func dismiss() {
        dismiss(animated: UIView.areAnimationsEnabled, completion: nil)
    }

    @IBAction func addGroceryItem() {
        do {
            let quantity = Int( groceryItemQuantity?.text ?? "0")
            try viewModel.createGroceryItem(with: groceryItemName?.text, and: quantity)
        }
        catch {
            print(error)
        }
        dismiss()
    }
    
    
}
