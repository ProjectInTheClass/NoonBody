//
//  NoonBodyCommunity.swift
//  NoonBody
//
//  Created by Jen on 2020-10-11.
//

import SwiftUI

struct NoonBodyCommunity: View {
    var body: some View {
        NavigationView {
            ScrollView() { // hides  arrow
                    NavigationLink(destination: Text("Hahaha")) {
                            HStack (spacing: 18) {
                                VStack (alignment: .leading, spacing: 2) {
                                    HStack {
                                        Text("username")
                                        Text("Time").font(.caption).foregroundColor(.secondary)
                                    }
                                    Text("Message Content Goes Here.").font(.footnote)
                                }
                                Spacer()
                                Image(systemName: "square.fill")
                                    .resizable()
                                    .frame(width: 80, height: 80)
//                                    .aspectRatio(contentMode: .fit)
                                    .padding(.horizontal, -12)
                                    .background(Color.gray)

                            } // HStack ends
                    }    // NavLink ends here
            .navigationBarTitle("Community")
            }
        }
    }
}


 
struct NoonBodyCommunity_Previews: PreviewProvider {
    static var previews: some View {
        NoonBodyCommunity()
    }
}
