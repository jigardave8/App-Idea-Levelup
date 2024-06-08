//
//  EditProfilePage.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

import SwiftUI

struct EditProfilePage: View {
    @State private var profileData = ProfileData(name: "John Doe", email: "john@example.com", skills: [
        Skill(name: "Programming", level: 5),
        Skill(name: "Design", level: 3),
        Skill(name: "Communication", level: 4)
    ])
    

    var body: some View {
        NavigationView {
            VStack {
                // Display profile information
                Text("Name: \(profileData.name)")
                Text("Email: \(profileData.email)")
                
                // Display skills
                Text("Skills:")
                    .font(.headline)
                ForEach(profileData.skills) { skill in
                    Text("\(skill.name): Level \(skill.level)")
                }
                
                Spacer()
            
                
                // Save button
                Button(action: {
                    // Save profile changes (dummy action for now)
                    print("Profile changes saved")
                }) {
                    Text("Save Changes")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle("Edit Profile")
        }
    }
}

struct EditProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        EditProfilePage()
    }
}
