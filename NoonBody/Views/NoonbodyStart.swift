//
//  NoonbodyStart.swift
//  NoonBody
//
//  Created by Jen on 2020-10-06.
//

import SwiftUI
import Firebase
import SPAlert

struct NoonbodyStart: View {
    
    //sign up
    @State private var name:String = "test1"
    @State private var username:String = "test1"
    @State private var password:String = "test1"
    @State private var email:String = "test1"
    
    @State private var docRef:DocumentReference!
    
    //login
    @EnvironmentObject var env: GlobalEnvironment
    
    @State private var signUp_visible = false
    
    
    @State private var isLoggedIn = false
    
    @State var isHidden: Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
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
                
                
                NavigationLink(destination: TabbedRootView(), isActive: $isLoggedIn){
                    
                    Button(action: {
                        
                        //sign up
                        let dataToSave:[String:Any] = [
                            "username":self.username,
                            "password":self.password,
                            "name":self.name,
                            "email":self.email
                        ]
                        print("setting ref")
                        self.docRef = Firestore.firestore().document("users/\(UUID().uuidString)")
                        
                        print("setting data")
                        self.docRef.setData(dataToSave){ (error) in
                            if let error = error{
                                print("error = \(error)")
                            }else{
                                let alertView = SPAlertView(title: "Account created successfully", message: "Your login query came back positive", preset: SPAlertPreset.done)
                                alertView.duration = 3
                                alertView.present()
                                print("no error")
                            }
                        }
                        
                        //login
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
                                                email: document.data()["email"] as? String ?? "",
                                                publishedNoonBodys: document.data()["publishedNoonBodys"] as? [String] ?? [],
                                                document.documentID
                                            )
                                            
                                            
                                            //Login happens here! - This is where you ar right before ou flip to the next screen
                                            self.env.save_UserDefaults()
                                            self.isLoggedIn = true
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
                        .foregroundColor(.white)
                        
                    }).background(lightBlue).cornerRadius(25).padding()
                }.onAppear(){
                    
                    if let lastLogin_objects = UserDefaults.standard.object(forKey: "lastLogin_objects") as? Data{
                        do{
                            if let lastSession = try
                                NSKeyedUnarchiver
                                .unarchiveTopLevelObjectWithData(lastLogin_objects) as?
                                [String:Any?]{
                                
                                if let rememberedUser = lastSession["lastLogin_user"] as? user {
                                    print("logged in successful whit rememvered user")
                                    print(rememberedUser)
                                    self.env.currentUser = rememberedUser
                                    self.env.initializeListener_currentUser()
                                }else{
                                    print("couldn't unwrap user")
                                    print(lastSession)
                                    print(lastSession["lastLogin_user"])
                                }
                                
                                self.isLoggedIn = true
                                print("logged in successfully")
                            }
                        }catch{
                            print("couldn't unwrap data/last session")
                        }
                    }else{
                        print("couldn't unwrap data/lastLogin_objects")
                    }
                }
            }.background(Color("secondaryOrange"))
            
        }.navigationBarTitle("").navigationBarHidden(true)
        
            
    }
}

struct NoonbodyStart_Previews: PreviewProvider {
    static var previews: some View {
        NoonbodyStart()
    }
}
