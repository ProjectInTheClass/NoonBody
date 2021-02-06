//
//  BarChart.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/11/12.
//

import SwiftUI
import Charts

struct BarChart: View {
    
    lazy var barChart : BarChartView = {
        let barChartView = BarChartView()
        barChartView.backgroundColor = .systemBlue
        
        barChartView.rightAxis.enabled = false
        
        //y축 custom
        let yAxis = barChartView.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.setLabelCount(6, force: false)
        yAxis.labelTextColor = .white
        yAxis.axisLineColor = .white
        yAxis.labelPosition = .outsideChart
        
        //x축 custom
        barChartView.xAxis.labelPosition = .bottom
        barChartView.xAxis.labelFont = .boldSystemFont(ofSize: 12)
        barChartView.xAxis.setLabelCount(6, force: false)
        barChartView.xAxis.labelTextColor = .white
        barChartView.xAxis.axisLineColor = .systemBlue
        
        barChartView.doubleTapToZoomEnabled = false
        
        // X축 레이블 포맷 지정
//        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: workout_Data)
        
        // X축 레이블 갯수 최대로 설정 (이 코드 안쓸 시 Jan Mar May 이런식으로 띄엄띄엄 조금만 나옴)
        barChartView.xAxis.setLabelCount(workout_Data.count, force: false)
        
        //chart animation
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
        return barChartView
    }()

    @State var selected = 0
    
    var colors = [Color("primaryOrange")]
    
    @EnvironmentObject var selectedMonth: SelectedMonth
    
    
    var body: some View{
        
        ScrollView(.horizontal, showsIndicators: false){
            VStack(spacing:0){
                
                
                //Bar Chart...
                
                VStack(alignment: .leading, spacing: 25) {
                    
                    
                    HStack(alignment: .bottom){
                        
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
                                
                                .onTapGesture {
                                    
                                    withAnimation(.easeOut){
                                        
                                        selected = work.id
                                        self.selectedMonth.month = work.day
                                        
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
    Week(id: 0, weight: 50, day: "11"),
    Week(id: 1, weight: 48.2, day: "12")
]


