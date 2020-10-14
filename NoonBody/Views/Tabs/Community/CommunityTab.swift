//
//  CommunityTab.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/12.
//

import SwiftUI
import SlidingTabView

struct CommunityTab: View {
    @State private var selectedTabIndex = 0 // slider tab state
    
    init(){
                UITableView.appearance().backgroundColor = .clear
                
            }
    
    var body: some View {
        NavigationView {
            ScrollView() { // hides  arrow
                
                Section {
                    VStack(alignment: .leading) {
                                        SlidingTabView(selection: self.$selectedTabIndex, tabs: ["친구소식", "친구목록"])
                                        if selectedTabIndex == 0{
                                            EmptyView()
                                        }else{
                                            EmptyView()
                                        }
                                        
                                        Spacer()
                                    }
                                        .animation(.none)
                }
                
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
            } // Scroll View Ends
            .background(Color("secondaryOrange"))
            .navigationBarTitle("커뮤니티")
            }
    }
    
}


struct CommunityTab_Previews: PreviewProvider {
    static var previews: some View {
        CommunityTab()
    }
}
