//
//  NoonBodySettings.swift
//  NoonBody
//
//  Created by Jen on 2020-10-11.
//

import SwiftUI

struct NoonBodySettings: View {
    @State private var isLoggedIn = false
    
    @State var username: String = ""
    @State private var isPrivate: Bool = true
    @State private var notificationsEnable:Bool = false
    @State private var previewIndex = 0
    var previewOptions = ["Always", "When Unlocked", "Never"]
    
    @State private var isExpanded = false
//    let sites = ["Site 1", "Site 2", "Site 3", "Site4"]
    @State private var isToggleNoonBody = true
    @State private var isToggleDiet = true
    @State private var isToggleFriend = false
    
    @State private var isToggleBreakfast = true
    @State private var isToggleLunch = false
    @State private var isToggleDinner = false
    
    @State private var isTogglePicture = false
    
    init(){
                UITableView.appearance().backgroundColor = .clear
                
            }
    
    var body: some View {
            NavigationView {
                VStack{
                    Form {
                        Section {
                            NavigationLink(destination: SettingsAbout()) {
                                HStack {
                                    Image(systemName: "person.circle.fill")
                                        .font(.system(size: 65))
                                        .foregroundColor(.gray)
                                    VStack(alignment:.leading, spacing: 3) {
                                        Text("test1")
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
                            DisclosureGroup(
                                isExpanded: $isExpanded,
                                content: {
                                    Toggle("눈바디 알림 수신", isOn: $isToggleNoonBody)
                                    Toggle("식단 알림 수신", isOn: $isToggleDiet)
                                    if isToggleDiet{
                                        Toggle("아침 알림 수신", isOn: $isToggleBreakfast)
                                        Toggle("점심 알림 수신", isOn: $isToggleLunch)
                                        Toggle("저녁 알림 수신", isOn: $isToggleDinner)
                                    }
                                    Toggle("친구 소식 알림 수신", isOn: $isToggleFriend)
                                    
    //                                ForEach(sites, id: \.self){site in
    //                                    Text(site)
    //                                }
                                },
                                label: {
                                    HStack {
                                        ZStack {
                                            Image(systemName: "app.badge").font(.callout)
                                        }.frame(width: 28, height: 28).background(Color.white).cornerRadius(6)
                                        Text("알림 수신 설정")
                                    }
                                }
                            ).padding(.all, 10)
                            
                            
                            
    
                            
                            ContentView()
                            
   
                        }
                    }.background(Color("secondaryOrange"))
                    .navigationTitle("마이페이지")
                    

                    .listStyle(GroupedListStyle())
                    
                    NavigationLink(destination: LoginView(), isActive: $isLoggedIn) {
                        Button(action: {
                            self.isLoggedIn = true
                        }, label: {
                            HStack {
                                Text("Login")
                                Image(systemName: "arrow.right")
                            }.frame(height: 50)
                            .frame(minWidth:0, maxWidth: .infinity)
                            .foregroundColor(Color.white)
                            
                        }).background(Color("primaryOrange")).cornerRadius(25).padding()
                    }
                }.background(Color("secondaryOrange"))
                
                
                
            }.navigationBarTitle("").navigationBarHidden(true)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }

struct NoonBodySettings_Previews: PreviewProvider {
    static var previews: some View {
        NoonBodySettings()
    }
}

struct ContentView: View {
    @State private var isTogglePicture = true

    var body: some View {
        Toggle(isOn: $isTogglePicture) {
            HStack {
                ZStack {
                    Image(systemName: "camera").font(.callout)
                }.frame(width: 28, height: 28).background(Color.white).cornerRadius(6)
                Text("사진 자동 저장")
            }.padding(.all, 10)
        }
    }
}

