//
//  DietViewModel.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/27.
//

import Foundation
import FirebaseFirestore

class DietViewModel: ObservableObject {
  @Published var dietPosts = [DietPost]()

    @Published var isWrite: Bool = false
  private var db = Firestore.firestore()

  func fetchData() {
    db.collection("dietwrite").addSnapshotListener { (querySnapshot, error) in
      guard let documents = querySnapshot?.documents else {
        print("No documents")
        return
      }

      self.dietPosts = documents.map { queryDocumentSnapshot -> DietPost in
        let data = queryDocumentSnapshot.data()
        let diaryDate = data["diaryDate"] as? String ?? ""
        let dietWhen = data["dietWhen"] as? String ?? ""
        let dietTime = data["dietTime"] as? String ?? ""
        let dietText = data["dietText"] as? String ?? ""
        let dietImage = data["dietImage"] as? String ?? ""

        self.isWrite = true
        return DietPost(id: .init(), dietDate: diaryDate, dietWhen: dietWhen, dietTime: dietTime, dietText: dietText, dietImage: dietImage)
      }
    }
  }
}

