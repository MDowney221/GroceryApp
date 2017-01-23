//
//  GroceryItemsViewController.swift
//  GroceryApp
//
//  Created by Matthew Downey on 1/22/17.
//  Copyright © 2017 Matthew Downey. All rights reserved.
//

import UIKit

class GroceryItemsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ViewModelContainer, SelectedGroceryListContainer {
    
    // MARK: - Properties
    
    var viewModel: GroceryItemsViewModel = GroceryItemsViewModel()
    var reloadData: ((Void) -> Void)? = nil
    
    @IBOutlet var groceryItemsTableView: UITableView?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        groceryItemsTableView?.reloadData()
        reloadData?()
    }
    
    var selectedGroceryList: GroceryList? {
        get {
            return viewModel.groceryList
        }
        set {
            viewModel.groceryList = newValue
        }
    }
    
    // MARK: - Seque
    
    @IBAction func returnToGroceryItems(seque: UIStoryboardSegue) {
        groceryItemsTableView?.reloadData()
    }
    
    override func prepare(for seque: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: seque, sender: sender)
        
        if var groceryListContainer = seque.destination as? SelectedGroceryListContainer {
            groceryListContainer.selectedGroceryList = selectedGroceryList        }
    }

    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.groceryItems.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let item = viewModel.groceryItem(at: indexPath)
        
        cell.textLabel?.text = item.nanme
        cell.detailTextLabel?.text = "Quantity: \(item.quantity)"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: AppConstants.TableCell.rightDetail, for: indexPath)
    }

    
}
