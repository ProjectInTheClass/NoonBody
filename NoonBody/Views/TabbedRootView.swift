//
//  ContentView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/05.
//

import SwiftUI

struct TabbedRootView: View {
    var body: some View {
        
        TabView{
            NoonBodyWriteMain()
                //tabItem 속성 값으로 이미지와 텍스트를 넣음
                //image는 sf symbols값을 넣음
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("눈바디")
                }
            
            NoonBodyCollectionMain()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("식단")
                }
            
            NoonBodyCollectionMain()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("커뮤니티")
                }
            
            NoonBodyMyPageMain()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("마이페이지")
                }
        }
        
        
    }
}

struct TabbedRootView_Previews: PreviewProvider {
    static var previews: some View {
        TabbedRootView()
    }
}
