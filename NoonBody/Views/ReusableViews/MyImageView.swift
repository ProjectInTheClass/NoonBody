//
//  MyImageView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/20.
//

import SwiftUI

struct MyImageView: View {
    
    @State var isChoosed: Bool = false
    var passed_myImage: Image
    var passed_myWeight: Double
    
    var body: some View {
        
        VStack (spacing:0){
            
            passed_myImage
                .resizable()
                .frame(width: 170, height: 200, alignment: .trailing)
                .overlay(Rectangle().stroke(Color.black, lineWidth:3))
            
            ZStack{
                Rectangle()
                    .frame(width: 170, height: 50)
                    .overlay(Rectangle().stroke(Color.black, lineWidth:3))
                
                Text("\(passed_myWeight, specifier: "%.2f")kg")
                    .foregroundColor(.white)
            }
            
        }
        
        
    }
}

struct MyImageView_Previews: PreviewProvider {
    static var previews: some View {
        MyImageView(passed_myImage: Image("body3"), passed_myWeight: 60)
    }
}
