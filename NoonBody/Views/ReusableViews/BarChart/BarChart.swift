//
//  BarChart.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/11/12.
//

import SwiftUI


struct BarChart: View {

    @State var selected = 0
    var colors = [Color("primaryOrange")]
    
    var body: some View{
        
        ScrollView(.horizontal, showsIndicators: false){
            VStack(spacing:0){
                
                
                //Bar Chart...
                
                VStack(alignment: .leading, spacing: 25) {
                    
                    
                    HStack(spacing: 15){
                        
                        ForEach(workout_Data){work in
                            
                            //Bars
                            VStack{
                                
                                VStack{
                                    
                                    
                                    Text("\(work.weight, specifier: "%.2f")")
                                        .foregroundColor(Color("Color"))
                                        
                                    
                                    Rectangle()
                                        .fill(LinearGradient(gradient: .init(colors: selected == work.id ? colors : [Color.black.opacity(0.06)]), startPoint: .top, endPoint: .bottom))
                                    
                                    //max height = 200
                                        .frame(height: getHeight(value: work.weight))
                                }
                                .frame(height: 220)
                                .onTapGesture {
                                    
                                    withAnimation(.easeOut){
                                        
                                        selected = work.id
                                        
                                    }
                                }
                                
                                Text(work.day)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                
                
            }
        }
        
    }
    
    //calculating Hrs For Height
    func getHeight(value: CGFloat) -> CGFloat{
        
        //the value in minutes
        //24 hrs in min = 1440
        
        //getting height
        let hrs = CGFloat(200 / 100 * value)
        
        return hrs
    }
    
   
}

//sample Data...
struct Week: Identifiable {
    
    var id: Int
    var weight: CGFloat
    var day: String
}

var workout_Data = [
    Week(id: 0, weight: 50, day: "8월 3주"),
    Week(id: 1, weight: 48.2, day: "8월 4주"),
    Week(id: 2, weight: 47.9, day: "9월 1주"),
    Week(id: 3, weight: 46.4, day: "9월 2주"),
    Week(id: 4, weight: 46, day: "9월 3주"),
    Week(id: 5, weight: 45.5, day: "9월 4주"),
    Week(id: 6, weight: 45.3, day: "10월 1주")
]
