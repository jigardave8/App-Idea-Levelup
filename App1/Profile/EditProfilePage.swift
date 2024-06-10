//
//  EditProfilePage.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

import SwiftUI

struct EditProfilePage: View {
    @State private var profileData = ProfileData(name: "Jay", email: "jay@example.com", skills: [
        Skill(name: "Programming", level: 5),
        Skill(name: "Design", level: 3),
        Skill(name: "Communication", level: 4)
    ])
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Display profile information
                VStack(alignment: .leading, spacing: 8) {
                    Text("Name: \(profileData.name)")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Email: \(profileData.email)")
                        .font(.body)
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                
                // Display skills
                VStack(alignment: .leading, spacing: 8) {
                    Text("Skills:")
                        .font(.headline)
                    ForEach(profileData.skills) { skill in
                        HStack {
                            Text(skill.name)
                            Spacer()
                            Text("Level \(skill.level)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                
                Spacer()
                
                // Save button
                Button(action: {
                    // Save profile changes (dummy action for now)
                    print("Profile changes saved")
                }) {
                    Text("Save Changes")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
            .padding()
            .navigationTitle("Edit Profile")
        }
    }
}

struct EditProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        EditProfilePage()
    }
}
