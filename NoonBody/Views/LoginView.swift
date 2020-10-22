//
//  LoginView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/18.
//

import SwiftUI
import Firebase
import SPAlert

struct LoginView: View {
    @EnvironmentObject var env: GlobalEnvironment
    
    @State private var signUp_visible = false
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    @State private var isLoggedIn = false
    
    @State var isHidden: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [darkBlue, vDarkBlue]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                
                VStack(spacing:0){
                    VStack {
                        Text("체중보단 눈바디")
                            .padding(15)
                            .foregroundColor(Color("primaryOrange"))
                        Text("NOONBODY")
                            .font(.largeTitle)
                            .foregroundColor(Color("primaryOrange"))
                            .fontWeight(.bold)
                    }.frame(height: 200)
                    
                    TextField("Username", text: $username)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color.clear)
                        .frame(height: 50)
                        .overlay(
                            Capsule()
                                .stroke(lineWidth: 2)
                                .foregroundColor(.white))
                        .padding()
                        
                    
                    SecureField("Password", text: $password)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color.clear)
                        .frame(height: 50)
                        .overlay(
                            Capsule()
                                .stroke(lineWidth: 2)
                                .foregroundColor(.white))
                        .padding()
                    
                    NavigationLink(
                        destination: TabbedRootView(),
                        isActive: $isLoggedIn){
                        
                        Button(action: {
                            Firestore.firestore().collection("users").whereField("username", isEqualTo: self.username).getDocuments(){ (querySnapshot, err) in
                                
                                if let err = err{
                                    print("Error getting documents: \(err)")
                                }else{
                                    if querySnapshot!.documents.count <= 0{
                                        let alertView = SPAlertView(title: "No users found", message: "No users have the username you entered", preset: SPAlertPreset.error)
                                        alertView.duration = 3
                                        alertView.present()
                                    }else if querySnapshot!.documents.count > 1{
                                        let alertView = SPAlertView(title: "Something went wrong", message: "Multiple accounts exist with this username", preset: SPAlertPreset.error)
                                        alertView.duration = 3
                                        alertView.present()
                                    }else {
                                        
                                        for document in querySnapshot!.documents {
                                            print("\(document.documentID) => \(document.data())")
                                            if document.data()["password"] as? String ?? "" == (self.password){
                                                self.env.currentUser = user(
                                                    username: document.data()["username"] as? String ?? "",
                                                    password: document.data()["password"] as? String ?? "",
                                                    name: document.data()["name"] as? String ?? "",
                                                    email: document.data()["email"] as? String ?? ""
                                                )
                                                isLoggedIn = true
                                            }else{
                                                let alertView = SPAlertView(title: "password doesn't match", message: nil, preset: SPAlertPreset.error)
                                                alertView.duration = 3
                                                alertView.present()
                                            }
                                        }
                                    }
                                    
                                }
                            }
                        }, label: {
                            HStack {
                                Text("Login")
                                Image(systemName: "arrow.right")
                            }.frame(height: 50)
                            .frame(minWidth:0, maxWidth: .infinity)
                            
                        }).background(lightBlue).cornerRadius(25).padding()
                    }
                    
                    
                    
                    Spacer()
                    
                    Text("Don't have an account?").foregroundColor(.white)
                    
                    Button(action: {
                        self.signUp_visible.toggle()
                    }, label: {
                        Text("Sign up?").padding()
                    }).background(Color.clear)
                    .foregroundColor(lightBlue)
                    .sheet(isPresented: $signUp_visible, content: {
                        SignUp()
                    })
                    
                    Spacer()
                }.background(Color.clear).foregroundColor(.white)
            }.navigationBarTitle("").navigationBarHidden(isHidden)
            .onAppear { self.isHidden = true }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
