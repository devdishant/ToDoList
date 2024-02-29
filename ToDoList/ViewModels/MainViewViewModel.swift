//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by DishantPatel on 03/02/24.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject {
    @Published var currentuerId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener {[weak self] _, user in
            DispatchQueue.main.async {
                self?.currentuerId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil

    }
}
