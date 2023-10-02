//
//  UserDefaultView.swift
//  contactList_SUI
//
//  Created by Аня Беликова on 29.09.2023.
//

import SwiftUI

struct UserDetailsView: View {
    let user: User
    
    var body: some View {
        VStack(spacing: 16) {
            AvatarView(user: user, size: 240)
            Text(user.fullName)
                .font(.title2)
            Spacer()
        }
        .padding()
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView(user: User.example)
    }
}
