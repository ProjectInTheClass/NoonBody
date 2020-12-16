//
//  PostView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/16.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostView: View {
    
    @State var CommentList: [CommentModel] = [
        
        CommentModel(commentor: "현아98", comment_content: "늦은시간에 미안... 참을 수 없었어.."),
        CommentModel(commentor: "소니12", comment_content: "ㅋㅋㅋㅋㅋㅋㅋ"),
        CommentModel(commentor: "뚜비니", comment_content: "정신차려"),
        CommentModel(commentor: "소니12", comment_content: "ㅋㅋㅋㅋㅋㅋㅋ")
    ]
    
    var passed_postingUser: String
    var passed_description: String
    var passed_numberOfLikes: Int
    var passed_image: String
    
    var body: some View {
        VStack{
            HStack {
                Spacer().frame(width:20)
                Image("body1")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width:40, height:40)
                Spacer().frame(width:20)
                Text("\(passed_postingUser)님의 눈바디")
                Spacer()
                Text("11:41PM")
                Spacer().frame(width:20)
            }
            
            AnimatedImage(url: URL(string: passed_image))
                .resizable()
                .frame(height: 300)
                .background(Color.init(red: 0.95, green: 0.95, blue: 0.95).opacity(0.6))
                
            VStack {
                HStack{
                    Image(systemName: "flame.fill")
                    Image(systemName: "message")
                    Text("\(passed_numberOfLikes)명이 응원해요!")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                    Spacer()
//                    Image(systemName: "bookmark")
                }.padding(.bottom, 3)
                

                
                HStack{
                    Text("\(passed_description)")
                        .font(.system(size: 15))
                    Spacer()
                }
            }.padding()
//            .background(Color.orange)
        
            HStack {
                VStack (alignment: .leading){
                    ForEach(CommentList, id: \.id){ comment in
                        CommunityCommentView(commentor: comment.commentor, comment_content: comment.comment_content)
                        
                    }
 
                }.font(.system(size: 15))
                
                Spacer()
            }.padding(.leading)
            
            
            
        }.frame(width: UIScreen.main.bounds.size.width)
        .padding()
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(passed_postingUser: "chris", passed_description: "this is a description for this post.this is a description for this post.this is a description for this post.this is a description for this post.this is a description for this post.", passed_numberOfLikes: 1000, passed_image: "")
    }
}
