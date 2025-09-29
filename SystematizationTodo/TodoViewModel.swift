//
//  TodoViewModel.swift
//  SystematizationTodo
//
//  Created by shoma mentori on 2025/09/28.
//

import Foundation
import SwiftUI
import Combine

// ViewModel for managing todo items
class TodoViewModel: ObservableObject {
    @Published var items: [TodoItem] = []
    @Published var showAddSheet = false
    
    // add todo items
    func addItem(title: String, category: String, emotionTag: String?) {
        let newItem = TodoItem(
            title: title,
            category: category,
            emotionTag: emotionTag
        )
        items.append(newItem)
        saveItems()
        showAddSheet = false
    }
    
    // delete todo items
    func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
        saveItems()
    }
    
    // turn completion
    func toggleCompletion(for item: TodoItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isCompleted.toggle()
            saveItems()
        }
    }
    
    // save todo items
    func saveItems() {
        do {
            let data = try JSONEncoder().encode(items)
            UserDefaults.standard.set(data, forKey: "todoItems")
        } catch {
            print("unable saving items: \(error)")
        }
    }
    
    // load todo items
    func loadItems() {
        if let data = UserDefaults.standard.data(forKey: "todoItems") {
            do {
                items = try JSONDecoder().decode([TodoItem].self, from: data)
            } catch {
                print("unable loading items: \(error)")
            }
        }
    }
}
