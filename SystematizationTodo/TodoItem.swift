//
//  TodoItem.swift
//  SystematizationTodo
//
//  Created by shoma mentori on 2025/09/28.
//

import Foundation

// data madel for a todo item
struct TodoItem: Identifiable, Codable {
    let id: UUID
    var title: String
    var isCompleted: Bool
    var dueDate: Date?
    var category: String
    var emotionTag: String?
    var createdAt: Date
    
    init(
        id: UUID = UUID(),
        title: String,
        isCompleted: Bool = false,
        dueDate: Date? = nil,
        category: String,
        emotionTag: String? = nil,
        createdAt: Date = Date()
    ) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.dueDate = dueDate
        self.category = category
        self.emotionTag = emotionTag
        self.createdAt = createdAt
    }
}
