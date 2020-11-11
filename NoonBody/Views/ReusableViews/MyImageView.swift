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
    @EnvironmentObject var choosedContent1: ChoosedContent1
    @EnvironmentObject var choosedContent2: ChoosedContent2
    
    @State var myColor: String = "primaryBlack"
    @State var isChoosed: Bool = true

    var passed_myDate: String
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
                    
                    if choosedCount.count == 1{
                        self.choosedContent1.date1 = passed_myDate
                        self.choosedContent1.image1 = passed_myImage
                        self.choosedContent1.weight1 = passed_myWeight
                        self.choosedContent1.muscle1 = passed_myMuscle
                        self.choosedContent1.fat1 = passed_myFat
                        
                        print("date1 = \(choosedContent1.date1)")
                        print("image1 = \(choosedContent1.image1)")
                        print("weight1 = \(choosedContent1.weight1)")
                        print("muscle1 = \(choosedContent1.muscle1)")
                        print("fat1 = \(choosedContent1.fat1)")
                    }else if choosedCount.count == 2{
                        self.choosedContent2.date2 = passed_myDate
                        self.choosedContent2.image2 = passed_myImage
                        self.choosedContent2.weight2 = passed_myWeight
                        self.choosedContent2.muscle2 = passed_myMuscle
                        self.choosedContent2.fat2 = passed_myFat
                        
                        print("date2 = \(choosedContent2.date2)")
                        print("image2 = \(choosedContent2.image2)")
                        print("weight2 = \(choosedContent2.weight2)")
                        print("weight2 = \(choosedContent2.muscle2)")
                        print("fat2 = \(choosedContent2.fat2)")
                    }
                    
                }
                
            }else{
                if choosedCount.count > 0{
                    self.isChoosed.toggle()
                    self.choosedCount.count -= 1
                    self.myColor = "primaryBlack"
                    
                    if self.choosedContent1.image1 == passed_myImage{
                        self.choosedContent1.date1 = ""
                        self.choosedContent1.image1 = ""
                        self.choosedContent1.weight1 = 0
                        self.choosedContent1.muscle1 = 0
                        self.choosedContent1.fat1 = 0
                        
                        print("date1 = \(choosedContent1.date1)")
                        print("image1 = \(choosedContent1.image1)")
                        print("weight1 = \(choosedContent1.weight1)")
                        print("muscle1 = \(choosedContent1.muscle1)")
                        print("fat1 = \(choosedContent1.fat1)")
                    }else{
                        self.choosedContent2.date2 = ""
                        self.choosedContent2.image2 = ""
                        self.choosedContent2.weight2 = 0
                        self.choosedContent2.muscle2 = 0
                        self.choosedContent2.fat2 = 0
                        
                        print("date2 = \(choosedContent2.date2)")
                        print("image2 = \(choosedContent2.image2)")
                        print("weight2 = \(choosedContent2.weight2)")
                        print("weight2 = \(choosedContent2.muscle2)")
                        print("fat2 = \(choosedContent2.fat2)")
                    }
                    
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
