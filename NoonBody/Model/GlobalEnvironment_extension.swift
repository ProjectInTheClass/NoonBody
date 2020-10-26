//
//  GlobalEnvironment_extension.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/22.
//

import Foundation
import SwiftUI
import Combine
import FirebaseStorage
import Firebase

extension GlobalEnvironment{
    
    //maintain who is logged in
    func save_UserDefaults(){
        
        let data_Dictionary:[String:Any?] = [
            "lastLogin_user":currentUser,
//            "lastLogin_username":currentUser.username,
//            "lastLogin_password":currentUser.password,
        ]

        let save_UserDefaults = UserDefaults.standard
        
        do{
            
            let sessionData = try
                NSKeyedArchiver.archivedData(withRootObject: data_Dictionary, requiringSecureCoding: false)
            save_UserDefaults.set(sessionData, forKey: "lastLogin_objects")
            print("saved successful")
        }catch{
            print("could't write file")
    }
    
}

    func initializeListener_currentUser(){
        Firestore.firestore().document("users/\(self.currentUser.establishedID)")
            .addSnapshotListener { querySnapshot, error in
                guard let document = querySnapshot else {
                    print("Error fetching documents: \(error!)")
                    return
                }
                
                print("new information found with listener")
                print("\(document.documentID) => \(document.data())")
                if let thisData = document.data() {
                    
                    self.currentUser = user.init(
                        username: thisData["username"] as? String ?? "",
                        password: thisData["password"] as? String ?? "",
                        name: thisData["name"] as? String ?? "",
                        email: thisData["email"] as? String ?? "",
                        publishedNoonBodys: thisData["publishedNoonBodys"] as? [String] ?? [],
                        document.documentID
                    )
                    
                    self.save_UserDefaults()
                }
                
                
                
        }
    }
}


