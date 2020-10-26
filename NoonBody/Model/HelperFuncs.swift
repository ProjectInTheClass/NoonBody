//
//  HelperFuncs.swift
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

}

//funtion to submit data
func firestoreSubmit_data(docRef_string:String, dataToSave:[String:Any], completion: @escaping (Any) -> Void, showDetails: Bool = false){
    
    let docRef = Firestore.firestore().document(docRef_string)
    print("setting data")
    docRef.setData(dataToSave){ (error) in
        if let error = error {
            print("error = \(error)")
            completion(error)
        }else{
            print("data uploaded successfully")
            if showDetails{
                print("dataUploaded = \(dataToSave)")
            }
        }
    }
}

func uploadImage(_ referenceString:String, image:UIImage, completion: @escaping (Any) -> Void, showDetails: Bool = false){
    if let imageData = image.jpegData(compressionQuality: 1){
        let storage = Storage.storage()
        storage.reference().child(referenceString).putData(imageData, metadata: nil){
            (strgMtdta, err) in
            
            if let err = err {
                print("an error has occurred - \(err.localizedDescription)")
                completion(err)
            } else {
                print("image uploaded successfully")
            }
        }
    } else {
        print("couldn't unwrap image as data")
    }
    
    
}
