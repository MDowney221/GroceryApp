//
//  ReloadContainer.swift
//  GroceryApp
//
//  Created by Matthew Downey on 1/22/17.
//  Copyright © 2017 Matthew Downey. All rights reserved.
//

protocol ReloadContainer {
    var reloadData: ((Void) -> Void)? { get set }
}
