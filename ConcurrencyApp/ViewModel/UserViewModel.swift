//
//  UserViewModel.swift
//  ConcurrencyApp
//
//  Created by Prakash on 20/08/25.
//
import SwiftUI
@MainActor
class UserViewModel : ObservableObject{
    @Published var arrUsers : [User] = []
    @Published var errorMessage : String = ""
    func getUsers()async{
        do{
            self.arrUsers = try await APIManager().getUser()
            print(arrUsers)
        }catch {
            self.errorMessage = error.localizedDescription
            print(errorMessage)
        }
    }
}
