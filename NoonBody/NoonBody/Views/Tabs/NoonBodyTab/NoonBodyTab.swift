//
//  NoonBodyTab.swift
//  NoonBody
//
//  Created by 윤진영 on 2021/12/22.
//

import SwiftUI
import SlidingTabView

struct NoonBodyTab: View {
    
    init(){
        
        UITableView.appearance().backgroundColor = .clear
        
        let secondaryOrange = UIColor.init(netHex: 0xFFEFEA)
        UINavigationBar.appearance().backgroundColor = secondaryOrange
//        UINavigationBar.appearance().tintColor = .green
//        UINavigationBar.appearance().barTintColor = .yellow
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.red]
        }
    
    @State private var index = 0
    @State var condition = false
    
    @State private var selectedTabIndex = 0

    var body: some View {
        NavigationView {
            VStack {
                
                VStack(alignment: .center) {
                    SlidingTabView(selection: self.$selectedTabIndex, tabs: ["눈바디 일지", "모아보기"])
                    if selectedTabIndex == 0{
                        DiaryView()
                    }else{
                        CollectionView()
                    }
                    
                    Spacer()
                }
                    .animation(.none)
                    
            }.background(Color("secondaryOrange"))
            .navigationTitle("눈바디")
            .navigationBarItems(trailing: WriteButton())
            
        }.navigationBarTitle("").navigationBarHidden(true)
    }
}

struct NoonBodyTab_Previews: PreviewProvider {
    static var previews: some View {
        NoonBodyTab()
    }
}


