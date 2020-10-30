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
    
    //Formatter 속성을 추가
    //store 속성과 마찬가지로 view가 생성되는 시점에 자동으로 초기화 됨
    @EnvironmentObject var formatter: DateFormatter
    
    @State private var choosedImage1: UIImage?
    
    @State private var isChoosed = false
    
    init() {
        self.viewModel.fetchData()
    }
    
    var body: some View {

        VStack{
            ScrollView(.horizontal, showsIndicators: false){
                
                ScrollViewReader{ value in
//                    value.scrollTo(datas.count)
                    
                    HStack(alignment: .bottom){
                        ForEach(datas){ i in
                            
                            Bar(weight: i.weight, day: i.day)
                        }
                    }.frame(height: 150)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                }
                
                
            }
            
            ZStack{
                ScrollView {
                    VStack(alignment: .leading){
                        
                        HStack{
                            Text("9월 3주차")
                                .font(.system(size: 20))
                                
                        }
                        .padding(.leading, 20)
                        
                        
                        //과거 사진 이미지들
                        showImages()
                        
                        
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

//사진 불러오기

struct showImages: View {
    @State private var choosedImage1: UIImage?
    
    @ObservedObject var viewModel = NoonBodyViewModel()
    
//    var MyImagePosts: [MyImagePost] = [
//        MyImagePost(myImage: Image("body1").resizable(), myWeight: 61.57),
//        MyImagePost(myImage: Image("body2").resizable(), myWeight: 61.56),
//        MyImagePost(myImage: Image("body3").resizable(), myWeight: 61.55),
//        MyImagePost(myImage: Image("body4").resizable(), myWeight: 61.54),
//        MyImagePost(myImage: Image("body5").resizable(), myWeight: 61.53),
//        MyImagePost(myImage: Image("body6").resizable(), myWeight: 61.52)
//    ]
    
    private var columns: [GridItem] = [
            GridItem(.fixed(100), spacing: 80),
            GridItem(.fixed(100), spacing: 80)
        ]
    
    var body: some View{
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
                            }
                            
                        }
                    }.background(Color.clear)
        }
    }


}
