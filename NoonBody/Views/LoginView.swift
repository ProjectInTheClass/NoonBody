//
//  LoginView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/18.
//

import SwiftUI

struct LoginView: View {
    @State private var signUp_visible = false
    
    var body: some View {
        VStack(spacing:0){
            Image("gray_background")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(height:350)
                .frame(minWidth:0, maxWidth:.infinity)
                .background(Color.blue)
                .edgesIgnoringSafeArea(.top)
            
            TextField("Username", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .padding()
                .background(Color.clear)
            TextField("Password", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .padding()
                .background(Color.clear)
            
            Spacer().frame(height:20)
            
            Button(action: {
                
            }, label: {
                HStack {
                    Text("Login")
                    Image(systemName: "arrow.right")
                }.padding()
            }).background(Color.init(red: 0.85, green: 0.85, blue: 0.85))
            .cornerRadius(10)
            
            Spacer()
            
            Button(action: {
                self.signUp_visible.toggle()
            }, label: {
                Text("Sign up?").padding()
            }).background(Color.clear)
            .foregroundColor(Color.init(red: 0.8, green: 0.8, blue: 0.8))
            .sheet(isPresented: $signUp_visible, content: {
                Text("this will be signup")
            })
            
            Spacer()
        }.background(Color.clear)
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
