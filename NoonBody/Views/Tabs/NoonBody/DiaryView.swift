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
    
    
    var body: some View {
        
//        if viewModel.isWrite == true{
        ScrollView (.horizontal){
            
                HStack(spacing:0){
                    
                    ForEach(viewModel.diaryPosts, id: \.id){ post in
                        DiaryPostView(passed_diaryDate: post.diaryDate, passed_diaryFull: post.diaryFull, passed_diaryShare: post.diaryShare, passed_diaryWeight: post.diaryWeight, passed_diaryMuscle: post.diaryMuscle, passed_diaryFat: post.diaryFat)
                    }
                }
            
                
                    
                
                
            }.onAppear(){
                self.viewModel.fetchData()
            }
//        }else{
//            Text("오늘의 눈바디를 기록하세요")
//        }
            
        
            
        }
        
    }



struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}


