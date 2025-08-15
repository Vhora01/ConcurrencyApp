//
//  AsyncLetView.swift
//  ConcurrencyApp
//
//  Created by Prakash on 15/08/25.
//

import SwiftUI

struct AsyncLetView : View {
    @StateObject private var productVM = ProductViewModel()

    var body: some View {
        VStack(content: {
            ScrollView(.vertical) {
                ForEach(productVM.arrProducts,id: \.id){ product in
                    LazyVStack(alignment:.leading){
                        NavigationLink(value: product) {
                            ProductCell(product: product)
                        }
                    }
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue.opacity(0.5) ,lineWidth: 1)
                            .shadow(color:.black,radius: 5 , x: -5 ,y: -5)
                    )
                }
            }.scrollIndicators(.hidden)
        })
        .padding()
        .navigationTitle("Product")
        .navigationDestination(for: Product.self, destination: { product in
            ProductDetailView(product: product)
        })
        .task {
            for index in 1...5{
                do{
                    try Task.checkCancellation()
                    try await productVM.getProduct(productId:index)
                }catch{
                    print(error)
                }
            }
            
        }
    }
}


#Preview {
    NavigationStack{
        AsyncLetView()
    }
}
