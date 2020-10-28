//
//  NoonBodyViewModel.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/27.
//

import Foundation
import FirebaseFirestore

class NoonBodyViewModel: ObservableObject {
  @Published var diaryPosts = [DiaryPost]()

    @Published var isWrite: Bool = false
  private var db = Firestore.firestore()

  func fetchData() {
    db.collection("NoonbodyWrite").addSnapshotListener { (querySnapshot, error) in
      guard let documents = querySnapshot?.documents else {
        print("No documents")
        return
      }

      self.diaryPosts = documents.map { queryDocumentSnapshot -> DiaryPost in
        let data = queryDocumentSnapshot.data()
        let diaryDate = data["diaryDate"] as? String ?? ""
        let diaryFull = data["diaryFull"] as? String ?? ""
        let diaryShare = data["diaryShare"] as? String ?? ""
        let diaryWeight = data["diaryWeight"] as? Double ?? 0
        let diaryMuscle = data["diaryMuscle"] as? Double ?? 0
        let diaryFat = data["diaryFat"] as? Double ?? 0
        let diaryImage = data["noonbodyPic"] as? String ?? ""

        self.isWrite = true
        return DiaryPost(id: .init(), diaryDate: diaryDate, diaryFull: diaryFull, diaryShare: diaryShare, diaryWeight: diaryWeight, diaryMuscle: diaryMuscle, diaryFat: diaryFat, diaryImage: diaryImage)
      }
    }
  }
}


