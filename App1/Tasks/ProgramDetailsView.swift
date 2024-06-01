//
//  ProgramDetailsView.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

// ProgramDetailsView.swift

import SwiftUI
struct ProgramDetailsView: View {
    let program: Task
    
    var body: some View {
        VStack {
            Text(program.title)
                .font(.title)
            Text(program.description)
                .font(.body)
                .padding()
            // Add more details if needed
            Spacer()
        }
        .navigationTitle("Program Details")
    }
}
