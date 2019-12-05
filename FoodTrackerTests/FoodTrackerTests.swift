//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Denizalp KAPISIZ on 12/07/16.
//  Copyright © 2016 Denizalp KAPISIZ. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    // Mark: FoodTracker Tests
    func testMealInitialization(){
        //Success case
        let potentialItem = Meal(name: "Newest meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        //Failure Cases
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName, "Empty name is invalid")
        
        let badRating = Meal(name: "Really bad rating", photo: nil, rating: -1)
        XCTAssertNil(badRating, "Negative rating is not possible")
        
    }
}
