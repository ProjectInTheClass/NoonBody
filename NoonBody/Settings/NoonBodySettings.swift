//
//  NoonBodySettings.swift
//  NoonBody
//
//  Created by Jen on 2020-10-11.
//

import SwiftUI

struct NoonBodySettings: View {
    
    @State var username: String = ""
    @State private var isPrivate: Bool = true
    @State private var notificationsEnable:Bool = false
    @State private var previewIndex = 0
    var previewOptions = ["Always", "When Unlocked", "Never"]
    
    var body: some View {
            NavigationView {

                Form {
                    Section {
                        NavigationLink(destination: SettingsProfile()) {
                            HStack {
                                Image(systemName: "person.circle.fill")
                                    .font(.system(size: 65))
                                    .foregroundColor(.gray)
                                VStack(alignment:.leading, spacing: 3) {
                                    Text("UserName")
                                        .font(.system(size:16))
                                    Text("ID: abc123")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                    Text("오늘의 한마디: 팟팅!!")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                
                    
                    Section {
                        NavigationLink(destination: SettingsNotification()) {
                            HStack {
                                ZStack {
                                    Image(systemName: "app.badge").font(.callout)
                                }.frame(width: 28, height: 28).background(Color.white).cornerRadius(6)
                                Text("알림 설정")
                            }
                        }
                        
                        NavigationLink(destination: SettingsPhoto()) {
                            HStack {
                                ZStack {
                                    Image(systemName: "camera").font(.callout)
                                }.frame(width: 28, height: 28).background(Color.white).cornerRadius(6)
                                Text("사진 설정")
                            }
                        }
                        
                        NavigationLink(destination: SettingsAbout()) {
                            HStack {
                                ZStack {
                                    Image(systemName: "gear").font(.callout)
                                }.frame(width: 28, height: 28).background(Color.white).cornerRadius(6)
                                Text("눈바디 1.0")
                            }
                        }
                    }
                }
                .navigationTitle("마이페이지")

                .listStyle(GroupedListStyle())
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }

struct NoonBodySettings_Previews: PreviewProvider {
    static var previews: some View {
        NoonBodySettings()
    }
}

