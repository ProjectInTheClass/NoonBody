//
//  NoonbodyStart.swift
//  NoonBody
//
//  Created by Jen on 2020-10-06.
//

import SwiftUI

struct NoonbodyStart: View {
    var body: some View {
        Color("secondaryOrange")
        .overlay(
            VStack {
                Text("체중보단 눈바디")
                    .padding(15)
                    .foregroundColor(Color("primaryOrange"))
                Text("NOONBODY")
                    .font(.largeTitle)
                    .foregroundColor(Color("primaryOrange"))
                    .fontWeight(.bold)
            })
        .edgesIgnoringSafeArea(.vertical)
            
    }
}

struct NoonbodyStart_Previews: PreviewProvider {
    static var previews: some View {
        NoonbodyStart()
    }
}
