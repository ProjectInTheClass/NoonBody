//
//  CollectionView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/12.
//

import SwiftUI

struct CollectionView: View {
    
    @State var date = Date()
    
    //Formatter 속성을 추가
    //store 속성과 마찬가지로 view가 생성되는 시점에 자동으로 초기화 됨
    @EnvironmentObject var formatter: DateFormatter
    
    @State private var choosedImage1: UIImage?
    
    var body: some View {
            
        ScrollView {
            VStack(alignment: .leading){
                
                HStack{
                    Text("9월 3주차")
                        .font(.system(size: 20))
                        
                }.padding(.top, 40)
                .padding(.leading, 20)
                
                
                //과거 사진 이미지들
                showImages()
                
                
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

struct showImages: View {
    @State private var choosedImage1: UIImage?
    
    var MyImagePosts: [myImagePost] = [
        myImagePost(myImage: Image("body1").resizable(), myWeight: 61.57),
        myImagePost(myImage: Image("body2").resizable(), myWeight: 61.56),
        myImagePost(myImage: Image("body3").resizable(), myWeight: 61.55),
        myImagePost(myImage: Image("body1").resizable(), myWeight: 61.54),
        myImagePost(myImage: Image("body2").resizable(), myWeight: 61.53),
        myImagePost(myImage: Image("body3").resizable(), myWeight: 61.52)
    ]
    
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
                            ForEach(MyImagePosts, id: \.id){ post in
                                MyImageView(passed_myImage: post.myImage, passed_myWeight: post.myWeight)
                            }
                        }
                    }.background(Color.clear)
        }
    }


}
