//
//  MyButton.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/12.
//

import SwiftUI

struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: 250)
            .padding()
            .foregroundColor(.white)
            .background(Color("primaryOrange"))
            .cornerRadius(40)
            .padding(.horizontal, 20)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)

    }
}

