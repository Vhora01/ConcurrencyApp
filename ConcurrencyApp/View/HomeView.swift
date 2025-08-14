//
//  ContentView.swift
//  ConcurrencyApp
//
//  Created by Prakash on 14/08/25.
//

import SwiftUI

struct HomeView: View {
    let arrItems = ["MVVM + Async_Await"]
    var body: some View {
        VStack {
            List(arrItems,id: \.self) { item in
                NavigationLink(value: item) {
                    Text(item)
                }
            }
        }
        .padding()
        .navigationTitle("Concurrency")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(for: String.self) { value in
            if value == "MVVM + Async_Await"{
                ProductListView()
            }
        }
        
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}
