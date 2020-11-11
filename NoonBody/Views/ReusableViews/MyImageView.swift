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
    @State var isChoosed: Bool = true

    var passed_myImage: String
    var passed_myWeight: Double
    var passed_myMuscle: Double
    var passed_myFat: Double
    
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
            
            print("\(choosedCount.count)")
            
            if isChoosed{
                if choosedCount.count < 2{
                    self.isChoosed.toggle()
                    self.choosedCount.count += 1
                    self.myColor = "primaryOrange"
                    print("\(passed_myMuscle)")
                    print("\(passed_myFat)")
                }
                
            }else{
                if choosedCount.count > 0{
                    self.isChoosed.toggle()
                    self.choosedCount.count -= 1
                    self.myColor = "primaryBlack"
                }
            }
            
            print("\(choosedCount.count)")
            
        })
        
        
    }
}

//struct MyImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyImageView(passed_myImage: "", passed_myWeight: 60)
//    }
//}
