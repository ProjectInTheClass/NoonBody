//
//  MyImageView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyImageView: View {
    @State var myColor: String = "primaryGray"
    @State var isChoosed: Bool = false
    @State var choosedCount: Int = 0
    var passed_myImage: String
    var passed_myWeight: Double
    
    var body: some View {
        
        VStack (spacing:0){
            
            //URI로 이미지 보여주도록 수정
            AnimatedImage(url: URL(string: passed_myImage)!)
                .resizable()
                .frame(width: 170, height: 200, alignment: .trailing)
                .overlay(Rectangle().stroke(Color(myColor), lineWidth:3))
            
            ZStack{
                Rectangle()
                    .frame(width: 170, height: 50)
                    .overlay(Rectangle().stroke(Color(myColor), lineWidth:3))
                
                Text("\(passed_myWeight, specifier: "%.2f")kg")
                    .foregroundColor(.white)
            }
            
        }.onTapGesture(count: 1, perform: {
            self.isChoosed.toggle()
            
            if isChoosed{
                self.choosedCount += 1
                self.myColor = "primaryOrange"
            }else{
                self.choosedCount -= 1
                self.myColor = "primaryGray"
            }
        })
        
        
    }
}

struct MyImageView_Previews: PreviewProvider {
    static var previews: some View {
        MyImageView(passed_myImage: "", passed_myWeight: 60)
    }
}
