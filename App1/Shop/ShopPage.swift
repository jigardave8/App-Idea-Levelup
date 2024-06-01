//
//  ShopPage.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

// ShopPage.swift
import SwiftUI

struct ShopPage: View {
    @State private var searchText = ""
    @State private var sortOption = SortOption.name
    @State private var isShowingCart = false
    @EnvironmentObject var cart: Cart

    enum SortOption {
        case name, recent, popularity, value
    }

    var sortedItems: [Item] {
        let filteredItems = ShopData.items.filter {
            searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText)
        }
        switch sortOption {
        case .name:
            return filteredItems.sorted { $0.name < $1.name }
        case .recent:
            return filteredItems.sorted { $0.dateAdded > $1.dateAdded }
        case .popularity:
            return filteredItems.sorted { $0.popularity > $1.popularity }
        case .value:
            return filteredItems.sorted { $0.price < $1.price }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Search", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Picker("Sort by", selection: $sortOption) {
                        Text("Name").tag(SortOption.name)
                        Text("Recent").tag(SortOption.recent)
                        Text("Popularity").tag(SortOption.popularity)
                        Text("Value").tag(SortOption.value)
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                .padding()
                
                List(sortedItems) { item in
                    NavigationLink(destination: ItemDetailView(item: item)) {
                        ItemRowView(item: item)
                    }
                }
                .navigationTitle("Shop")
                .navigationBarItems(trailing: Button(action: {
                    isShowingCart.toggle()
                }) {
                    Image(systemName: "cart.fill")
                    Text("\(cart.items.count)")
                })
                .sheet(isPresented: $isShowingCart) {
                    CartView()
                        .environmentObject(cart)
                }
            }
        }
    }
}
