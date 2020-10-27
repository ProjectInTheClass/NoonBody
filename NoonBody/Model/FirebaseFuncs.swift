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
func firestoreSubmit_data(docRef_string:String, dataToSave:[String:Any], completion: @escaping (Any) -> Void, showDetails: Bool = false){
    
    let docRef = Firestore.firestore().document(docRef_string)
    print("setting data")
    docRef.setData(dataToSave){ (error) in
        if let error = error {
            print("error = \(error)")
            
        }else{
            print("data uploaded successfully")
            if showDetails{
                print("dataUploaded = \(dataToSave)")
            }
            completion(true)
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

//func uploadMedia(completion: @escaping (_ url: String?) -> Void) {
//    let storageRef = Storage.storage().reference().child("myImage.png")
//    if let imageData = image.jpegData(compressionQuality: 1){
//        storageRef.put(uploadData, metadata: nil) { (metadata, error) in
//            if error != nil {
//                print("error")
//                completion(nil)
//            } else {
//                completion((metadata?.downloadURL()?.absoluteString)!))
//                // your uploaded photo url.
//            }
//       }
// }

func uploadImage(_ referenceString:String, image:UIImage, completion: @escaping (Any) -> Void, showDetails: Bool = false){
    if let imageData = image.jpegData(compressionQuality: 1){

        FirebaseStorageManager().uploadImageData(data: imageData, serverFileName: "myimage.png") { (isSuccess, url) in
                     print("uploadImageData: \(isSuccess), \(url)")
                     completion(url)
               }

//        let storage = Storage.storage()
//        storage.reference().child(referenceString).putData(imageData, metadata: nil){
//            (strgMtdta, err) in
//
//            if let err = err {
//                print("an error has occurred - \(err.localizedDescription)")
//
//            } else {
//                print("image uploaded successfully")
//            }
//        }
    } else {
        print("couldn't unwrap image as data")
        completion(true)
    }


}
