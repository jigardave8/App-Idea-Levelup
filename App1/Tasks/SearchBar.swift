//
//  SearchBar.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

import SwiftUI

// SearchBar.swift

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Search", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
        }
    }
}
