//
//  CommunityPostsView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/16.
//

import SwiftUI

struct CommunityPostsView: View {
    
    
    
    @ObservedObject var viewModel = CommunityPostViewModel()
    
    init() {
        self.viewModel.fetchData()
    }
    
    var body: some View {
        
        VStack{

            ScrollView{
                ForEach(viewModel.communityPosts, id: \.id){ post in
                    PostView(passed_postingUser: post.postingUser, passed_description: post.description, passed_numberOfLikes: post.numberOfLikes, passed_image: post.image)
                }
                
                
            }.background(Color.clear)
        }.frame(width: UIScreen.main.bounds.size.width)
    }
}

struct CommunityPostsView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityPostsView()
    }
}
