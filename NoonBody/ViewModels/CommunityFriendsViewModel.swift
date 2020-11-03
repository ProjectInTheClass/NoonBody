//
//  CommunityFriendsViewModel.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/11/01.
//

import Foundation
import FirebaseFirestore

class CommunityFriendsViewModel: ObservableObject {
  @Published var friendPosts = [FriendsPost]()

    @Published var isWrite: Bool = false
  private var db = Firestore.firestore()

  func fetchData() {
    db.collection("CommunityFriends").addSnapshotListener { (querySnapshot, error) in
      guard let documents = querySnapshot?.documents else {
        print("No documents")
        return
      }

      self.friendPosts = documents.map { queryDocumentSnapshot -> FriendsPost in
        let data = queryDocumentSnapshot.data()
        let friendName = data["friendName"] as? String ?? ""
        let friendDescription = data["friendDescription"] as? String ?? ""
        let friendNumberOfLikes = data["friendNumberOfLikes"] as? Int ?? 0
        let friendImage = data["friendImage"] as? String ?? ""

        self.isWrite = true
        return FriendsPost(id: .init(), friendName: friendName, friendDescription: friendDescription, friendNumberOfLikes: friendNumberOfLikes, friendImage: friendImage)
      }
    }
  }
}

