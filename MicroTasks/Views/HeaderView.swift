//
//  HeaderView.swift
//  MicroTasks
//
//  Created by Sanskar Pal on 7/13/23.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(.degrees(angle))
                
                
            VStack{
                Text(title)
                    .font(.system(size: 60))
                    .foregroundColor(.white)
                    .bold()
                    
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width*3, height: 350)
        .offset(y:-150)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, background: .blue)
    }
}
