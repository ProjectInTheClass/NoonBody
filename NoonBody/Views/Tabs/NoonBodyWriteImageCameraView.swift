//
//  NoonBodyWriteImageCameraView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/07.
//

import SwiftUI


struct NoonBodyWriteImageCameraView: View {
    @State private var showYPImagePickerView = true

        var body: some View {
            VStack {
                Button(action: {
                    self.showYPImagePickerView.toggle()
                }, label: { Text("Show Square").font(.title) })

                if showYPImagePickerView {
                   
                }
            }

        }
}



struct NoonBodyWriteImageCameraView_Previews: PreviewProvider {
    static var previews: some View {
        NoonBodyWriteImageCameraView()
    }
}
