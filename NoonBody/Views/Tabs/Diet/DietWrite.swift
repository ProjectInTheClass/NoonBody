//
//  DietWrite.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/12.
//

import SwiftUI
import SwiftUIX

struct DietWrite: View {
    @State private var showSheet:Bool = false
    @State private var showImagePicker:Bool = false
    @State private var sourceType:UIImagePickerController.SourceType = .camera
    
    @State private var image: UIImage?
    
    @State private var showChooseIndex = 0
    var showChoose = ["공개", "비공개"]
    
    @State private var timeIndex = 0
    var time = ["아침", "점심", "저녁", "간식"]
    
    @State private var content: String = ""
    
    @State private var showGreeting = true

    
    var body: some View {
      
            
        ScrollView {
            VStack{
                    Spacer()
                    
                    ZStack{
                        Image(uiImage: image ?? UIImage(imageLiteralResourceName: "gray_background"))
                            .resizable()
                            .frame(width: 300, height: 250)
                            .cornerRadius(30)
                        
                        
                        Button(action: {
                            self.showSheet = true
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(Color.gray)
                        }.padding()
                        .actionSheet(isPresented: $showSheet, content: {
                            ActionSheet(title: Text("Select Photo"),
                                        message: Text("Choose"), buttons: [
                                            .default(Text("Photo Library")){
                                                self.showImagePicker = true
                                                self.sourceType = .photoLibrary
                                            },
                                            .default(Text("Camera")){
                                                self.showImagePicker = true
                                                self.sourceType = .camera
                                            },
                                            .cancel()
                                        ])
                        })
                    }
                    

                    
                    VStack {
    //                    Toggle(isOn: $showGreeting) {
    //                                    Text("공개")
    //                                }.padding()
    //
    //                                if showGreeting {
    ////                                    Text("공개")
    //                                }
                        
                        Picker(selection: $showChooseIndex, label: Text("What is your favorite color?")) {
                            ForEach(0..<showChoose.count) { index in
                                Text(self.showChoose[index]).tag(index)
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                        .padding(.leading)
                        .padding(.trailing)
                        .padding(.top)

    //                    Text("Value: \(showChoose[showChooseIndex])")
                    }
                    
                    Divider()
                    
                    VStack {
                        Picker(selection: $timeIndex, label: Text("What is your favorite color?")) {
                            ForEach(0..<time.count) { index in
                                Text(self.time[index]).tag(index)
                            }
                        }.pickerStyle(SegmentedPickerStyle())

    //                    Text("Value: \(time[timeIndex])")
                    }
                    
                    Divider()
                    
                    TextView("소감 한마디! (선택)", text: $content)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        //context 속성은 published 특성으로 선언했으므로
                        //속성에 저장된 값이 업데이트되면 padding도 함께 업데이트 됨
                        .padding(.keyboard)
                        .animation(.easeInOut(duration: 0.3))
                        .onTapGesture {
                                    self.endEditing(true)
                                    
                                 }
                    
                    
                    
                    
                    
                }
    //            .onTapGesture {
    //
    //                  self.endTextEditing()
    //            }
                
                .navigationBarTitle("식단 기록하기", displayMode: .inline)
                .navigationBarItems(trailing: Text("저장"))
                
            .sheet(isPresented: $showImagePicker, content: {
                VStack{
                    Text("음식 사진을 선택해주세요.")
                        .font(.title)
                        .foregroundColor(Color("primaryOrange"))
                        .padding()
                    
                    ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)
                }
                
        })
        }.background(Color("secondaryOrange"))
    }
}

struct DietWrite_Previews: PreviewProvider {
    static var previews: some View {
        DietWrite()
    }
}

extension View {
  func endTextEditing() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
        to: nil, from: nil, for: nil)
  }
}

