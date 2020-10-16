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
                                            CommunityPostsView()
                                        }else{
                                            CommunityFriendsView()
                                        }
                                        
                                        Spacer()
                                    }
                                        .animation(.none)
                }
                
           
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
