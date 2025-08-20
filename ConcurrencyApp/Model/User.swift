//
//  User.swift
//  ConcurrencyApp
//
//  Created by Prakash on 20/08/25.
//

import Foundation

struct User : Decodable {
    let id : Int
    let email : String
    let username : String
    let password : String
    let name : Name
    let address : Address
    let phone : String
}

struct Name : Decodable{
    let firstname : String
    let lastname : String
}

struct Address : Decodable{
    let city : String
    let street : String
    let number : Int
    let zipcode : String
    let geolocation : GeoLocation
}

struct GeoLocation : Decodable{
    let lat : String
    let long : String
}
