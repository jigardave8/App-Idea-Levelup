//
//  TasksPage.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//



import SwiftUI

struct TasksPage: View {
    @State private var selectedTab: Tab = .primary
    
    enum Tab {
        case primary, secondary, browse
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                tabs
                
                Divider()
                
                contentView
            }
            .navigationBarTitle("Tasks")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private var tabs: some View {
        HStack {
            ForEach([Tab.primary, Tab.secondary, Tab.browse], id: \.self) { tab in
                Button(action: {
                    selectedTab = tab
                }) {
                    Text(tab.title)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(selectedTab == tab ? .blue : .gray)
                }
            }
        }
        .background(Color(.systemBackground))
        .padding(.bottom, 8)
    }
    
    private var contentView: some View {
        Group {
            switch selectedTab {
            case .primary:
                PrimaryTasksView()
            case .secondary:
                SecondaryTasksView()
            case .browse:
                BrowseCoursesView()
            }
        }
    }
}

extension TasksPage.Tab {
    var title: String {
        switch self {
        case .primary:
            return "Primary Tasks"
        case .secondary:
            return "Secondary Tasks"
        case .browse:
            return "Browse Courses"
        }
    }
}

struct TasksPage_Previews: PreviewProvider {
    static var previews: some View {
        TasksPage()
    }
}
