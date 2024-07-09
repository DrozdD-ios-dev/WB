//
//  ContentView_TabView.swift
//  WB
//
//  Created by Дрозд Денис on 29.06.2024.
//

import SwiftUI

enum Tabs {
    case contacts
    case chats
    case more
}

final class Router: ObservableObject {
    @Published var selectedTab: Tabs = .contacts
}

struct ContentView_TabView: View {
    @ObservedObject var router: Router = .init()
    
    var body: some View {
        TabView(selection: $router.selectedTab) {
            ContactScreen().tabItem { Label("Контакты", systemImage: Resources.TabImages.contacts) }.tag(Tabs.contacts)
            ChatScreen().tabItem { Label("Чаты", systemImage: Resources.TabImages.chats) }.tag(Tabs.chats)
            MoreScreen().tabItem { Label("Еще", systemImage:
                                            Resources.TabImages.more) }.tag(Tabs.more)
        }
    }
}

#Preview {
    ContentView_TabView()
}
