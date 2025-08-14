//
//  ProductListView.swift
//  ConcurrencyApp
//
//  Created by Prakash on 14/08/25.
//

import SwiftUI

struct ProductListView: View {
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
        .navigationTitle("Product List")
        .navigationDestination(for: Product.self, destination: { product in
            ProductDetailView(product: product)
        })
        
        .task {
            await productVM.getProducts()
        }
    }
}

#Preview {
    NavigationStack{
        ProductListView()
    }
}
