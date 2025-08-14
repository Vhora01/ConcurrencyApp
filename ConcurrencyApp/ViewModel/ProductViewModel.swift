//
//  ProductViewModel.swift
//  ConcurrencyApp
//
//  Created by Prakash on 14/08/25.
//

import Foundation
import SwiftUI

class ProductViewModel : ObservableObject{
    @Published var arrProducts : [Product] = []
    func getProducts() async {
        do{
            arrProducts = try await APIManager().getProducts(strURL: Constant.productURL) ?? []
            print(arrProducts)
        }catch {
            print(error)
        }
    }
}
