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
                CustomSearchBar(text: $searchText)
                    .padding()
                
                Picker("Sort by", selection: $sortOption) {
                    Text("Name").tag(SortOption.name)
                    Text("Recent").tag(SortOption.recent)
                    Text("Popularity").tag(SortOption.popularity)
                    Text("Value").tag(SortOption.value)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(sortedItems) { item in
                            NavigationLink(destination: ItemDetailView(item: item)) {
                                ItemRowView(item: item)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(15)
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .navigationTitle("Shop")
                .navigationBarItems(trailing: Button(action: {
                    isShowingCart.toggle()
                }) {
                    HStack {
                        Image(systemName: "cart.fill")
                            .foregroundColor(.blue)
                            .imageScale(.small)
                        Text("\(cart.items.count)")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                    .padding()
                    .background(Color.green)
                    .clipShape(Rectangle())
                    .shadow(radius: 4)
                })
                .sheet(isPresented: $isShowingCart) {
                    CartView()
                        .environmentObject(cart)
                }
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
            )
        }
    }
}

struct CustomSearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(8)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if !text.isEmpty {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
        }
    }
}
