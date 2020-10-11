//
//  TabbedRootView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/11.
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
                    Text("기록하기")
                }
            
            NoonBodyCollectionMain()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("모아보기")
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
