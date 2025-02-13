//
//  FoodOrderingApp.swift
//  FoodOrdering
//
//  Created by Salma on 06/02/2025.
//

import SwiftUI

@main
struct FoodOrderingApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
