//
//  MyImageView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/20.
//

import SwiftUI
import SDWebImageSwiftUI


struct MyImageView: View {
    
    @EnvironmentObject var choosedCount: ChoosedCount
    
    @State var myColor: String = "primaryBlack"
//    @State var isChoosed: Bool = false
    @State var isChoosed1: Bool = false
    @State var isChoosed2: Bool = false
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
                    .foregroundColor(Color(myColor))
                    .overlay(Rectangle().stroke(Color(myColor), lineWidth:3))
                
                Text("\(passed_myWeight, specifier: "%.2f")kg")
                    .foregroundColor(.white)
            }
            
        }.onTapGesture(count: 1, perform: {
            
//           self.isChoosed.toggle()
//
//           if isChoosed{
//               self.choosedCount.count += 1
//               self.myColor = "primaryOrange"
//           }else{
//               self.choosedCount.count -= 1
//               self.myColor = "primaryBlack"
            
            if isChoosed1 == false && isChoosed2 == false{
                self.isChoosed1.toggle()
                
                if isChoosed1{
                    self.choosedCount.count += 1
                    self.myColor = "primaryOrange"
                }else{
                    self.choosedCount.count -= 1
                    self.myColor = "primaryBlack"
                }
            }else if isChoosed1 == true && isChoosed2 == false{
                self.isChoosed2.toggle()
                
                if isChoosed2{
                    self.choosedCount.count += 1
                    self.myColor = "primaryOrange"
                }else{
                    self.choosedCount.count -= 1
                    self.myColor = "primaryBlack"
                }
            }
            print("\(choosedCount.count)")
        })
        
        
    }
}

struct MyImageView_Previews: PreviewProvider {
    static var previews: some View {
        MyImageView(passed_myImage: "", passed_myWeight: 60)
    }
}
