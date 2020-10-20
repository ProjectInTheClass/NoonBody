//
//  CompareView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/20.
//

import SwiftUI

struct CompareView: View {
    var body: some View {
        VStack{
            HStack{
                    VStack{
                        Text(getDate(num: 1))
                            
                        Image("body1")
                            .resizable()
                            .frame(width: 180, height: 300, alignment: .trailing)
                        
                    }
                    VStack{
                        Text(getDate(num: 0))
                            
                        Image("body2")
                            .resizable()
                            .frame(width: 180, height: 300, alignment: .trailing)
                        
                    }
                      
            }
            
            VStack(alignment: .leading){
                HStack{
                    
                    Text("0.00kg")
                    Spacer()
                    Text("몸무게")
                    Spacer()
                    Text("0.00kg")
//                        TextField("0.00kg", text: $weight)
//                            .frame(width: 70)
                }
                
                Divider()
                
                HStack{
                    
                    Text("0.00kg")
                    Spacer()
                    Text("골격근량")
                    Spacer()
                    Text("0.00kg")
//                        TextField("0.00kg", text: $muscle)
//                            .frame(width: 70)
                }
                
                Divider()
                
                HStack{
                    Text("0.00kg")
                    Spacer()
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


struct CompareView_Previews: PreviewProvider {
    static var previews: some View {
        CompareView()
    }
}
