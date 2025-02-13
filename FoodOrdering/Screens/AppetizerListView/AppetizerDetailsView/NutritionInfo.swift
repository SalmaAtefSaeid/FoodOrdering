//
//  NutritionInfo.swift
//  FoodOrdering
//
//  Created by Salma on 10/02/2025.
//

import SwiftUI

struct NutritionInfo: View {
    
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

#Preview {
    NutritionInfo(title: "title", value: 99)
}
