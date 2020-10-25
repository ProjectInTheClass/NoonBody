//
//  Post_structs.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/16.
//

import Foundation
import SwiftUI

struct CommunityPost: Identifiable {
    var id = UUID()
    
    var postingUser: String
    var description: String
    var numberOfLikes: Int
    var image: Image
    
    var dictionary: [String: Any]{
        return[
            "id" : id.uuidString,
            "postingUser" : postingUser,
            "description" : description,
            "numberOfLikes" : numberOfLikes
            
        ]
    }
}

struct FriendsPost: Identifiable {
    var id = UUID()
    
    var friendName: String
    var friendDescription: String
    var friendNumberOfLikes: Int
    var friendImage: Image
    
    var dictionary: [String: Any]{
        return[
            "id" : id.uuidString,
            "friendName" : friendName,
            "friendDescription" : friendDescription,
            "friendNumberOfLikes" : friendNumberOfLikes
            
        ]
    }
}

struct MyImagePost: Identifiable {
    var id = UUID()
    
    var myImage: Image
    var myWeight: Double
    
    var dictionary: [String: Any]{
        return[
            "id" : id.uuidString,
            "myWeight" : myWeight
            
        ]
    }
}

struct DietPost: Identifiable {
    var id = UUID()
    
    var dietWhen: String
    var dietTime: String
    var dietText: String
    var dietImage: Image
    var dietDate: String
    
    var dictionary: [String: Any]{
        return[
            "id" : id.uuidString,
            "dietWhen" : dietWhen,
            "dietTime" : dietTime,
            "dietText" : dietText,
            "dietDate" : dietDate
            
        ]
    }
}

struct DiaryPost: Identifiable {
    var id = UUID()
    
    var diaryDate: String
    var diaryFull: String
    var diaryShare: String
    var diaryWeight: Double
    var diaryMuscle: Double
    var diaryFat: Double
    var diaryImage: Image
    
    var dictionary: [String: Any]{
        return[
            "id" : id.uuidString,
            "diaryDate" : diaryDate,
            "diaryFull" : diaryFull,
            "diaryShare" : diaryShare,
            "diaryWeight" : diaryWeight,
            "diaryMuscle" : diaryMuscle,
            "diaryFat" : diaryFat
        ]
    }
}




