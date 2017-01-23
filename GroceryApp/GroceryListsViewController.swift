//
//  GroceryListsViewController.swift
//  GroceryApp
//
//  Created by Matthew Downey on 1/22/17.
//  Copyright © 2017 Matthew Downey. All rights reserved.
//

import Foundation
import UIKit

class GroceryListsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ViewModelContainer {
    
    // MARK: - Properties
    
    @IBOutlet var groceryListTableView: UITableView?
    
    var viewModel: GroceryListsViewModel = GroceryListsViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
                super.viewWillAppear(animated)
        
                groceryListTableView?.reloadData()
    }
        
    // MARK: - Seque
    
    override func prepare(for seque: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: seque, sender: sender)
        
        if var groceryListContainer = seque.destination as? SelectedGroceryListContainer,
            let indexPath = groceryListTableView?.indexPathForSelectedRow {
                viewModel.transferGroceryList(at: indexPath, to: &groceryListContainer)
        }
    }
    
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.groceryLists.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let list = viewModel.groceryList(at: indexPath)
        
        cell.textLabel?.text = list.name
        cell.detailTextLabel?.text = "\(list.itemCount) Items"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: AppConstants.TableCell.rightDetail, for: indexPath)
    }
    
    
    
}
