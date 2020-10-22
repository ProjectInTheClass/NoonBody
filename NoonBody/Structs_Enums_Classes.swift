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

struct user : Identifiable {
    var id = UUID()
    
    var username: String
    var password: String
    var name: String
    var email: String
}

class GlobalEnvironment: ObservableObject{
    
    @Published var currentUser: user = user.init(username: "", password: "", name: "", email: "")
}

var lightBlue = Color.init(red: 91/255, green: 152/255, blue: 198/255)
var darkBlue = Color.init(red: 47/255, green: 75/255, blue: 135/255)
var vDarkBlue = Color.init(red: 2/255, green: 51/255, blue: 92/255)
