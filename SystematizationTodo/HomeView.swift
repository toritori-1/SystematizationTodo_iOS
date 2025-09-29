//
//  ContentView.swift
//  SystematizationTodo
//
//  Created by shoma mentori on 2025/09/28.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = TodoViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("今日も一歩前進！")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.orange)
                    .padding(.top)
                
                List {
                    ForEach(viewModel.items) { item in
                        HStack {
                            Button(action: {
                                viewModel.toggleCompletion(for: item)
                            }) {
                                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isCompleted ? .orange : .gray)
                            }
                            
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .strikethrough(item.isCompleted)
                                    .foregroundColor(item.isCompleted ? .gray : .primary)
                                if let tag = item.emotionTag {
                                    Text("感情タグ: \(tag)")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                        .padding(.vertical, 4)
                    }
                    .onDelete(perform: viewModel.deleteItem)
                }
                .listStyle(.plain)
                
                Spacer()
                
                Button(action: {
                    viewModel.showAddSheet = true
                }) {
                    Text("+ 新しいタスク")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(radius: 3)
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .sheet(isPresented: $viewModel.showAddSheet) {
                AddTaskView(viewModel: viewModel)
            }
            .padding()
            .background(Color(.systemGroupedBackground))
            .navigationTitle("systematization todo")
            .onAppear {
                viewModel.loadItems()
            }
        }
    }
}
