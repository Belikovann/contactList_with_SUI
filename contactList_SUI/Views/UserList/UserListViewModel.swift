//
//  UserListViewModel.swift
//  contactList_SUI
//
//  Created by Аня Беликова on 29.09.2023.
//

import Foundation

@MainActor
final class UserListViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isPresentingNewUserView = false
    @Published var isLoading = false
    
    private let networkManager = NetworkManager.shared
    
    func fetchUsers() async {
        isLoading = true
        do {
            users = try await networkManager.fetchUsers()
            isLoading = false
        } catch {
            print(error.localizedDescription)
        }
        isLoading = false
    }
    
    func appendUser(_ user: User) {
        users.append(user)
    }
    
    func dismiss() {
        isPresentingNewUserView = false
    }
}
