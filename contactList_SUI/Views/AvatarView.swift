//
//  AvatarView.swift
//  contactList_SUI
//
//  Created by Аня Беликова on 29.09.2023.
//

import SwiftUI

struct AvatarView: View {
    let user: User
    let size: CGFloat
    
    var body: some View {
        if user.avatar != nil {
            AsyncImage(url: user.avatar) {
                image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: size, height: size)
            .clipShape(Circle())
        } else {
            Image(systemName: "person.crop.circle")
                .resizable()
                .scaledToFit()
                .frame(width: size, height: size)
        }
    }
}


