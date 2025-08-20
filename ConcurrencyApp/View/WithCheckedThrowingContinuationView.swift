//
//  WithCheckedThrowingContinuationView.swift
//  ConcurrencyApp
//
//  Created by Prakash on 20/08/25.
//

import SwiftUI

struct WithCheckedThrowingContinuationView : View {
    @StateObject private var userVM = UserViewModel()
    var body: some View {
        ScrollView {
            ForEach(userVM.arrUsers,id: \.id){ user in
                LazyVStack(alignment:.leading,spacing: 5){
                    Text("\(user.name.firstname.capitalized) \(user.name.lastname.capitalized)")
                        .font(.system(size: 20))
                        .bold()
                    Text(user.email)
                        .font(.system(size: 18))
                    Text("\(user.address.number),\(user.address.street), ,\(user.address.city),\(user.address.zipcode)")
                        .font(.system(size: 18))
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(lineWidth: 1)
                        .shadow(color:.cyan,radius: 5)
                )
            }
        }
        .padding()
        .navigationTitle("Users")
        .scrollIndicators(.hidden)
        .task {
            await userVM.getUsers()
        }
        
    }
}

#Preview {
    NavigationStack{
        WithCheckedThrowingContinuationView()
    }
}



