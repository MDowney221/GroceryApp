//
//  Array+ExtensionsTests.swift
//  GroceryApp
//
//  Created by Matthew Downey on 1/22/17.
//  Copyright © 2017 Matthew Downey. All rights reserved.
//

import XCTest
@testable import GroceryApp

class Array_ExtensionsTests: XCTestCase {
    
    var subject: [String]!
    
    override func setUp() {
        super.setUp()
    
        subject = ["A", "B", "C"]
    }
    
    func testShouldGetTheCorrectValue() {
        let index = 1
        
        let result = subject.value(at: index)
        
        XCTAssertEqual("B", result)
    }

    func testShouldGetNilForAnIndexBeyondEndIndex() {
        let index = 10
        
        let result = subject.value(at: index)
        
        XCTAssertNil(result)
    }
    
    func testShouldGetNilForAnIndexLessThanZero() {
        let index = -5
        
        let result = subject.value(at: index)
        
        XCTAssertNil(result)
    }
    
}
