//
//  ShareView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/12.
//

import SwiftUI

struct DiaryView: View {
    @State var date = Date()
    
    var body: some View {
            
        ScrollView {
            VStack{
                Text(getDate(num: 0))
                    
                Image("body2")
                    .resizable()
                    .frame(width: .infinity, height: 300, alignment: .trailing)
                    .padding(.leading)
                    .padding(.trailing)
                
                HStack{
                    Text("공복")
                        .frame(width: 50, height: 30)
                        .background(Color.white)
                    Text("공개")
                        .frame(width: 50, height: 30)
                        .background(Color.white)
                    Spacer()
                }.padding()
                
                
                Divider()
                
                VStack(alignment: .leading){
                    HStack{
                        Text("몸무게")
                        Spacer()
                        Text("0.00kg")
//                        TextField("0.00kg", text: $weight)
//                            .frame(width: 70)
                    }
                    
                    Divider()
                    
                    HStack{
                        Text("골격근량")
                        Spacer()
                        Text("0.00kg")
//                        TextField("0.00kg", text: $muscle)
//                            .frame(width: 70)
                    }
                    
                    Divider()
                    
                    HStack{
                        Text("체지방량")
                        Spacer()
                        Text("0.00kg")
//                        TextField("0.00kg", text: $fat)
//                            .frame(width: 70)
                    }
                    
                }.padding(.leading)
                .padding(.trailing)
                
                Divider()
                
            }
        }
            
        }
        
    }

//func getDate(num:Int)->String{
//     let time = Date()
//     let timeFormatter = DateFormatter()
//     timeFormatter.dateFormat = "YYYY.MM.DD"
//    timeFormatter.dateStyle = .medium
//    timeFormatter.locale = Locale(identifier: "Ko_KR")
//     let stringDate = timeFormatter.string(from: time)
//     return stringDate
//    }




struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}


