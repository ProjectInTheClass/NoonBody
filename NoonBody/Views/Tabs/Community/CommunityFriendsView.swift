//
//  CommunityFriendsView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/16.
//

import SwiftUI

struct CommunityFriendsView: View {
    
    var FriendLists: [friendsPost] = [
        friendsPost(friendName: "현아", friendDescription: "나는 현아", friendNumberOfLikes: 10, friendImage: Image("body1").resizable()),
        friendsPost(friendName: "혜리", friendDescription: "나는 혜리", friendNumberOfLikes: 20, friendImage: Image("body2").resizable()),
        friendsPost(friendName: "지현", friendDescription: "나는 지현", friendNumberOfLikes: 30, friendImage: Image("body3").resizable()),
        friendsPost(friendName: "수빈", friendDescription: "나는 수빈", friendNumberOfLikes: 40, friendImage: Image("food1").resizable())

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
                ForEach(FriendLists, id: \.id){ post in
                    FriendsView(passed_friendUser: post.friendName, passed_friendDescription: post.friendDescription, passed_friendNumberOfLikes: post.friendNumberOfLikes, passed_friendImage: post.friendImage)
                }
                
                
            }.background(Color.clear)
        }
        
//        Section {
//            NavigationLink(destination: Text("Hahaha")) {
//                    HStack (spacing: 18) {
//                        VStack (alignment: .leading, spacing: 2) {
//                            HStack {
//                                Text("username")
//                                    .foregroundColor(Color.black)
//                                Text("Time").font(.caption).foregroundColor(.secondary)
//                            }
//                            Text("Message Content Goes Here.")
//                                .font(.footnote)
//                                .foregroundColor(.secondary)
//
//                        }
//                        Spacer()
//                        Image(systemName: "circle")
//                            .resizable()
//                            .frame(width: 80, height: 80)
////                                    .aspectRatio(contentMode: .fit)
//                            .padding(.horizontal, -5)
//
//                    } .padding() // HStack ends
//            }    // NavLink ends here
//
//            NavigationLink(destination: Text("Hahaha")) {
//                    HStack (spacing: 18) {
//                        VStack (alignment: .leading, spacing: 2) {
//                            HStack {
//                                Text("username")
//                                    .foregroundColor(Color.black)
//                                Text("Time").font(.caption).foregroundColor(.secondary)
//                            }
//                            Text("Message Content Goes Here.")
//                                .font(.footnote)
//                                .foregroundColor(.secondary)
//
//                        }
//                        Spacer()
//                        Image(systemName: "circle")
//                            .resizable()
//                            .frame(width: 80, height: 80)
////                                    .aspectRatio(contentMode: .fit)
//                            .padding(.horizontal, -5)
//
//                    } .padding()
//            } // Nav Ends
//
//            NavigationLink(destination: Text("Hahaha")) {
//                    HStack (spacing: 18) {
//                        VStack (alignment: .leading, spacing: 2) {
//                            HStack {
//                                Text("username")
//                                    .foregroundColor(Color.black)
//                                Text("Time").font(.caption).foregroundColor(.secondary)
//                            }
//                            Text("Message Content Goes Here.")
//                                .font(.footnote)
//                                .foregroundColor(.secondary)
//
//                        }
//                        Spacer()
//                        Image(systemName: "circle")
//                            .resizable()
//                            .frame(width: 80, height: 80)
////                                    .aspectRatio(contentMode: .fit)
//                            .padding(.horizontal, -5)
//
//                    } .padding()
//            } // Nav Ends
//
//            NavigationLink(destination: Text("Hahaha")) {
//                    HStack (spacing: 18) {
//                        VStack (alignment: .leading, spacing: 2) {
//                            HStack {
//                                Text("username")
//                                    .foregroundColor(Color.black)
//                                Text("Time").font(.caption).foregroundColor(.secondary)
//                            }
//                            Text("Message Content Goes Here.")
//                                .font(.footnote)
//                                .foregroundColor(.secondary)
//
//                        }
//                        Spacer()
//                        Image(systemName: "circle")
//                            .resizable()
//                            .frame(width: 80, height: 80)
////                                    .aspectRatio(contentMode: .fit)
//                            .padding(.horizontal, -5)
//
//                    } .padding()
//            } // Nav Ends
//
//            NavigationLink(destination: Text("Hahaha")) {
//                    HStack (spacing: 18) {
//                        VStack (alignment: .leading, spacing: 2) {
//                            HStack {
//                                Text("username")
//                                    .foregroundColor(Color.black)
//                                Text("Time").font(.caption).foregroundColor(.secondary)
//                            }
//                            Text("Message Content Goes Here.")
//                                .font(.footnote)
//                                .foregroundColor(.secondary)
//
//                        }
//                        Spacer()
//                        Image(systemName: "circle")
//                            .resizable()
//                            .frame(width: 80, height: 80)
////                                    .aspectRatio(contentMode: .fit)
//                            .padding(.horizontal, -5)
//
//                    } .padding()
//            } // Nav Ends
//        } // Section ends
    }
}

struct CommunityFriendsView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityFriendsView()
    }
}
