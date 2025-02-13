//
//  User.swift
//  FoodOrdering
//
//  Created by Salma on 10/02/2025.
//

import Foundation

struct User: Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthdate       = Date()
    var extraNapkins    = false
    var frequentRefills = false
}
