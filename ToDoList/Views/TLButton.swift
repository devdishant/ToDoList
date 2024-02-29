//
//  TLButton.swift
//  ToDoList
//
//  Created by DishantPatel on 03/02/24.
//

import SwiftUI

struct TLButton: View {
    let buttonTitle: String
    let backgroundColor: Color
    let labelColor: Color
    let cornerRadius: CGFloat
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        },
               label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                Text(buttonTitle)
                    .foregroundStyle(labelColor)
                    .bold()
            }
        })
    }
}

#Preview {
    TLButton(buttonTitle: "Title",
             backgroundColor: .blue,
             labelColor: .white,
             cornerRadius: 10){
        
    }
}
