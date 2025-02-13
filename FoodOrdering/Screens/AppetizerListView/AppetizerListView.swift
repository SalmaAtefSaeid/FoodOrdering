//
//  AppetizerListView.swift
//  FoodOrdering
//
//  Created by Salma on 06/02/2025.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject private var appetizersListViewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(appetizersListViewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            appetizersListViewModel.selectedAppetizer = appetizer
                            appetizersListViewModel.isShowingDetails = true
                        }
                }
                .navigationTitle("🍟 Appetizers")
                .listStyle(.plain)
                .disabled(appetizersListViewModel.isShowingDetails)
            }
            .blur(radius: appetizersListViewModel.isShowingDetails ? 20 : 0)
            .task {
                appetizersListViewModel.getAppetizers()
            }
            
            if appetizersListViewModel.isShowingDetails {
                AppetizerDetailsView(appetizer: appetizersListViewModel.selectedAppetizer!, isShowingDetails: $appetizersListViewModel.isShowingDetails)
            }
            
            if appetizersListViewModel.isLoading {
                LoadingView()
            }
            
        }
        .alert(item: $appetizersListViewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
        
    }
    
    
    
}

#Preview {
    AppetizerListView()
}
