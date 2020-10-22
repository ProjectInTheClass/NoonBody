//
//  HelperFuncs.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/22.
//

import Foundation
import SwiftUI

extension GlobalEnvironment{
    
    //maintain who is logged in
    func save_UserDefaults(){
        
        let data_Dictionary:[String:Any?] = [
            "lastLogin_username":currentUser.username,
            "lastLogin_password":currentUser.password,
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
