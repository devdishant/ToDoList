//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by DishantPatel on 03/02/24.
//

import Foundation
import FirebaseFirestore

/// View model for List of itmes view
/// Primaray tab
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewIteamView = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    /// Delete to do list item
    /// - Parameter id: item id to delete
    func delete(id: String) {
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
