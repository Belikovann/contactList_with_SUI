//
//  NewUserViewModel.swift
//  contactList_SUI
//
//  Created by Аня Беликова on 29.09.2023.
//

import SwiftUI

@MainActor
final class NewUserViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    
    private let networkManager = NetworkManager.shared
    
    func addUser(to userListViewModel: UserListViewModel) {
        
    }
}
