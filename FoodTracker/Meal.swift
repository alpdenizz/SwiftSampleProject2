//
//  Meal.swift
//  FoodTracker
//
//  Created by Denizalp KAPISIZ on 13/07/16.
//  Copyright © 2016 Denizalp KAPISIZ. All rights reserved.
//

import UIKit

class Meal {
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Initialization
    init?(name: String, photo: UIImage?, rating: Int) {
        self.name = name
        self.photo = photo
        self.rating = rating
        
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
}
