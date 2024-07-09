//
//  SearchBarView.swift
//  WB
//
//  Created by Дрозд Денис on 29.06.2024.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @State var isSearching = false
    
    var body: some View {
        HStack {
            if !searchText.isEmpty {
                Button(action: {
                    self.searchText = ""
                }) {
                    Image(systemName: "multiply.circle.fill")
                        .padding(.leading, 8)
                        .opacity(0.5)
                }
            } else {
                Image(systemName: "magnifyingglass")
                    .padding(.leading, 8)
                    .opacity(0.5)
            }
            TextField("Search", text: $searchText)
                .frame(width: 327, height: 36)
        }
        .background(Color("searchBarBackground"))
        .cornerRadius(4)
        .padding(.horizontal)
        .onTapGesture {
            isSearching = true
        }
    }
}
