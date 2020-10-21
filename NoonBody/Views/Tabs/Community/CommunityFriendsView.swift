//
//  CommunityFriendsView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/16.
//

import SwiftUI

struct CommunityFriendsView: View {
    
    @State var FriendLists: [friendsPost] = [
        friendsPost(friendName: "현아", friendDescription: "나는 현아", friendNumberOfLikes: 10, friendImage: Image("body1").resizable()),
        friendsPost(friendName: "혜리", friendDescription: "나는 혜리", friendNumberOfLikes: 20, friendImage: Image("body2").resizable()),
        friendsPost(friendName: "지현", friendDescription: "나는 지현", friendNumberOfLikes: 30, friendImage: Image("body3").resizable()),
        friendsPost(friendName: "수빈", friendDescription: "나는 수빈", friendNumberOfLikes: 40, friendImage: Image("food1").resizable())
    ]
    
    var body: some View {
        
        VStack{
                List {
                    ForEach(FriendLists, id: \.id){ post in
                        FriendsView(passed_friendUser: post.friendName, passed_friendDescription: post.friendDescription, passed_friendNumberOfLikes: post.friendNumberOfLikes, passed_friendImage: post.friendImage)
                            .listRowBackground(Color("secondaryOrange"))
                    }
                    
                    .onDelete(perform: delete)
                }.background(Color.clear)
            
        }

    }
    
    func delete(at offsets: IndexSet){
        if let first = offsets.first{
            FriendLists.remove(at: first)
        }
    }
}

struct CommunityFriendsView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityFriendsView()
    }
}
