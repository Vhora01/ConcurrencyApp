//
//  ContentView.swift
//  ConcurrencyApp
//
//  Created by Prakash on 14/08/25.
//

import SwiftUI

struct HomeView: View {
    let arrItems = ["MVVM + Async_Await","Async let","withCheckedThrowingContinuation"]
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
            }else if value == "Async let"{
                AsyncLetView()
            }else if value == "withCheckedThrowingContinuation"{
                WithCheckedThrowingContinuationView()
            }
        }
        
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}
