//
//  BarChart.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/11/12.
//

import SwiftUI

//Sample Datas

struct type: Identifiable {
    
    var id: Int
    var weight: CGFloat
    var day: String
}

var datas = [
    type(id: 0, weight: 50, day: "8월 3주"),
    type(id: 1, weight: 48.2, day: "8월 4주"),
    type(id: 2, weight: 47.9, day: "9월 1주"),
    type(id: 3, weight: 46.4, day: "9월 2주"),
    type(id: 4, weight: 46, day: "9월 3주"),
    type(id: 5, weight: 45.5, day: "9월 4주"),
    type(id: 6, weight: 45.3, day: "10월 1주")
]


struct BarChart: View {
    
    var weight : CGFloat = 0
    var day = ""
    @State var myColor: String = "primaryGray"
    @State var isChoosed: Bool = false
    
    var body: some View{
        
        VStack{
            ZStack{
                
                Rectangle().fill(Color(myColor)).frame(width: UIScreen.main.bounds.width / 5 - 12, height: getHeight()).cornerRadius(10)
                
                Text(String(format: "%.1f", Double(weight)) + "kg").foregroundColor(Color.white)
                    .padding(.bottom, 50)
                    .font(.system(size: 10, weight: .bold))
                
            }.onTapGesture(count: 1, perform: {
                self.isChoosed.toggle()
                
                if isChoosed{
                    self.myColor = "primaryOrange"
                }else{
                    self.myColor = "primaryGray"
                }
                
            })
            
            
            Text(day).foregroundColor(Color.black.opacity(0.5))
        }
        
        
        
    }
    
    func getHeight() -> CGFloat {
        
        return 200 / 100 * weight
    }
}


