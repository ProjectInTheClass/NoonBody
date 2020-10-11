//
//  TextView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/10.
//

import UIKit
import SwiftUI

//swiftUI에서 UIkit을 사용하려면 이 프로토콜을 구현해야 함
struct TextView: UIViewRepresentable {
    @Binding var text: String
    
    //프로토콜이 요구하는 멤버들 구현
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let myTextView = UITextView()
        myTextView.delegate = context.coordinator
        
        return myTextView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context){
        uiView.text = text
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: TextView
        
        init(_ uiTextView: TextView){
            self.parent = uiTextView
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
        }
    }
}

