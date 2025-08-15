//
//  ProductViewModel.swift
//  ConcurrencyApp
//
//  Created by Prakash on 14/08/25.
//

import Foundation
import SwiftUI

@MainActor
class ProductViewModel : ObservableObject{
    @Published var arrProducts : [Product] = []
    func getProducts() async {
        do{
            arrProducts = try await APIManager().getProducts(strURL: Constant.productURL) ?? []
        }catch {
            print(error)
        }
    }
    func getProduct(productId:Int) async {
        do{
            async let product : Product? = try await APIManager().getProducts(strURL: "\(Constant.productURL)/\(productId)")
            if let product = try await product{
                arrProducts.append(product)
            }
        }catch {
            print(error)
        }
    }
}
