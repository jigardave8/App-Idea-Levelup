//
//  ItemRowView.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

// ItemRowView.swift
import SwiftUI

struct ItemRowView: View {
    var item: Item

    var body: some View {
        HStack {
            Image(item.imageName)
                .resizable()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(String(format: "$%.2f", item.price))
                    .font(.subheadline)
            }
            Spacer()
        }
    }
}
