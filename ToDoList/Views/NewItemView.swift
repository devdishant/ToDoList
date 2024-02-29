//
//  NewItemView.swift
//  ToDoList
//
//  Created by DishantPatel on 03/02/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 20)
                
            Form {
                //Title
                TextField("Title", text: $viewModel.title)
                
                //DueDate
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(.graphical)
                
                TLButton(buttonTitle: "Save", backgroundColor: .pink, labelColor: .white, cornerRadius: 10) {
                    //TODO: Save Item
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                    
                }.padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),
                      message: Text("Please fill in all fields and select due date that is today or newer."))
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
