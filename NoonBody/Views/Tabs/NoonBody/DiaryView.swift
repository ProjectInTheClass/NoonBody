//
//  ShareView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/12.
//

import SwiftUI

struct DiaryView: View {
    
    var DiaryPosts: [diaryPost] = [
        diaryPost(diaryDate: getDate(num: 0), diaryFull: "식후", diaryShare: "공개", diaryWeight: 62.4, diaryMuscle: 25.1, diaryFat: 23, diaryImage: Image("body2")),
        
    ]
    
    
    var body: some View {
            
        ScrollView {
            ForEach(DiaryPosts, id: \.id){ post in
                DiaryPostView(passed_diaryDate: post.diaryDate, passed_diaryFull: post.diaryFull, passed_diaryShare: post.diaryShare, passed_diaryWeight: post.diaryWeight, passed_diaryMuscle: post.diaryMuscle, passed_diaryFat: post.diaryFat, passed_diaryImage: post.diaryImage)
            }
        }
            
        }
        
    }

//func getDate(num:Int)->String{
//     let time = Date()
//     let timeFormatter = DateFormatter()
//     timeFormatter.dateFormat = "YYYY.MM.DD"
//    timeFormatter.dateStyle = .medium
//    timeFormatter.locale = Locale(identifier: "Ko_KR")
//     let stringDate = timeFormatter.string(from: time)
//     return stringDate
//    }




struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}


