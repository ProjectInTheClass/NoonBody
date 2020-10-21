//
//  CollectionView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/12.
//

import SwiftUI

struct CollectionView: View {
    
    
    
    @State var date = Date()
    
    //EnvironmentObject 특성을 추가
    //앞에서 MemoStore instance를 커스텀 공유데이터로 등록
    //view가 생성되는 시점에 공유데이터 목록을 확인하고
    //store 속성과 동일한 형식을 가진 객체가 등록되어 있다면
    //여기에 자동으로 저장해줌
    //swiftUI에서는 이런 방식으로 하나의 데이터를 여러 view에서 공유함
    @EnvironmentObject var store: NoonBodyStore
    
    //Formatter 속성을 추가
    //store 속성과 마찬가지로 view가 생성되는 시점에 자동으로 초기화 됨
    @EnvironmentObject var formatter: DateFormatter
    
    @State private var choosedImage1: UIImage?
    
    var body: some View {
            
        ScrollView {
            VStack{
                

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
                
                //NoonBodyStore에 저장되어있는 배열을 전달
                //클로저 추가
                //배열에 저장되어 있는 메모가 아래의 파라미터로 전달되는데
//                List(store.list) { noonBody in
//                    NoonBodyCell(noonBody: noonBody)
//                }
                
                images()
                
                
                
                
            }
        }
            
        }
        
    }

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
            //preview에서 사용할 MemoStore를 커스텀 공유데이터로 등록
                .environmentObject(NoonBodyStore())
                .environmentObject(DateFormatter.memoDateFormatter)
    }
}

struct images: View {
    @State private var choosedImage1: UIImage?
    
    var MyImagePosts: [myImagePost] = [
        myImagePost(myImage: Image("food1").resizable()),
        myImagePost(myImage: Image("food2").resizable()),
        myImagePost(myImage: Image("food3").resizable()),
        myImagePost(myImage: Image("food2").resizable()),
        myImagePost(myImage: Image("food3").resizable()),
        myImagePost(myImage: Image("food1").resizable())
    ]
    
    private var columns: [GridItem] = [
            GridItem(.fixed(100), spacing: 16),
            GridItem(.fixed(100), spacing: 16),
            GridItem(.fixed(100), spacing: 16)
        ]
    
    var body: some View{
        VStack{
            
            ScrollView {
                        LazyVGrid(
                            columns: columns,
                            alignment: .center,
                            spacing: 16,
                            pinnedViews: [.sectionHeaders, .sectionFooters]
                        ) {
                            ForEach(MyImagePosts, id: \.id){ post in
                                MyImageView(passed_myImage: post.myImage)
                            }
                        }
                    }
//            ScrollView{
//
//                ForEach(MyImagePosts, id: \.id){ post in
//                    MyImageView(passed_myImage: post.myImage)
//                }
//
//
//            }.background(Color.clear)
        }
    }


}
