//
//  CollectionView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/12.
//

import SwiftUI
import BarChart

struct CollectionView: View {
    
    //BarChart Start
    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()
    
    // MARK: - Chart Properties
    
    let chartHeight: CGFloat = 400
    let config = ChartConfiguration()
    @State var entries = [ChartDataEntry]()
    @State var selectedBarTopCentreLocation: CGPoint?
    @State var selectedEntry: ChartDataEntry?
    
    // MARK: - Controls Properties
    
    @State var maxEntriesCount: Int = 0
    @State var xAxisTicksIntervalValue: Double = 1
    @State var isXAxisTicksHidden: Bool = false
    
    //BarChart End
    
    @State var date = Date()
    
    @ObservedObject var viewModel = NoonBodyViewModel()
    
    //Formatter 속성을 추가
    //store 속성과 마찬가지로 view가 생성되는 시점에 자동으로 초기화 됨
    @EnvironmentObject var formatter: DateFormatter
    
    @State private var choosedImage1: UIImage?
    
    @State private var isChoosed = false
    
    private var columns: [GridItem] = [
            GridItem(.fixed(100), spacing: 80),
            GridItem(.fixed(100), spacing: 80)
        ]
    
    init() {
        self.viewModel.fetchData()
    }
    
    var body: some View {

        VStack{
            
            ScrollView {
                VStack(spacing: 10) {
                    self.chartView()
//                    self.controlsView()
                    
                }
                .padding(5)
            }
            
//            ScrollView(.horizontal, showsIndicators: false){
//
//                ScrollViewReader{ value in
////                    value.scrollTo(datas.count)
//
//                    HStack(alignment: .bottom){
//                        ForEach(datas){ i in
//
//                            Bar(weight: i.weight, day: i.day)
//                        }
//                    }.frame(height: 150)
//                    .padding(.leading, 20)
//                    .padding(.trailing, 20)
//                }
//
//
//            }
            
            
            
            ZStack{
                ScrollView {
                    VStack(alignment: .leading){
                        
                        HStack{
                            Text("9월 3주차")
                                .font(.system(size: 20))
                                
                        }
                        .padding(.leading, 20)
                        
                        
                        //과거 사진 이미지들
//                        showImages()
                        VStack{
                            
                            ScrollView {
                                        LazyVGrid(
                                            columns: columns,
                                            alignment: .center,
                                            spacing: 20,
                                            pinnedViews: [.sectionHeaders, .sectionFooters]
                                        ) {
                                            ForEach(viewModel.diaryPosts, id: \.id){ post in
                                                MyImageView(passed_myImage: post.diaryImage, passed_myWeight: post.diaryWeight)
                                                    .gesture(
                                                        TapGesture()
                                                            .onEnded { _ in
                                                                print("\(post.diaryWeight)")
                                                            }
                                                    )
                                            }
                                            
                                        }
                                    }.background(Color.clear)
                        }
                        
                        
                    }
                }
                
                NavigationLink(destination: CompareView(), isActive: $isChoosed) {
                    Button(action: {
                        self.isChoosed = true
                    }, label: {
                        HStack {
                            Text("비교하기")
                            
                        }.frame(height: 50)
                        .frame(minWidth:0, maxWidth: .infinity)
                        .foregroundColor(Color.white)
                        
                    }).background(Color("primaryOrange")).cornerRadius(25).padding()
                }.padding(.top, 350)
            }
            
        }
        
            
        }
    
    
    // MARK: - BarChart Functions
    func selectionIndicatorView() -> some View {
        Group {
            if self.selectedEntry != nil && self.selectedBarTopCentreLocation != nil {
                SelectionIndicator(entry: self.selectedEntry!,
                                   location: self.selectedBarTopCentreLocation!.x,
                                   infoRectangleColor: Color(red: 241/255, green: 242/255, blue: 245/255))
            } else {
                Rectangle().foregroundColor(.clear)
            }
        }
        .frame(height: 60)
    }
    
    //chart를 그리는 부분
    func chartView() -> some View {
        ZStack {
            // Drop shadow rectangle
//            RoundedRectangle(cornerRadius: 5)
//                .foregroundColor(.white)
//                .padding(5)
//                .shadow(color: .black, radius: 5)
            
                Text("No data").opacity(self.entries.isEmpty ? 1.0 : 0.0)
            
            VStack(alignment: .leading, spacing: 0) {
                self.selectionIndicatorView()
                SelectableBarChartView<SelectionLine>(config: self.config)
                .onBarSelection { entry, location in
                    self.selectedBarTopCentreLocation = location
                    self.selectedEntry = entry
                }
                .selectionView {
                    SelectionLine(location: self.selectedBarTopCentreLocation,
                                  height: 295)
                }
                .onAppear() {
                    let labelsFont = CTFontCreateWithName(("SFProText-Regular" as CFString), 10, nil)
                    self.config.data.entries = self.randomEntries()
                    self.config.data.color = .red
                    self.config.xAxis.labelsColor = .gray
                    self.config.xAxis.ticksColor = .gray
                    self.config.labelsCTFont = labelsFont
                    self.config.xAxis.ticksDash = [2, 4]
                    self.config.yAxis.labelsColor = .gray
                    self.config.yAxis.ticksColor = .gray
                    self.config.yAxis.ticksDash = [2, 4]
                    self.config.yAxis.minTicksSpacing = 30.0
                    self.config.yAxis.formatter = { (value, decimals) in
                        let format = value == 0 ? "" : "b"
                        return String(format: " %.\(decimals)f\(format)", value)
                    }
                }
                .animation(.easeInOut)
                .onReceive([self.isXAxisTicksHidden].publisher.first()) { (value) in
                    self.config.xAxis.ticksColor = value ? .clear : .gray
                }
                .onReceive([self.xAxisTicksIntervalValue].publisher.first()) { (value) in
                    self.config.xAxis.ticksInterval = Int(value)
                }
                .onReceive(self.orientationChanged) { _ in
                    self.config.objectWillChange.send()
                }
            }.padding(15)
        }.frame(height: self.chartHeight)
    }
    
    //데이터 추가, 색상 변경 등 control을 다루는 화면을 그리는 부분 -> 추후에는 필요 없음
//    func controlsView() -> some View {
//        Group {
//            VStack(spacing: 0) {
//                Stepper(value: self.$maxEntriesCount, in: 0...30) {
//                    Text("Max entries count: \(self.maxEntriesCount)")
//                }.padding(15)
//                Button(action: {
//                    let newEntries = self.randomEntries()
//                    self.entries = newEntries
//                    self.config.data.entries = newEntries
//                }) {
//                    Text("Generate entries")
//                }.randomButtonStyle()
//            }
//            HStack {
//                Button(action: {
//                    self.config.data.color = Color.random
//                }) {
//                    Text("Generate color")
//                }.randomButtonStyle()
//                Button(action: {
//                    self.config.data.gradientColor = GradientColor(start: Color.random, end: Color.random)
//                }) {
//                    Text("Generate gradient")
//                }.randomButtonStyle()
//            }
//            Stepper(value: self.$xAxisTicksIntervalValue, in: 1...4) {
//                Text("X axis ticks interval: \(Int(self.xAxisTicksIntervalValue))")
//            }.padding(15)
//            Toggle(isOn: self.$isXAxisTicksHidden, label: {
//                Text("X axis ticks is hidden")
//            }).padding(15)
//        }
//    }
    
    // MARK: - Random Helpers
    
    func randomEntries() -> [ChartDataEntry] {
        var entries = [ChartDataEntry]()
        guard self.maxEntriesCount > 0 else { return [] }
        for data in 0..<self.maxEntriesCount {
            let randomDouble = Double.random(in: -15...50)
            let newEntry = ChartDataEntry(x: "\(2000+data)", y: randomDouble)
            entries.append(newEntry)
        }
        return entries
    }
        
    }


//extension Color {
//    static var random: Color {
//        return Color(red: .random(in: 0...1),
//                     green: .random(in: 0...1),
//                     blue: .random(in: 0...1))
//    }
//}

//// MARK: - Modifers
//
//struct RandomButtonStyle: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .padding(10)
//            .background(Color.gray.opacity(0.2))
//            .cornerRadius(8)
//    }
//}
//
//extension View {
//    func randomButtonStyle() -> some View {
//        self.modifier(RandomButtonStyle())
//    }
//}


struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}

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


struct Bar: View {
    
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


//사진 불러오기

//struct showImages: View {
//    @State private var choosedImage1: UIImage?
//
//    @ObservedObject var viewModel = NoonBodyViewModel()
//
//    private var columns: [GridItem] = [
//            GridItem(.fixed(100), spacing: 80),
//            GridItem(.fixed(100), spacing: 80)
//        ]
//
//    var body: some View{
//        VStack{
//
//            ScrollView {
//                        LazyVGrid(
//                            columns: columns,
//                            alignment: .center,
//                            spacing: 20,
//                            pinnedViews: [.sectionHeaders, .sectionFooters]
//                        ) {
//                            ForEach(viewModel.diaryPosts, id: \.id){ post in
//                                MyImageView(passed_myImage: post.diaryImage, passed_myWeight: post.diaryWeight)
//                            }
//
//                        }
//                    }.background(Color.clear)
//        }
//    }
//
//
//}
