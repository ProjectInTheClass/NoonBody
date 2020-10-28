//
//  FirebaseFuncs.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/26.
//

import Foundation
import SwiftUI
import Combine
import FirebaseStorage
import Firebase

//funtion to submit data
func FirebaseDataSubmit(storageRef_string:String, docRef_string:String, dataToSave:[String:Any], image : UIImage, completion : @escaping (Any)-> Void, showDetails: Bool = false){
    
    let db = Firestore.firestore()
    
    let storage = Storage.storage().reference()
    
    let uid = GlobalEnvironment().currentUser.establishedID
    
    if let imageData = image.jpegData(compressionQuality: 1){
    
        storage.child(storageRef_string).child(getDate(num: 0)).putData(imageData, metadata: nil) { (_, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            
            storage.child(storageRef_string).child(getDate(num: 0)).downloadURL { (url, err) in
                
                if err != nil{
                    
                    print((err?.localizedDescription)!)
                    return
                }
                
                db.document(docRef_string).setData(["dataToSave":dataToSave, "noonbodyPic":"\(url!)", "uid":uid]) { (err) in
                    
                    if err != nil{
                        
                        print((err?.localizedDescription)!)
                        return
                    }
                    
                    else{
                        print("data uploaded successfully")
                        if showDetails{
                            print("dataUploaded = \(dataToSave)")
                        }
                        completion(true)
                    }
                    
                }
            }
        }
    }
}




func firestoreUpdate_data(docRef_string:String, dataToUpdate:[String:Any], completion: @escaping (Any) -> Void, showDetails: Bool = false){
    
    let docRef = Firestore.firestore().document(docRef_string)
    print("updating data")
    docRef.setData(dataToUpdate, merge: true){ (error) in
        if let error = error {
            print("error = \(error)")
            
        }else{
            print("data uploaded successfully")
            if showDetails{
                print("dataUploaded = \(dataToUpdate)")
            }
            completion(true)
        }
    }
}
