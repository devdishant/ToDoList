//
//  User.swift
//  ToDoList
//
//  Created by DishantPatel on 03/02/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
