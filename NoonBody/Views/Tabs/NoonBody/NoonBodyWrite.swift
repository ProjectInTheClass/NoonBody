//
//  NoonBodyWrite.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/12.
//

import SwiftUI

struct NoonBodyWrite: View {
    
    @State private var showSheet:Bool = false
    @State private var showImagePicker:Bool = false
    @State private var sourceType:UIImagePickerController.SourceType = .camera
    
    @State private var image: UIImage?
    
    var body: some View {
        NavigationView{
            
            VStack{
                
                Image(uiImage: image ?? UIImage(named: "placeholder")!)
                    .resizable()
                    .frame(width: 300, height: 300)
                
                
                Button("Choose Picture"){
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
                
            }
            
            .navigationTitle("CameraDemo")
            
        }.sheet(isPresented: $showImagePicker, content: {
            ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)
        })
    }
}

struct NoonBodyWrite_Previews: PreviewProvider {
    static var previews: some View {
        NoonBodyWrite()
    }
}
