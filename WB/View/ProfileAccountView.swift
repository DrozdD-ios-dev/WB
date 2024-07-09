//
//  ProfileAccountView.swift
//  WB
//
//  Created by Дрозд Денис on 09.07.2024.
//

//
//  ProfileAccountView.swift
//  WBChatAppSUI
//
//  Created by Daria on 10.06.2024.
//

import SwiftUI

struct ProfileAccountView: View {
    @Environment(\.dismiss) var dismiss
    var contact: Contact
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.white)
                        .ignoresSafeArea()
                    VStack {
                        Spacer()
                        ProfileImageView(avatar: contact.avatar)
                            .padding(20)
                        VStack {
                            Text(contact.name)
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(Color("purpleDark"))
                            Text(contact.phoneNumber)
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Color("grayForText"))
                        }
                        
                        HStack(spacing: 12) {
                            ButtonMedia(label: "twitter")
                            ButtonMedia(label: "instagram")
                            ButtonMedia(label: "LinkedIn")
                            ButtonMedia(label: "facebook")
                        }
                        .padding(.top, 30)
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                }
            
            .navigationBarBackButtonHidden()
//            .foregroundColor(Resources.Colors.NeutralColor.active)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack(spacing: 8) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("purpleDark"))
                        }
                        
                        Text("Профиль")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(Color("purpleDark"))
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //
                    } label: {
                        Image(systemName: "pencil")
                            .foregroundColor(Color("purpleDark"))
                    }
                }
            }
        }
    }
}


#Preview {
    ProfileAccountView(contact: Contact(name: "Анна Иванова", isStorying: true, isOnline: true, lastSeen: Date.now, avatar: nil, phoneNumber: "+7 999 999-99-99"))
}



struct ButtonMedia: View {
    let label: String
    var body: some View {
        Button {
            //do someting
        } label: {
            ZStack {
                Image(label)
                    .foregroundStyle(.red)
                    .padding(.horizontal, 25)
                    .padding(.vertical, 10)
                    .clipShape(Capsule())
                    .overlay(
                        Capsule().stroke(Color("purpleCustom"), lineWidth: 1)
                    )
            }
        }
    }
}

struct ProfileImageView: View {
    let avatar: String?
    
    var body: some View {
        Group {
            if let avatar = avatar {
                Image(avatar)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
            } else {
                Image("Change Avatar")
                    .resizable()
                    .frame(width: 200, height: 200)
            }
        }
    }
}
