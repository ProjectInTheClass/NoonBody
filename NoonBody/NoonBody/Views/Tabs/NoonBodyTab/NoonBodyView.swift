//
//  NoonBodyView.swift
//  NoonBody
//
//  Created by 윤진영 on 2021/12/25.
//

import SwiftUI
import Firebase

struct NoonBodyView: View {
    
    @ObservedObject var viewModel = NoonBodyViewModel()
    
    init() {
        self.viewModel.fetchData()
    }
    
    var body: some View {
        VStack{
            
            ScrollView{
                if viewModel.isWrite == true{
                    TabView{
                    
                        
                            
                            ForEach(viewModel.diaryPosts, id: \.id){ post in
                                DiaryPostView(passed_diaryDate: post.diaryDate, passed_diaryFull: post.diaryFull, passed_diaryShare: post.diaryShare, passed_diaryWeight: post.diaryWeight, passed_diaryMuscle: post.diaryMuscle, passed_diaryFat: post.diaryFat, passed_diaryImage: post.diaryImage)
                            }
                        
                        
                } //: TAB
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
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

struct NoonBodyView_Previews: PreviewProvider {
    static var previews: some View {
        NoonBodyView()
    }
}
