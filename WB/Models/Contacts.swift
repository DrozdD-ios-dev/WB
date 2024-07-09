//
//  Contacts.swift
//  WB
//
//  Created by Дрозд Денис on 29.06.2024.
//

import Foundation

struct Contact: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let isStorying: Bool
    let isOnline: Bool
    let lastSeen: Date?
    let avatar: String?
    let phoneNumber: String
}
