//
//  CollectionView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/12.
//

import SwiftUI

struct CollectionView: View {
    @State var date = Date()
    
    var body: some View {
            
        ScrollView {
            VStack{
                HStack{
                        VStack{
                            Text("어제")
                                
                            Image("food1")
                                .resizable()
                                .frame(width: 180, height: 400, alignment: .trailing)
                        }
                        VStack{
                            Text("오늘")
                                
                            Image("food2")
                                .resizable()
                                .frame(width: 180, height: 400, alignment: .trailing)
                            
                        }
                          
                }

                HStack{
                    Text("과거의 나")
                        .font(.system(size: 20))
                        .padding(.trailing, 150)
                        
                    
                    DatePicker("", selection: $date, displayedComponents: .date)
                        .datePickerStyle(DefaultDatePickerStyle())
                        .labelsHidden()
                        .frame(maxHeight: .none)
                    
                }.padding(.top, 40)
                
                
                //과거 사진 이미지들
                
                
            }
        }
            
        }
        
    }

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
