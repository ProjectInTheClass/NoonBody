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

    @Published var isWrite: Bool = false
  private var db = Firestore.firestore()

  func fetchData() {
    db.collection("CommunityPost").addSnapshotListener { (querySnapshot, error) in
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

        self.isWrite = true
        return CommunityPost(id: .init(), postingUser: postingUser, description: description, numberOfLikes: numberOfLikes, image: image)
      }
    }
  }
}

