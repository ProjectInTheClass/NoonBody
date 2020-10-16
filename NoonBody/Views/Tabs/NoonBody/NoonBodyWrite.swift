//
//  NoonBodyWrite.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/12.
//

import SwiftUI
import SwiftUIX

struct NoonBodyWrite: View {
    
    @State private var showSheet:Bool = false
    @State private var showImagePicker:Bool = false
    @State private var sourceType:UIImagePickerController.SourceType = .camera
    
    @State private var image: UIImage?
    
//    @State private var showChooseIndex = 0
//    var showChoose = ["공개", "비공개"]
    
    @State private var content: String = "소감 한마디! (선택)"
    
    @State private var showGreeting = true


    
    var body: some View {
      
            
            VStack{
                
                ZStack{
                    Image(uiImage: image ?? UIImage(imageLiteralResourceName: "gray_background"))
                        .resizable()
                        .frame(width: 300, height: 300)
                    
                    
                    Button(action: {
                        self.showSheet = true
                    }) {
                        Image(systemName: "plus")
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
                
                
                TextView(text: $content)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    //context 속성은 published 특성으로 선언했으므로
                    //속성에 저장된 값이 업데이트되면 padding도 함께 업데이트 됨
                    .padding(.keyboard)
                    .animation(.easeInOut(duration: 0.3))
                
                
                VStack {
                    Toggle(isOn: $showGreeting) {
                                    Text("공개")
                                }.padding()

                                if showGreeting {
//                                    Text("공개")
                                }
//                    Picker(selection: $showChooseIndex, label: Text("What is your favorite color?")) {
//                        ForEach(0..<showChoose.count) { index in
//                            Text(self.showChoose[index]).tag(index)
//                        }
//                    }.pickerStyle(SegmentedPickerStyle())

//                    Text("Value: \(showChoose[showChooseIndex])")
                }
                
            }
//            .onTapGesture {
//
//                  self.endTextEditing()
//            }
            .background(Color("secondaryOrange"))
            .navigationBarTitle("눈바디 기록하기", displayMode: .inline)
            .navigationBarItems(trailing: Text("저장"))
            
        .sheet(isPresented: $showImagePicker, content: {
            ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)
        })
    }
}

struct NoonBodyWrite_Previews: PreviewProvider {
    static var previews: some View {
        NoonBodyWrite()
    }
}


