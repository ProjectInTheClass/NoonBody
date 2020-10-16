//
//  CommunityFriendsView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/16.
//

import SwiftUI

struct CommunityFriendsView: View {
    var body: some View {
        
        Section {
            NavigationLink(destination: Text("Hahaha")) {
                    HStack (spacing: 18) {
                        VStack (alignment: .leading, spacing: 2) {
                            HStack {
                                Text("username")
                                    .foregroundColor(Color.black)
                                Text("Time").font(.caption).foregroundColor(.secondary)
                            }
                            Text("Message Content Goes Here.")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                            
                        }
                        Spacer()
                        Image(systemName: "circle")
                            .resizable()
                            .frame(width: 80, height: 80)
//                                    .aspectRatio(contentMode: .fit)
                            .padding(.horizontal, -5)

                    } .padding() // HStack ends
            }    // NavLink ends here
            
            NavigationLink(destination: Text("Hahaha")) {
                    HStack (spacing: 18) {
                        VStack (alignment: .leading, spacing: 2) {
                            HStack {
                                Text("username")
                                    .foregroundColor(Color.black)
                                Text("Time").font(.caption).foregroundColor(.secondary)
                            }
                            Text("Message Content Goes Here.")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                            
                        }
                        Spacer()
                        Image(systemName: "circle")
                            .resizable()
                            .frame(width: 80, height: 80)
//                                    .aspectRatio(contentMode: .fit)
                            .padding(.horizontal, -5)

                    } .padding()
            } // Nav Ends
            
            NavigationLink(destination: Text("Hahaha")) {
                    HStack (spacing: 18) {
                        VStack (alignment: .leading, spacing: 2) {
                            HStack {
                                Text("username")
                                    .foregroundColor(Color.black)
                                Text("Time").font(.caption).foregroundColor(.secondary)
                            }
                            Text("Message Content Goes Here.")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                            
                        }
                        Spacer()
                        Image(systemName: "circle")
                            .resizable()
                            .frame(width: 80, height: 80)
//                                    .aspectRatio(contentMode: .fit)
                            .padding(.horizontal, -5)

                    } .padding()
            } // Nav Ends
            
            NavigationLink(destination: Text("Hahaha")) {
                    HStack (spacing: 18) {
                        VStack (alignment: .leading, spacing: 2) {
                            HStack {
                                Text("username")
                                    .foregroundColor(Color.black)
                                Text("Time").font(.caption).foregroundColor(.secondary)
                            }
                            Text("Message Content Goes Here.")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                            
                        }
                        Spacer()
                        Image(systemName: "circle")
                            .resizable()
                            .frame(width: 80, height: 80)
//                                    .aspectRatio(contentMode: .fit)
                            .padding(.horizontal, -5)

                    } .padding()
            } // Nav Ends
            
            NavigationLink(destination: Text("Hahaha")) {
                    HStack (spacing: 18) {
                        VStack (alignment: .leading, spacing: 2) {
                            HStack {
                                Text("username")
                                    .foregroundColor(Color.black)
                                Text("Time").font(.caption).foregroundColor(.secondary)
                            }
                            Text("Message Content Goes Here.")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                            
                        }
                        Spacer()
                        Image(systemName: "circle")
                            .resizable()
                            .frame(width: 80, height: 80)
//                                    .aspectRatio(contentMode: .fit)
                            .padding(.horizontal, -5)

                    } .padding()
            } // Nav Ends
        } // Section ends
    }
}

struct CommunityFriendsView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityFriendsView()
    }
}
