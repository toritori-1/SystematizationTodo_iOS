//
//  AddTaskView.swift
//  SystematizationTodo
//
//  Created by shoma mentori on 2025/09/28.
//

import SwiftUI

struct AddTaskView: View {
    @ObservedObject var viewModel: TodoViewModel
    
    @State private var title = ""
    @State private var category = "習慣"
    @State private var emotionTag = "ワクワク"
    @State private var dueDate = Date()
    
    let categories = ["習慣", "学習", "体験", "仕事", "その他"]
    let emotionTags = ["ワクワク", "安心", "挑戦", "落ち着き"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("タスク内容")) {
                    TextField("タイトルを入力", text: $title)
                }
                
                Section(header: Text("カテゴリ")) {
                    Picker("カテゴリ", selection: $category) {
                        ForEach(categories, id: \.self) { Text($0) }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section(header: Text("感情タグ")) {
                    Picker("感情", selection: $emotionTag) {
                        ForEach(emotionTags, id: \.self) { Text($0) }
                    }
                }
                
                Section(header: Text("期限（任意）")) {
                    DatePicker("期限", selection: $dueDate, displayedComponents: .date)
                }
                
                Button(action: {
                    viewModel.addItem(title: title, category: category, emotionTag: emotionTag)
                }) {
                    Text("保存する")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .listRowBackground(Color.clear)
            }
            .navigationTitle("新しいタスク")
        }
    }
}
