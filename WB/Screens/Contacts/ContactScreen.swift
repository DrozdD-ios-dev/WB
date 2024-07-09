//
//  ContactScreen.swift
//  WB
//
//  Created by Дрозд Денис on 29.06.2024.
//

import SwiftUI

struct ContactScreen: View {
    
    @State private var contacts: [Contact] = [
    Contact(name: "Анастасия Иванова", isStorying: false, isOnline: false, lastSeen: Date(timeIntervalSinceNow: -86400), avatar: "Alina", phoneNumber: "+7 990 123-22-99"),
    Contact(name: "Петя", isStorying: false, isOnline: true, lastSeen: nil, avatar: "petr", phoneNumber: "+7 999 999-99-90"),
    Contact(name: "Маман", isStorying: true, isOnline: false, lastSeen: Date(timeIntervalSinceNow: -10800), avatar: "mum", phoneNumber: "+7 999 999-99-98"),
    Contact(name: "Арбуз Дыня", isStorying: false, isOnline: true, lastSeen: nil, avatar: "watermelon", phoneNumber: "+7 999 999-99-96"),
    Contact(name: "Иван Иванов", isStorying: false, isOnline: true, lastSeen: nil, avatar: nil, phoneNumber: "+7 999 999-99-94"),
    Contact(name: "Лиса Алиса", isStorying: true, isOnline: false, lastSeen: Date(timeIntervalSinceNow: -1800), avatar: nil, phoneNumber: "+7 999 999-99-93")
    ]
    
    @State private var searchText: String = ""
    @State private var selectedContact: Contact? = nil
    @State private var navigateToProfile: Bool = false
    
    var filteredContacts: [Contact] {
        if searchText.isEmpty {
            return contacts
        } else {
            return contacts.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                VStack {
                    SearchBarView(searchText: $searchText)
                        .padding(.top, 16)
                    List(filteredContacts) { contact in
                        ContactRow(contact: contact)
                            .onTapGesture {
                                selectedContact = contact
                                navigateToProfile.toggle()
                            }
                    }
                }
                .listStyle(.plain)
            }
            .foregroundColor(Color("purpleDark"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Контакты")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color("purpleDark"))
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //
                    } label: {
                        Image(systemName: "plus")
                            .tint(Color("purpleDark"))
                    }
                }
            }
            .navigationDestination(isPresented: $navigateToProfile) {
                if let contact = selectedContact {
                    ProfileAccountView(contact: contact)
                }
            }
        }
    }
}

#Preview {
    ContactScreen()
}
