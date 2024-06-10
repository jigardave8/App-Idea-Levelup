//
//  Task.swift
//  App1
//
//  Created by Jigar on 10/06/24.
//

import Foundation

enum TaskType: String, Codable {
    case primary = "Primary"
    case secondary = "Secondary"
    case tertiary = "Tertiary"
}

enum TaskPriority: String, Codable {
    case high = "High"
    case medium = "Medium"
    case low = "Low"
}

class Task: Identifiable, ObservableObject, Codable {
    var id: UUID
    var title: String
    var description: String
    var type: TaskType
    var points: Int
    var dueDate: Date
    var priority: TaskPriority
    @Published var isCompleted: Bool

    var dueDateFormatted: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: dueDate)
    }

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case type
        case points
        case dueDate
        case priority
        case isCompleted
    }

    // Primary initializer
    init(id: UUID = UUID(), title: String, description: String, type: TaskType, points: Int, dueDate: Date, priority: TaskPriority, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.description = description
        self.type = type
        self.points = points
        self.dueDate = dueDate
        self.priority = priority
        self.isCompleted = isCompleted
    }

    // Required initializer for Decodable conformance
    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(UUID.self, forKey: .id)
        let title = try container.decode(String.self, forKey: .title)
        let description = try container.decode(String.self, forKey: .description)
        let type = try container.decode(TaskType.self, forKey: .type)
        let points = try container.decode(Int.self, forKey: .points)
        let dueDate = try container.decode(Date.self, forKey: .dueDate)
        let priority = try container.decode(TaskPriority.self, forKey: .priority)
        let isCompleted = try container.decode(Bool.self, forKey: .isCompleted)

        self.init(id: id, title: title, description: description, type: type, points: points, dueDate: dueDate, priority: priority, isCompleted: isCompleted)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(description, forKey: .description)
        try container.encode(type, forKey: .type)
        try container.encode(points, forKey: .points)
        try container.encode(dueDate, forKey: .dueDate)
        try container.encode(priority, forKey: .priority)
        try container.encode(isCompleted, forKey: .isCompleted)
    }
}
