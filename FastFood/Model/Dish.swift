//
//  Dish.swift
//  FastFood
//
//  Created by Xcaret Mora on 01/12/23.
//

import Foundation

struct Dish {
    let id, name, description, image: String?
    let calories: Double?
    
    var formattedCalories: String {
        return "\(calories ?? 0) calories"
    }
}
