//
//  PostView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/16.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostView: View {
    
    var passed_postingUser: String
    var passed_description: String
    var passed_numberOfLikes: Int
    var passed_image: String
    
    var body: some View {
        
        VStack{
            //URI로 이미지 보여주도록 수정
            AnimatedImage(url: URL(string: passed_image)!)
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: 300)
                .scaledToFit()
                .background(Color.init(red: 0.95, green: 0.95, blue: 0.95).opacity(0.6))
            VStack {
                HStack{
                    Image(systemName: "flame.fill")
                    Image(systemName: "message")
                    Spacer()
//                    Image(systemName: "bookmark")
                }.padding(.bottom, 3)
                
                HStack{
                    Text("\(passed_postingUser)")
                        .font(.system(size: 20))
                    Text("\(passed_numberOfLikes) likes")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                    Spacer()
                }.font(.system(size: 12, weight: .bold))
                
                HStack{
                    Text("\(passed_description)")
                        .font(.system(size: 15))
                    Spacer()
                }.font(.system(size: 12, weight: .regular))
            }.padding()
//            .background(Color.orange)
            
            
        }.frame(width: UIScreen.main.bounds.size.width, height: .infinity)
        .padding()
//        .background(Color.yellow)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(passed_postingUser: "chris", passed_description: "this is a description for this post.this is a description for this post.this is a description for this post.this is a description for this post.this is a description for this post.", passed_numberOfLikes: 1000, passed_image: "")
    }
}
