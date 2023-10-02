//
//  UserRowView.swift
//  contactList_SUI
//
//  Created by Аня Беликова on 29.09.2023.
//

import SwiftUI

struct UserRowView: View {
    let user: User
    
    var body: some View {
        HStack {
            AvatarView(user: user, size: 64)
            Text(user.fullName)
        }
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(user: User.example)
    }
}
