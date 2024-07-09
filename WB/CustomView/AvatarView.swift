//
//  AvatarView.swift
//  WB
//
//  Created by Дрозд Денис on 29.06.2024.
//

import SwiftUI

struct AvatarView: View {
    var avatar: String?
    var name: String
    var isOnline: Bool
    var hasHistory: Bool
    
    var body: some View {
        ZStack(alignment: .center) {
            if avatar != nil {
                Image(avatar ?? "")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 48, height: 48)
                    .cornerRadius(16)
                    .padding(8)
            } else {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("purpleCustom"))
                        .frame(width: 48, height: 48)
                        .cornerRadius(16)
                    
                    Text(initials(name: name))
                        .foregroundStyle(.white)
                }
            }
            
            if hasHistory {
                RoundedRectangle(cornerRadius: 18)
                    .stroke(LinearGradient(colors: [.purple, .red], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
                    .frame(width: 56, height: 56)
            }
            
            if isOnline {
                Circle()
                    .fill(Color.green)
                    .frame(width: 12, height: 12)
                    .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 2))
                    .offset(x: 20, y: -23)
            }
        }
    }
    
    func initials(name: String) -> String {
        let words = name.split(separator: " ")
        guard words.count > 0 else {
            return ""
        }
        let firstNameInitial = words.first?.first?.uppercased() ?? ""
        let lastNameInitial = words.dropFirst().first?.first?.uppercased() ?? ""
        if words.count == 1 {
            return firstNameInitial
        }
        return firstNameInitial + lastNameInitial
    }
}

#Preview {
    AvatarView(name: "Анна Иванова", isOnline: true, hasHistory: true)
}
