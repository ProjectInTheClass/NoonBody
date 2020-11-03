//
//  CommunityFriendsView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/16.
//

import SwiftUI

struct CommunityFriendsView: View {
    
    @ObservedObject var viewModel = CommunityFriendsViewModel()
    
    init() {
        self.viewModel.fetchData()
    }
    
    var body: some View {
        
        VStack{
                List {
                    ForEach(viewModel.friendPosts, id: \.id){ post in
                        FriendsView(passed_friendUser: post.friendName, passed_friendDescription: post.friendDescription, passed_friendNumberOfLikes: post.friendNumberOfLikes, passed_friendImage: post.friendImage)
                            .listRowBackground(Color("secondaryOrange"))
                    }
                    
                    .onDelete(perform: delete)
                }.background(Color.clear)
            
        }

    }
    
    func delete(at offsets: IndexSet){
        if let first = offsets.first{
//            FriendLists.remove(at: first)
        }
    }
}

struct CommunityFriendsView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityFriendsView()
    }
}
