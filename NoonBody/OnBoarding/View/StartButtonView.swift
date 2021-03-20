//
//  StartButtonView.swift
//  Onboarding
//
//  Created by Jen on 2021-02-02.
//

import SwiftUI
import Firebase
import SPAlert

struct StartButtonView: View {
    // MARK: - PROPERTIES
    
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    let number = Int.random(in: 0..<1000000)
    
    //sign up
    @State private var name:String = ""
    @State private var username:String = ""
    @State private var password:String = ""
    @State private var email:String = ""
    
    @State private var docRef:DocumentReference!
    
    //login
    @EnvironmentObject var env: GlobalEnvironment
    
    @State private var signUp_visible = false
    
    
    @State private var isLoggedIn = false
    
    @State var isHidden: Bool = false
    
    // MARK: - BODY
    var body: some View {
        
        NavigationLink(destination: TabbedRootView(), isActive: $isLoggedIn){
            
            Button(action: {
                
                //sign up
                let dataToSave:[String:Any] = [
                    "username":"test\(number)",
                    "password":"test\(number)",
                    "name":"test\(number)",
                    "email":"test\(number)"
                ]
                print("setting ref")
                self.docRef = Firestore.firestore().document("users/\(UUID().uuidString)")
                
                print("setting data")
                self.docRef.setData(dataToSave){ (error) in
                    if let error = error{
                        print("error = \(error)")
                    }else{
//                                let alertView = SPAlertView(title: "Account created successfully", message: "Your login query came back positive", preset: SPAlertPreset.done)
//                                alertView.duration = 3
//                                alertView.present()
                        print("no error")
                    }
                }
                
                //login
                Firestore.firestore().collection("users").whereField("username", isEqualTo: "test\(number)").getDocuments(){ (querySnapshot, err) in
                    
                    if let err = err{
                        print("Error getting documents: \(err)")
                    }else{
                        if querySnapshot!.documents.count <= 0{
                            print("No users found")
//                                    let alertView = SPAlertView(title: "No users found", message: "No users have the username you entered", preset: SPAlertPreset.error)
//                                    alertView.duration = 3
//                                    alertView.present()
                        }else if querySnapshot!.documents.count > 1{
                            print("Multiple accounts exist with this username")
//                                    let alertView = SPAlertView(title: "Something went wrong", message: "Multiple accounts exist with this username", preset: SPAlertPreset.error)
//                                    alertView.duration = 3
//                                    alertView.present()
                        }else {
                            
                            for document in querySnapshot!.documents {
                                print("\(document.documentID) => \(document.data())")
                                if document.data()["password"] as? String ?? "" == ("test\(number)"){
                                    self.env.currentUser = user(
                                        username: document.data()["username"] as? String ?? "",
                                        password: document.data()["password"] as? String ?? "",
                                        name: document.data()["name"] as? String ?? "",
                                        email: document.data()["email"] as? String ?? "",
                                        publishedNoonBodys: document.data()["publishedNoonBodys"] as? [String] ?? [],
                                        publishedDiets: document.data()["publishedDiets"] as? [String] ?? [],
                                        document.documentID
                                    )
                                    
                                    
                                    //Login happens here! - This is where you ar right before ou flip to the next screen
                                    self.env.save_UserDefaults()
                                    self.isLoggedIn = true
                                    
                                    isOnboarding = false
                                }else{
//                                            let alertView = SPAlertView(title: "password doesn't match", message: nil, preset: SPAlertPreset.error)
//                                            alertView.duration = 3
//                                            alertView.present()
                                    
                                }
                            }
                        }
                        
                    }
                }
            }, label: {
                HStack(spacing: 8) {
                    Text("Start")
                    
                    Image(systemName: "arrow.right.circle")
                        .imageScale(.large)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(
                    Capsule().strokeBorder(Color.white, lineWidth: 1.25))
                
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
        
        
        
        
        Button(action: {
            isOnboarding = false
        }) {
            HStack(spacing: 8) {
                Text("Start")
                
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule().strokeBorder(Color.white, lineWidth: 1.25))
        } //: BUTTON
        .accentColor(Color.white)
    }
}

// MARK: - PREVIEW

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
