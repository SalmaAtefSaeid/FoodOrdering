//
//  LoadingView.swift
//  FoodOrdering
//
//  Created by Salma on 12/02/2025.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimary))
                .scaleEffect(2)
        }
    }
}

#Preview {
    LoadingView()
}
