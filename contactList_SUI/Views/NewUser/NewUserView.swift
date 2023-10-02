//
//  NewUsersView.swift
//  contactList_SUI
//
//  Created by Аня Беликова on 29.09.2023.
//

import SwiftUI

struct NewUserView: View {
    @ObservedObject var userListViewModel: UserListViewModel
    @StateObject private var newUserViewModel = NewUserViewModel()
    
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationStack {
            List {
                TextField("First name", text: $newUserViewModel.firstName)
                TextField("Last name", text: $newUserViewModel.lastName)
            }
            .navigationTitle("New user")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        isPresented = false
                    }
                }
            }
        }
    }
}

struct NewUsersView_Previews: PreviewProvider {
    static var previews: some View {
        NewUserView(userListViewModel: UserListViewModel(), isPresented: .constant(true))
    }
}



