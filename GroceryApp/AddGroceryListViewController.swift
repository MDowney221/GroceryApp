//
//  AddGroceryListViewController.swift
//  GroceryApp
//
//  Created by Matthew Downey on 1/22/17.
//  Copyright © 2017 Matthew Downey. All rights reserved.
//

import UIKit

class AddGroceryListViewController: UIViewController, ViewModelContainer {
    
    // MARK: - Properties
    
    var viewModel: GroceryListsViewModel = GroceryListsViewModel()
    
    @IBOutlet var groceryListName: UITextField?
    
    @IBAction func dismiss() {
        dismiss(animated: UIView.areAnimationsEnabled, completion: nil)
    }
    
    @IBAction func addGroceryList() {
        do {
            try viewModel.createGroceryList(with: groceryListName?.text)
        
            dismiss()
        }
        catch {
            print(error)
        }
    }
}
