//
//  HeaderView.swift
//  ToDoList
//
//  Created by DishantPatel on 03/02/24.
//

import SwiftUI

struct HeaderView: View {
    
    let headerTitle: String
    let subTitle: String
    let angle: Double
    let backgroundColor: Color
    let padding: CGFloat
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundColor)
                .rotationEffect(Angle(degrees: angle))
            
            VStack{
                Text(headerTitle)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
                Text(subTitle)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
        }.padding(.top, padding)
        .frame(width: UIScreen.main.bounds.width * 3,
                height: 350)
        .offset(y: -150)

    }
}

#Preview {
    HeaderView(headerTitle: "Title", 
               subTitle: "SubTitle",
               angle: 15,
               backgroundColor: .blue, 
               padding: 30)
}
