//
//  EmptyState.swift
//  FoodOrdering
//
//  Created by Salma on 10/02/2025.
//

import SwiftUI

struct EmptyState: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .offset(y: -40)
        }
    }
}

#Preview {
    EmptyState(imageName: "empty-order", message: "ldkhckjabdkcjbdkhjvbfedhkbfdkhvbdakhbefviubaieuhviue")
}
