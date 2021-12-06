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
    var image: String
    
    var dictionary: [String: Any]{
        return[
            "id" : id.uuidString,
            "postingUser" : postingUser,
            "description" : description,
            "numberOfLikes" : numberOfLikes,
            "image" : image
            
            
        ]
    }
}

struct FriendsPost: Identifiable {
    var id = UUID()
    
    var friendName: String
    var friendDescription: String
    var friendNumberOfLikes: Int
    var friendImage: String
    
    var dictionary: [String: Any]{
        return[
            "id" : id.uuidString,
            "friendName" : friendName,
            "friendDescription" : friendDescription,
            "friendNumberOfLikes" : friendNumberOfLikes,
            "friendImage" : friendImage
        ]
    }
}

struct MyImagePost: Identifiable {
    var id = UUID()
    
    var myImage: String
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
    
    var dietDate: String
    var dietWhen: String
    var dietTime: String
    var dietText: String
    var dietImage: String
    
    
    var dictionary: [String: Any]{
        return[
            "id" : id.uuidString,
            "dietDate" : dietDate,
            "dietWhen" : dietWhen,
            "dietTime" : dietTime,
            "dietText" : dietText,
            "dietImage" : dietImage
            
        ]
    }
}

struct DietPostSubmit: Identifiable {
    var id = UUID()
    
    var dietDate: String
    var dietWhen: String
    var dietTime: String
    var dietText: String
    var dietImage: Image
    
    
    var dictionary: [String: Any]{
        return[
            "id" : id.uuidString,
            "dietDate" : dietDate,
            "dietWhen" : dietWhen,
            "dietTime" : dietTime,
            "dietText" : dietText
            
            
        ]
    }
}

struct DiaryPost: Identifiable {
    var id = UUID()
    
    var diaryDate: String
    var diaryMonth: String
    var diaryFull: String
    var diaryShare: String
    var diaryWeight: Double
    var diaryMuscle: Double
    var diaryFat: Double
    var diaryImage: String
    
    var dictionary: [String: Any]{
        return[
            "id" : id.uuidString,
            "diaryDate" : diaryDate,
            "diaryMonth" : diaryMonth,
            "diaryFull" : diaryFull,
            "diaryShare" : diaryShare,
            "diaryWeight" : diaryWeight,
            "diaryMuscle" : diaryMuscle,
            "diaryFat" : diaryFat,
            "diaryImage" : diaryImage
            
        ]
    }
}

struct DiaryPostSubmit: Identifiable {
    var id = UUID()
    
    var diaryDate: String
    var diaryMonth: String
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
            "diaryMonth" : diaryMonth,
            "diaryFull" : diaryFull,
            "diaryShare" : diaryShare,
            "diaryWeight" : diaryWeight,
            "diaryMuscle" : diaryMuscle,
            "diaryFat" : diaryFat,
            
        ]
    }
}

struct CommentModel: Identifiable{

    let id = UUID()
    
    var commentor: String
    var comment_content: String
}



