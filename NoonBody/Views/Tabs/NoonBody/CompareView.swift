//
//  CompareView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct CompareView: View {
    
    @EnvironmentObject var choosedContent1: ChoosedContent1
    @EnvironmentObject var choosedContent2: ChoosedContent2
    
    var body: some View {
        VStack{
            HStack{
                    VStack{
                        Text("\(choosedContent1.date1)")
                            
                        AnimatedImage(url: URL(string: choosedContent1.image1))
                            .resizable()
                            .frame(width: 180, height: 300, alignment: .trailing)
                        
                    }
                    VStack{
                        Text("\(choosedContent2.date2)")
                            
                        AnimatedImage(url: URL(string: choosedContent2.image2))
                            .resizable()
                            .frame(width: 180, height: 300, alignment: .trailing)
                        
                    }
                      
            }
            
            VStack(alignment: .leading){
                HStack{
                    
                    Text("\(choosedContent1.weight1, specifier: "%.2f")kg")
                    Spacer()
                    Text("몸무게")
                    Spacer()
                    Text("\(choosedContent2.weight2, specifier: "%.2f")kg")
//                        TextField("0.00kg", text: $weight)
//                            .frame(width: 70)
                }
                
                Divider()
                
                HStack{
                    
                    Text("\(choosedContent1.muscle1, specifier: "%.2f")kg")
                    Spacer()
                    Text("골격근량")
                    Spacer()
                    Text("\(choosedContent2.muscle2, specifier: "%.2f")kg")
//                        TextField("0.00kg", text: $muscle)
//                            .frame(width: 70)
                }
                
                Divider()
                
                HStack{
                    Text("\(choosedContent1.fat1, specifier: "%.2f")kg")
                    Spacer()
                    Text("체지방량")
                    Spacer()
                    Text("\(choosedContent2.fat2, specifier: "%.2f")kg")
//                        TextField("0.00kg", text: $fat)
//                            .frame(width: 70)
                }
                
            }.padding(.leading)
            .padding(.trailing)
            
            Divider()
            
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color("secondaryOrange"))
    }
}


struct CompareView_Previews: PreviewProvider {
    static var previews: some View {
        CompareView()
    }
}
