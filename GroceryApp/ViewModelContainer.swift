//
//  ViewModelContainer.swift
//  GroceryApp
//
//  Created by Matthew Downey on 1/22/17.
//  Copyright © 2017 Matthew Downey. All rights reserved.
//

import Foundation

protocol ViewModelContainer {
    
    associatedtype VM: ViewModel
    
    var viewModel: VM { get set }
}
