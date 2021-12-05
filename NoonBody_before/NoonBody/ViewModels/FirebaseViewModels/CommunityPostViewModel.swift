//
//  CommunityPostViewModel.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/11/01.
//

import Foundation
import FirebaseFirestore

class CommunityPostViewModel: ObservableObject {
  @Published var communityPosts = [CommunityPost]()

    private var friendsList : [String] = ["현아", "혜리"]
    
  private var db = Firestore.firestore()

  func fetchData() {
    //whereField 사용하여 filter 가능
    //https://cloud.google.com/firestore/docs/query-data/queries
    db.collection("CommunityPost").whereField("postingUser", in: [friendsList[1]]).addSnapshotListener { (querySnapshot, error) in
        guard let documents = querySnapshot?.documents else {
            print("No documents")
            return
        }
        
        self.communityPosts = documents.map { queryDocumentSnapshot -> CommunityPost in
            let data = queryDocumentSnapshot.data()
            let postingUser = data["postingUser"] as? String ?? ""
            let description = data["description"] as? String ?? ""
            let numberOfLikes = data["numberOfLikes"] as? Int ?? 0
            let image = data["image"] as? String ?? ""
            
            
            return CommunityPost(id: .init(), postingUser: postingUser, description: description, numberOfLikes: numberOfLikes, image: image)
        }
    }
  }
}

