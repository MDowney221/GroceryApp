////
////  GroceryItemsViewController.swift
////  GroceryApp/Users/matthewddowney/Development/GroceryApp/GroceryApp.xcodeproj
////
////  Created by Matthew Downey on 11/27/16.
////  Copyright © 2016 Matthew Downey. All rights reserved.
////
//
//import UIKit
//
//class OldGroceryItemsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//
//    @IBOutlet var oldGroceryItemsTableView: UITableView!
//    
//    let manager = DataManager.shared
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        manager.loadGroceryItemData()
//        oldGroceryItemsTableView?.reloadData()
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return manager.groceryItemCount
//    }
//    
//    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        
//        let item = manager.getGroceryItems(from: indexPath)
//        cell.textLabel?.text = item?.itemName
//        cell.detailTextLabel?.text = "Qty: \(item?.itemQuantity ?? 0)"
//        
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        oldGroceryItemsTableView.deselectRow(at: indexPath, animated: UIView.areAnimationsEnabled)
//        
//        manager.selectedGroceryItemIndex = indexPath.row
//    }
//
//}
