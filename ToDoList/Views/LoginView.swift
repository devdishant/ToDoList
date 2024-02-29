//
//  LoginView.swift
//  ToDoList
//
//  Created by DishantPatel on 03/02/24.
//

import SwiftUI

struct LoginView: View {

    @StateObject var viewModel = LoginViewViewModel()

    var body: some View {
        NavigationView {
        
            VStack {
                //Header
                HeaderView(headerTitle: "To Do List",
                           subTitle: "Get things done", 
                           angle: 15,
                           backgroundColor: .pink, 
                           padding: 30)
                //Login Form
                Form {
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(.automatic)
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(.automatic)
                    
                    TLButton(buttonTitle: "Log In",
                             backgroundColor: .blue,
                             labelColor: .white,
                             cornerRadius: 10){
                        //TODO: Login Action
                        viewModel.login()
                    }.padding()
                }
                .offset(y: -50)
                
                //Create Account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create an Account", destination: RegisterView())
                        .foregroundStyle(.blue)
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
