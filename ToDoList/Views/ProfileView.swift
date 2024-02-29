//
//  ProfileView.swift
//  ToDoList
//
//  Created by DishantPatel on 03/02/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    
                    profile(user: user)
                    
                } else {
                    Text("Loading Profile...")
                }
                
            }.navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        //Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(.blue)
            .frame(width: 125, height: 125)

        //Info" Name, email, phone, membersince
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }.padding()
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }.padding()
            HStack {
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }.padding()
        }
        .padding()
        //Log out
        
        Button(action: {
            viewModel.logOut()
        }, label: {
            Text("Log out")
                .font(.system(size: 20))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                
        })
        .background(.red)
        .cornerRadius(10)
        .controlSize(.regular)
        .padding(10)
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}

