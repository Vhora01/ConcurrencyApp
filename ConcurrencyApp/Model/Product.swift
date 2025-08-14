//
//  Product.swift
//  ConcurrencyApp
//
//  Created by Prakash on 14/08/25.
//

import Foundation

struct Product:Identifiable,Decodable,Hashable{
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id : Int
    let title :String
    let price : Float
    let description:String
    let category : String
    let image : String
    let rating : Rating
    
    var imageURL : URL? {
        URL(string: image)
    }
    var productPrice : String{
        String(format: "%.2f", price)
    }
}


struct Rating:Decodable ,Hashable{
    let rate : Float
    let count : Int
}
