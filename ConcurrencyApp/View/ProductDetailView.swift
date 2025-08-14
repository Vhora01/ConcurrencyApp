//
//  ProductDetailView.swift
//  ConcurrencyApp
//
//  Created by Prakash on 15/08/25.
//

import SwiftUI

struct ProductDetailView: View {
    let product:Product
    var body: some View {
        ScrollView{
            VStack{
                AsyncImage(url: product.imageURL) { image in
                    image.resizable()
                        .frame(width:80,height: 100)
                } placeholder: {
                    ProgressView()
                        .frame(width:80,height: 100)
                }
                
                VStack(alignment:.leading , spacing: 10){
                        Text(product.title)
                            .font(.system(size: 20 ,weight: .bold))
                    Text(product.description)
                        .font(.system(size: 20 ,weight: .regular))
                }
                    .padding([.top,.bottom],10)
                HStack{
                    HStack{
                        Text("Price:")
                            .font(.system(size: 20 ,weight: .semibold))
                        Text(product.productPrice)
                    }
                    Spacer()
                    HStack{
                        Text("category:")
                            .font(.system(size: 20 ,weight: .semibold))
                        Text(product.category)
                    }
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.blue.opacity(0.2) ,lineWidth: 2)
                    .shadow(color:.black.opacity(0.3),radius: 5 , x: -5 ,y: -5)
            )
        }
        .padding()
        
    }
}

#Preview {
    NavigationStack{
        ProductDetailView(
            product: Product(id: 1, title: "DANVOUY Womens T Shirt Casual Cotton Short", price: 12.1012312312, description: "95%Cotton,5%Spandex, Features: Casual, Short Sleeve, Letter Print,V-Neck,Fashion Tees, The fabric is soft and has some stretch., Occasion: Casual/Office/Beach/School/Home/Street. Season: Spring,Summer,Autumn,Winter.", category: "women\'s clothing", image: "https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_t.png", rating: Rating(rate: 12.0, count: 100)))
    }
}


