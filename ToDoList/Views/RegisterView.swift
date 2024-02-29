//
//  RegisterView.swift
//  ToDoList
//
//  Created by DishantPatel on 03/02/24.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
   
    var body: some View {
        VStack {
            HeaderView(headerTitle: "Register",
                       subTitle: "Start Organizing todos",
                       angle: -10,
                       backgroundColor: .orange,
                       padding: 20)
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(.automatic)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(.automatic)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(.automatic)
                TLButton(buttonTitle: "Register",
                         backgroundColor: .green,
                         labelColor: .white,
                         cornerRadius: 10
                ) {
                    viewModel.register()
                }.padding()
            }
            .offset(y: -50)
            
        }
        Spacer()
    }
}

#Preview {
    RegisterView()
}
