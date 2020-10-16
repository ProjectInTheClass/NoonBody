//
//  CommunityPostsView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/16.
//

import SwiftUI

struct CommunityPostsView: View {
    
    var HomePosts: [recipePost] = [
        recipePost(postingUser: "person", description: "This is a long description.This is a long description.This is a long description.This is a long description.", numberOfLikes: 1122, image: Image(systemName: "timelapse"))
    ]
    
    var body: some View {
        
        VStack{
//            ScrollView(.horizontal, showsIndicators:false){
//                HStack{
//                    Text("This is scrollable to the right and left")
//                    Text("This is scrollable to the right and left")
//                }.frame(height: 80)
//            }.background(Color.red)
            ScrollView{
                ForEach(0..<10){_ in
                    PostView()
                }
                
                
            }.background(Color.blue)
        }
    }
}

struct CommunityPostsView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityPostsView()
    }
}
