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
    
    private func getUsers(strURL:String , completion:@escaping (Result<[User],Error>)->()){
        guard let url = URL(string: strURL) else {
            completion(.failure(URLError(.badURL)))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            guard let response = response as? HTTPURLResponse, 200 ... 299  ~= response.statusCode else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            // JSONDecoder() converts data to model of type Array
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                completion(.success(users))
            }
            catch {
                completion(.failure(error))
            }
        }.resume()
        //            }
    }
    
    func getUser() async throws->[User]{
        return try await withCheckedThrowingContinuation { continuation in
            self.getUsers(strURL: "https://fakestoreapi.com/users") { result in
                switch result {
                case .success(let users):
                    continuation.resume(returning: users)
                case .failure(let failure):
                    continuation.resume(throwing: failure)
                }
            }
        }
    }
}
