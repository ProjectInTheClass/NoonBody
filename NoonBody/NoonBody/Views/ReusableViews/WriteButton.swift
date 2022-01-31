//
//  WriteButton.swift
//  NoonBody
//
//  Created by 윤진영 on 2021/12/22.
//

import SwiftUI

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
            .cornerRadius(40)
        }
    
    }
}
