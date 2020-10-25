//
//  CommunityPostsView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/16.
//

import SwiftUI

struct CommunityPostsView: View {
    
    var HomePosts: [CommunityPost] = [
        CommunityPost(postingUser: "현아", description: "오늘 먹은 아침... 맛있어서 평소보다 많이 먹어버렸당ㅠ", numberOfLikes: 22, image: Image("food3").resizable()),
        CommunityPost(postingUser: "혜리", description: "오늘의 눈바디! 어제보다 좀 빠진듯?", numberOfLikes: 54, image: Image("body3").resizable()),
        CommunityPost(postingUser: "수빈", description: "오랜만에 진수성찬! 한식으로 맛나게 먹음~", numberOfLikes: 12, image: Image("food2").resizable()),
        CommunityPost(postingUser: "현아", description: "이제 바디프로필 찍는 날까지 D-30! 한 달만 더 힘내자!", numberOfLikes: 30, image: Image("body1").resizable()),
        CommunityPost(postingUser: "수지", description: "어제 많이 먹어서 오늘은 배 좀 나욤ㅋㅋㅋ", numberOfLikes: 66, image: Image("body2").resizable())
    ]
    
    var body: some View {
        
        VStack{
//            ScrollView(.horizontal, showsIndicators:false){
//                HStack{
//                    Spacer().frame(width:10)
//                    ForEach(0..<10){_ in
//                        StoryCircleView()
//                    }
//                    Spacer().frame(width:10)
//                }.frame(height: 80)
//            }.background(Color.clear)
            ScrollView{
                ForEach(HomePosts, id: \.id){ post in
                    PostView(passed_postingUser: post.postingUser, passed_description: post.description, passed_numberOfLikes: post.numberOfLikes, passed_image: post.image)
                }
                
                
            }.background(Color.clear)
        }
    }
}

struct CommunityPostsView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityPostsView()
    }
}
