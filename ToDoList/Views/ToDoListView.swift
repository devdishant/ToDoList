//
//  ToDoListView.swift
//  ToDoList
//
//  Created by DishantPatel on 03/02/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button(action: {
                    viewModel.showingNewIteamView = true
                    
                }, label: {
                    Image(systemName: "plus")
                })
            }
            .sheet(isPresented: $viewModel.showingNewIteamView, content: {
                NewItemView(newItemPresented: $viewModel.showingNewIteamView)
            })
        }
    }
}

#Preview {
    ToDoListView(userId: "ELX7XjYiJoS1vHEWkAlqO0OUaB63")
}
