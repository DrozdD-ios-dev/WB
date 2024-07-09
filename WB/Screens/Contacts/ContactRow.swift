//
//  ContactRow.swift
//  WB
//
//  Created by Дрозд Денис on 29.06.2024.
//

import SwiftUI

struct ContactRow: View {
    var contact: Contact
    
    var body: some View {
        HStack(alignment: .center) {
            AvatarView(avatar: contact.avatar, name: contact.name, isOnline: contact.isOnline, hasHistory: contact.isStorying)
                .padding(.trailing, 12)
            
            VStack(spacing: 2) {
                Text(contact.name)
                    .foregroundStyle(Color("purpleDark"))
                    .font(.system(size: 14, weight: .semibold))
                    .frame(width: 259, height: 24, alignment: .leading)
                
                Text(contact.isOnline ? "Online" : "Last seen \(timeManager(since: contact.lastSeen ?? Date.now))")
                    .foregroundStyle(Color("grayForText"))
                    .font(.system(size: 12, weight: .regular))
                    .frame(width: 259,height: 20, alignment: .leading)
            }
        }
        .contentShape(Rectangle())
        .padding(.leading, 4)
        .frame(width: 327, height: 68)
    }
    
    func timeManager(since date: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.dateTimeStyle = .named
        return formatter.localizedString(for: date, relativeTo: Date())
    }
}

#Preview {
    ContactRow(contact: Contact(name: "Анастасия Иванова", isStorying: true, isOnline: true, lastSeen: Date(timeIntervalSinceNow: -86400), avatar: "Alina", phoneNumber: "+7 990 123-22-99"))
}
