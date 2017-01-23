////
////  GroceryListViewController.swift
////  GroceryApp
////
////  Created by Matthew Downey on 11/26/16.
////  Copyright © 2016 Matthew Downey. All rights reserved.
////
//
//import UIKit
//
//class OldGroceryListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//
//    @IBOutlet var groceryListTableViewOld: UITableView!
//    
//    var manager = DataManager.shared
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
//        
//        view.addGestureRecognizer(tap)
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        manager.loadGroceryListData()
//        groceryListTableViewOld?.reloadData()
//    }
//
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return manager.groceryListCount
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = groceryListTableViewOld.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        
//        cell.textLabel?.text = manager.getGroceryListName(from: indexPath)
//        
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        groceryListTableViewOld.deselectRow(at: indexPath, animated: UIView.areAnimationsEnabled)
//        
//        manager.selectedGroceryListIndex = indexPath.row
//    }
//    
//}
