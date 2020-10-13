//
//  NoonBodyTab.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/12.
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
                
//                NavigationLink(destination: NoonBodyWrite()) {
//                    HStack {
//                        Image(systemName: "square.and.pencil")
//                            .font(.system(size: 30))
//                        Text("눈바디 기록하기")
//                            .bold()
//                            .font(.system(size: 30))
//                    }.frame(minWidth: 0, maxWidth: 250)
//                    .padding()
//                    .foregroundColor(.white)
//                    .background(Color("primaryOrange"))
//                    .cornerRadius(40)
//                    .padding(.horizontal, 20)
//                }
                
                
                VStack(alignment: .leading) {
                    SlidingTabView(selection: self.$selectedTabIndex, tabs: ["비교하기", "모아보기"])
                    if selectedTabIndex == 0{
                        CompareView()
                    }else{
                        CollectionView()
                    }
                    
                    Spacer()
                }
                    .animation(.none)
                
//                HStack {
//                    Button(action: {
//                        index = 0
//                    }, label: {
//
//                        HStack{
//                            Text("비교하기")
//                                .bold()
//                                .font(.system(size: 30))
//                        }
//
//                    })
//
//                    .buttonStyle(ButtonSelected())
//
//
//                    Button(action: {
//
//                        index = 1
//
//                    }, label: {
//
//                        HStack{
//                            Text("모아보기")
//                                .bold()
//                                .font(.system(size: 30))
//                        }
//
//                    }).buttonStyle(ButtonNonSelected())
//                }
                
//                Divider().background(Color(.gray))
                
//                Picker(selection: $index, label: Text("")) {
//                    ForEach(0..<contents.count) { index in
//                        Text(self.contents[index]).tag(index)
//                    }
//                }.pickerStyle(SegmentedPickerStyle())
//                .frame(height: 100)
                
//                Form{
//                    if index == 0{
//                        CompareView()
//                    }else{
//                        CollectionView()
//                    }
//
//                }

                    
            }.background(Color("secondaryOrange"))
            .navigationTitle("눈바디")
            .navigationBarItems(trailing: WriteButton())
            
        }
    }
}

struct NoonBodyTab_Previews: PreviewProvider {
    static var previews: some View {
        NoonBodyTab()
    }
}

fileprivate struct WriteButton: View{
    
    var body: some View{
        
        NavigationLink(destination: NoonBodyWrite()) {
            HStack {
                Image(systemName: "square.and.pencil")
                    .font(.system(size: 20))
                Text("기록하기")
                    .bold()
                    .font(.system(size: 20))
            }.frame(minWidth: 0, maxWidth: 250)
            .padding()
            .foregroundColor(Color("primaryOrange"))
//            .background(Color("primaryOrange"))
            .cornerRadius(40)
        }
    
    }
}

//fileprivate struct SelectedButton: View{
//    @Binding var condition: Bool
//
//    var body: some View{
//        Button(action: {
//            self.condition = false
//        }, label: {
//            Text("취소")
//                .bold()
//                .font(.system(size: 30))
//        })
//        .frame(minWidth: 0, maxWidth: .infinity)
//        .padding()
//        .foregroundColor(Color("primaryOrange"))
//    }
//}
//
//fileprivate struct NonSelectedButton: View{
//    @Binding var condition: Bool
//
//    var body: some View{
//        Button(action: {
//            self.condition = false
//        }, label: {
//            Text("저장")
//                .bold()
//                .font(.system(size: 30))
//        })
//        .frame(minWidth: 0, maxWidth: .infinity)
//        .padding()
//        .foregroundColor(.gray)
//    }
//}


