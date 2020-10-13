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
                                
                            Image("body1")
                                .resizable()
                                .frame(width: 180, height: 300, alignment: .trailing)
                        }
                        VStack{
                            Text("오늘")
                                
                            Image("body2")
                                .resizable()
                                .frame(width: 180, height: 300, alignment: .trailing)
                            
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
                images()
                images()
                
                
                
                
            }
        }
            
        }
        
    }

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}

struct images: View {
    
    var body: some View{
        VStack {
            HStack{
                Image("body1")
                    .resizable()
                    .frame(width: 120, height: 120, alignment: .trailing)
                Image("body2")
                    .resizable()
                    .frame(width: 120, height: 120, alignment: .trailing)
                Image("body3")
                    .resizable()
                    .frame(width: 120, height: 120, alignment: .trailing)
            }
            
            HStack{
                Image("body2")
                    .resizable()
                    .frame(width: 120, height: 120, alignment: .trailing)
                Image("body3")
                    .resizable()
                    .frame(width: 120, height: 120, alignment: .trailing)
                Image("body1")
                    .resizable()
                    .frame(width: 120, height: 120, alignment: .trailing)
            }
        }
    }
    
    
}
