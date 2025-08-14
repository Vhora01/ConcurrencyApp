//
//  APIManager.swift
//  ConcurrencyApp
//
//  Created by Prakash on 14/08/25.
//

import Foundation


protocol DataManagerDelegate {
    func getProducts(strURL:String) async throws->[Product]?
}



class APIManager : DataManagerDelegate{
    func getProducts(strURL:String) async throws->[Product]?{
        guard let url = URL(string: strURL) else {
            throw URLError(.badURL)
        }
        let (data,_) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Product].self, from: data)
    }
}
