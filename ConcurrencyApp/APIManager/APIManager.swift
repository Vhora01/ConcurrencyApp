//
//  APIManager.swift
//  ConcurrencyApp
//
//  Created by Prakash on 14/08/25.
//

import Foundation


protocol DataManagerDelegate {
    func getProducts<T:Decodable>(strURL:String) async throws->T?
}



class APIManager : DataManagerDelegate{
    func getProducts<T:Decodable>(strURL:String) async throws->T?{
        guard let url = URL(string: strURL) else {
            throw URLError(.badURL)
        }
        let (data,_) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
