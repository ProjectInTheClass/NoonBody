//
//  DiaryPostView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DiaryPostView: View {
    
    var passed_diaryDate: String
    var passed_diaryFull: String
    var passed_diaryShare: String
    var passed_diaryWeight: Double
    var passed_diaryMuscle: Double
    var passed_diaryFat: Double
    var passed_diaryImage: String
    
    var body: some View {
        VStack{
            Text("\(passed_diaryDate)")
                
            //URI로 이미지 보여주도록 수정
            AnimatedImage(url: URL(string: passed_diaryImage)!)
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: 300, alignment: .trailing)
                .padding(.leading)
                .padding(.trailing)
            
            HStack{
                Text("\(passed_diaryFull)")
                    .frame(width: 50, height: 30)
                    .background(Color.white)
                Text("\(passed_diaryShare)")
                    .frame(width: 50, height: 30)
                    .background(Color.white)
                Spacer()
            }.padding()
            
            
            Divider()
            
            VStack(alignment: .leading){
                HStack{
                    Text("몸무게")
                    Spacer()
                    Text("\(passed_diaryWeight, specifier: "%.2f")kg")
//                        TextField("0.00kg", text: $weight)
//                            .frame(width: 70)
                }
                
                Divider()
                
                HStack{
                    Text("골격근량")
                    Spacer()
                    Text("\(passed_diaryMuscle, specifier: "%.2f")kg")
//                        TextField("0.00kg", text: $muscle)
//                            .frame(width: 70)
                }
                
                Divider()
                
                HStack{
                    Text("체지방량")
                    Spacer()
                    Text("\(passed_diaryFat, specifier: "%.2f")kg")
//                        TextField("0.00kg", text: $fat)
//                            .frame(width: 70)
                }
                
            }.padding(.leading)
            .padding(.trailing)
            
            Divider()
            
        }.frame(width: UIScreen.main.bounds.size.width, height: .infinity)
    }
}

struct DiaryPostView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        DiaryPostView(passed_diaryDate: getDate(num: 0), passed_diaryFull: "공복", passed_diaryShare: "공개", passed_diaryWeight: 62.4, passed_diaryMuscle: 25.1, passed_diaryFat: 23, passed_diaryImage: "https://firebasestorage.googleapis.com/v0/b/noonbody-9af0d.appspot.com/o/NoonbodyWriteImages%2F66D155D9-1338-4A6B-A4AE-B30E449D8F44%2F2020.%2010.%2028.?alt=media&token=c57c94e5-d8f2-4048-b048-8d261866f595")
    }
}


