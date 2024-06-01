//
//  ProgramGridView.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

// ProgramGridView.swift

import SwiftUI

struct ProgramGridView: View {
    let program: Task
    
    var body: some View {
        VStack {
            Text(program.title)
                .font(.headline)
            Text("Type: \(program.type), Points: \(program.points)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            NavigationLink(destination: ProgramDetailsView(program: program)) {
                Text("View Details")
                    .foregroundColor(.blue)
                    .font(.subheadline)
                    .padding(.top, 10)
            }
        }
        .padding()
        .background(Color(UIColor.systemGray6))
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}
