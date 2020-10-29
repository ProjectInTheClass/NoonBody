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
func FirebaseNoonBodyDataSubmit(storageRef_string:String, docRef_string:String, diaryDate:String, diaryFull:String, diaryShare:String, diaryWeight:Double, diaryMuscle:Double, diaryFat:Double, image : UIImage, completion : @escaping (Any)-> Void, showDetails: Bool = true){
    
    let db = Firestore.firestore()
    
    let storage = Storage.storage().reference()
    
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
            
                db.document(docRef_string).setData(["diaryDate":diaryDate, "diaryFull":diaryFull, "diaryShare":diaryShare, "diaryWeight":diaryWeight, "diaryMuscle":diaryMuscle, "diaryFat":diaryFat, "noonbodyPic":"\(url!)"]) { (err) in
                    
                    if err != nil{
                        
                        print((err?.localizedDescription)!)
                        return
                    }
                    
                    else{
                        print("noonbody data uploaded successfully")
                        if showDetails{
                            print("dataUploaded = \(diaryDate), \(diaryFull), \(diaryShare), \(diaryWeight), \(diaryMuscle), \(diaryFat), \(url)")
                        }
                        completion(true)
                    }
                    
                }
                
            }
        }
    }
}

func FirebaseDietDataSubmit(storageRef_string:String, docRef_string:String, diaryDate:String, dietWhen:String, dietTime:String, dietText:String, image : UIImage, completion : @escaping (Any)-> Void, showDetails: Bool = true){
    
    let db = Firestore.firestore()
    
    let storage = Storage.storage().reference()
    
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
                
               
                db.document(docRef_string).setData(["dietDate":diaryDate, "dietWhen":dietWhen, "dietTime":dietTime, "dietText":dietText, "dietImage":"\(url!)"]) { (err) in
                    
                    if err != nil{
                        
                        print((err?.localizedDescription)!)
                        return
                    }
                    
                    else{
                        print("diet data uploaded successfully")
                        if showDetails{
                            print("dataUploaded = \(diaryDate), \(dietWhen), \(dietTime), \(dietText), \(url)")
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
