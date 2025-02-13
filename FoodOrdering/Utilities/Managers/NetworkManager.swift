//
//  NetworkManager.swift
//  FoodOrdering
//
//  Created by Salma on 08/02/2025.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    
    private let appetizersURL = baseURL + "appetizers"
    
    private init() {}
    
    func getAppetizers() async throws -> [Appetizer] {
        guard let url = URL(string: appetizersURL) else {
            throw APError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(AppetizerResponse.self, from: data).request
        } catch {
            throw APError.invalidData
        }
    }
    
    func downloadImage(fromURLString urlString: String) async throws -> UIImage {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            return image
        }
        
        guard let url = URL(string: urlString) else {
            throw APError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        guard let image = UIImage(data: data) else {
            throw APError.invalidData
        }
        
        self.cache.setObject(image, forKey: cacheKey)
        return image
    }
}
