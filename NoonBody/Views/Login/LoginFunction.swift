//
//  LoginFunction.swift
//  NoonBody
//
//  Created by 윤진영 on 2021/04/10.
//

import Foundation
import Firebase
import SPAlert


private func Login(){
    
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
}
