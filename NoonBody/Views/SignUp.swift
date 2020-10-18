//
//  SignUp.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/18.
//

import SwiftUI

struct SignUp: View {
    
    @State private var name:String = ""
    @State private var username:String = ""
    @State private var password:String = ""
    @State private var email:String = ""
    
    var body: some View {
        VStack{
            Text("Sign up")
            TextField("Name", text: $name)
            TextField("Email", text: $email)
            TextField("Username", text: $username)
            TextField("Password", text: $password)
            
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
