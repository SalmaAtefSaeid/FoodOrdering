//
//  RemoteImage.swift
//  FoodOrdering
//
//  Created by Salma on 09/02/2025.
//

import SwiftUI

@MainActor final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(fromURLImage urlImage: String) {
        Task {
            guard let uiImage = try? await NetworkManager.shared.downloadImage(fromURLString: urlImage) else {
                return
            }
            self.image = Image(uiImage: uiImage)
        }
    }
    
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}


struct AppetizerRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .task {
                imageLoader.load(fromURLImage: urlString)
            }
    }
}
