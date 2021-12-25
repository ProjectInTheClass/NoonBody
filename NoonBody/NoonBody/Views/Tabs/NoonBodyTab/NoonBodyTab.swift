//
//  NoonBodyTab.swift
//  NoonBody
//
//  Created by 윤진영 on 2021/12/22.
//

import SwiftUI
import SlidingTabView

struct NoonBodyTab: View {
    
    @State private var index = 0
    @State var condition = false
    
    @State private var selectedTabIndex = 0
    
    init(){
        UITableView.appearance().backgroundColor = .clear
        UINavigationBar.appearance().backgroundColor = secondaryOrange
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .center) {
                    SlidingTabView(selection: self.$selectedTabIndex, tabs: ["눈바디 일지", "모아보기"])
                    if selectedTabIndex == 0{
                        NoonBodyView()
                    }else{
                        CollectionView()
                    }
                    
                    Spacer()
                }
                .animation(.none)
                
            }
            .background(Color("secondaryOrange"))
            .navigationTitle("눈바디")
            .navigationBarItems(trailing: WriteButton())
            
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct NoonBodyTab_Previews: PreviewProvider {
    static var previews: some View {
        NoonBodyTab()
    }
}


