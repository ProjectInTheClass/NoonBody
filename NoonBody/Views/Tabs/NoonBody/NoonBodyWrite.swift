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
    
    @State private var showChooseIndex = 0
    var showChoose = ["공개", "비공개"]
    
    @State private var content: String = ""

    
    var body: some View {
      
            
            VStack{
                
                Image(uiImage: image ?? UIImage(systemName: "photo")!)
                    .resizable()
                    .frame(width: 100, height: 100)
                
                
                Button("사진 선택"){
                    self.showSheet = true
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
                
                VStack {
                    Picker(selection: $showChooseIndex, label: Text("What is your favorite color?")) {
                        ForEach(0..<showChoose.count) { index in
                            Text(self.showChoose[index]).tag(index)
                        }
                    }.pickerStyle(SegmentedPickerStyle())

//                    Text("Value: \(showChoose[showChooseIndex])")
                }
                
                TextView(text: $content)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    //context 속성은 published 특성으로 선언했으므로
                    //속성에 저장된 값이 업데이트되면 padding도 함께 업데이트 됨
                    .padding(.keyboard)
                    .animation(.easeInOut(duration: 0.3))
                
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


