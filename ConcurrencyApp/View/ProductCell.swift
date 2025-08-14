//
//  ProductCell.swift
//  ConcurrencyApp
//
//  Created by Prakash on 15/08/25.
//

import SwiftUI

struct ProductCell : View {
    let product : Product
    var body: some View {
        HStack(spacing:10){
            AsyncImage(url: product.imageURL) { image in
                image.resizable()
                    .frame(width:80,height: 100)
            } placeholder: {
                ProgressView()
                    .frame(width:80,height: 100)
                
            }
            VStack(alignment:.leading , spacing: 10){
                Text(product.title)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 20 ,weight: .bold))
                    .foregroundStyle(.black)
            }
            .padding([.top,.bottom],10)
        }
    }
}

#Preview {
    ProductCell(product: Product(id: 1, title: "DANVOUY Womens T Shirt Casual Cotton Short", price: 12.10, description: "95%Cotton,5%Spandex, Features: Casual, Short Sleeve, Letter Print,V-Neck,Fashion Tees, The fabric is soft and has some stretch., Occasion: Casual/Office/Beach/School/Home/Street. Season: Spring,Summer,Autumn,Winter.", category: "women\'s clothing", image: "https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_t.png", rating: Rating(rate: 12.0, count: 100)))
}
