//
//  ShareView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/12.
//

import SwiftUI
import Firebase

struct DiaryView: View {
    
    
    @ObservedObject var viewModel = NoonBodyViewModel()
    
    init() {
        self.viewModel.fetchData()
    }
    
    
    var body: some View {
        VStack{
            
            ScrollView{
                if viewModel.isWrite == true{
                ScrollView (.horizontal, showsIndicators:false){
                    
                        HStack(spacing:0){
                            
                            ForEach(viewModel.diaryPosts, id: \.id){ post in
                                DiaryPostView(passed_diaryDate: post.diaryDate, passed_diaryFull: post.diaryFull, passed_diaryShare: post.diaryShare, passed_diaryWeight: post.diaryWeight, passed_diaryMuscle: post.diaryMuscle, passed_diaryFat: post.diaryFat, passed_diaryImage: post.diaryImage)
                            }
                        }
                        
                }
                
                }else{
                    Text("오늘의 눈바디를 기록하세요")
                        .onTapGesture(count: 1, perform: {
                            self.viewModel.fetchData()
                        })
                        
                }
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


