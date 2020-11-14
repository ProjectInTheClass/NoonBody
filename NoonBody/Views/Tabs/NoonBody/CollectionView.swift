//
//  CollectionView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/12.
//

import SwiftUI

struct CollectionView: View {
    
    @State var date = Date()
    
    
    @ObservedObject var viewModel = NoonBodyViewModel()
    
    @EnvironmentObject var selectedDay: SelectedDay
    
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
            BarChart()
            
            ZStack{
                ScrollView {
                    VStack(alignment: .leading){
                        
                        HStack{
                            Text("\(self.selectedDay.day)")
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
                                                if post.diaryDate == self.selectedDay.day{
                                                    MyImageView(passed_myDate: post.diaryDate, passed_myImage: post.diaryImage, passed_myWeight: post.diaryWeight, passed_myMuscle: post.diaryMuscle, passed_myFat: post.diaryFat)
                                                }
                                                
                                                
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
        
    }

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
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
