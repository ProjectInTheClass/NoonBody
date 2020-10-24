//
//  Structs_Enums_Classes.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/16.
//

import Foundation
import SwiftUI

struct recipePost: Identifiable {
    var id = UUID()
    
    var postingUser: String
    var description: String
    var numberOfLikes: Int
    var image: Image
}

struct friendsPost: Identifiable {
    var id = UUID()
    
    var friendName: String
    var friendDescription: String
    var friendNumberOfLikes: Int
    var friendImage: Image
}

struct myImagePost: Identifiable {
    var id = UUID()
    
    var myImage: Image
    var myWeight: Double
}

struct dietPost: Identifiable {
    var id = UUID()
    
    var dietWhen: String
    var dietTime: String
    var dietText: String
    var dietImage: Image
    var dietDate: String
}

struct diaryPost: Identifiable {
    var id = UUID()
    
    var diaryDate: String
    var diaryFull: String
    var diaryShare: String
    var diaryWeight: Double
    var diaryMuscle: Double
    var diaryFat: Double
    var diaryImage: Image
}

//In global environment we need to store the users document.doc
//to be the value of a new property in the user structure
//-> this will be later used to create colletions and paths
class user : NSObject, Identifiable, NSCoding {
    var id = UUID()
    var establishedID: String
    var username: String
    var password: String
    var name: String
    var email: String
    
    init(username:String, password:String, name:String, email:String, _ establishedID:String?){
        self.username = username
        self.password = password
        self.name = name
        self.email = email
        
        if let establishedID = establishedID{    //not nil
            self.establishedID = establishedID
        }else{
            self.establishedID = id.uuidString
        }
    }
    
    required init(coder aDecoder: NSCoder){
        id = aDecoder.decodeObject(forKey: "id") as? UUID ?? UUID()
        establishedID = aDecoder.decodeObject(forKey: "establishedID") as? String ?? ""
        username = aDecoder.decodeObject(forKey: "username") as? String ?? ""
        password = aDecoder.decodeObject(forKey: "password") as? String ?? ""
        name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        email = aDecoder.decodeObject(forKey: "email") as? String ?? ""
        
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(establishedID, forKey: "establishedID")
        aCoder.encode(username, forKey: "username")
        aCoder.encode(password, forKey: "password")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(email, forKey: "email")
    }
}

class GlobalEnvironment: ObservableObject{
    
    @Published var currentUser: user = user.init(username: "", password: "", name: "", email: "", nil)
}

var lightBlue = Color.init(red: 91/255, green: 152/255, blue: 198/255)
var darkBlue = Color.init(red: 47/255, green: 75/255, blue: 135/255)
var vDarkBlue = Color.init(red: 2/255, green: 51/255, blue: 92/255)
