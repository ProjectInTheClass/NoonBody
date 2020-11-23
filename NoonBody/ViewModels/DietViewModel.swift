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

    
  private var db = Firestore.firestore()

  func fetchData() {
    db.collection("DietWrite").addSnapshotListener { (querySnapshot, error) in
      guard let documents = querySnapshot?.documents else {
        print("No documents")
        return
      }

      self.dietPosts = documents.map { queryDocumentSnapshot -> DietPost in
        let data = queryDocumentSnapshot.data()
        let dietDate = data["dietDate"] as? String ?? ""
        let dietWhen = data["dietWhen"] as? String ?? ""
        let dietTime = data["dietTime"] as? String ?? ""
        let dietText = data["dietText"] as? String ?? ""
        let dietImage = data["dietImage"] as? String ?? ""

        
        return DietPost(id: .init(), dietDate: dietDate, dietWhen: dietWhen, dietTime: dietTime, dietText: dietText, dietImage: dietImage)
      }
    }
  }
}

