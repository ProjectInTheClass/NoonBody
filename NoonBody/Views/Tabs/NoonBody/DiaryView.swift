//
//  ShareView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/12.
//

import SwiftUI
import Firebase

struct DiaryView: View {
    
    var DiaryPosts: [DiaryPost] = [
        DiaryPost(diaryDate: getDate(num: 0), diaryFull: "식후", diaryShare: "공개", diaryWeight: 62.4, diaryMuscle: 25.1, diaryFat: 23)
        
    ]
    
    @ObservedObject var viewModel = NoonBodyViewModel() // (/1)
    
    init() {
        self.viewModel.fetchData()
    }
    
    
    var body: some View {
        VStack{

//            Button(action: {
//                self.viewModel.fetchData()
//            }) {
//                Image(systemName: "arrow.clockwise.circle")
//            }
            
            if viewModel.isWrite == true{
            ScrollView (.horizontal, showsIndicators:false){
                
                    HStack(spacing:0){
                        
                        ForEach(viewModel.diaryPosts, id: \.id){ post in
                            DiaryPostView(passed_diaryDate: post.diaryDate, passed_diaryFull: post.diaryFull, passed_diaryShare: post.diaryShare, passed_diaryWeight: post.diaryWeight, passed_diaryMuscle: post.diaryMuscle, passed_diaryFat: post.diaryFat)
                        }
                    }
                    
            }
            
            }else{
                Text("오늘의 눈바디를 기록하세요")
                    
            }
            
            
        }.onAppear(){
            self.viewModel.fetchData()
        }
        
            
        
            
        }
        
    }



struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}


