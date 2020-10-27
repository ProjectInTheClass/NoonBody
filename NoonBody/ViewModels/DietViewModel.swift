//
//  DietViewModel.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/27.
//

import Foundation
import FirebaseFirestore

//class DietViewModel: ObservableObject {
//  @Published var dietPosts = [DietPost]()
//
//    @Published var isWrite: Bool = false
//  private var db = Firestore.firestore()
//
//  func fetchData() {
//    db.collection("dietwrite").addSnapshotListener { (querySnapshot, error) in
//      guard let documents = querySnapshot?.documents else {
//        print("No documents")
//        return
//      }
//
//      self.dietPosts = documents.map { queryDocumentSnapshot -> DietPost in
//        let data = queryDocumentSnapshot.data()
//        let diaryDate = data["diaryDate"] as? String ?? ""
//        let diaryFull = data["diaryFull"] as? String ?? ""
//        let diaryShare = data["diaryShare"] as? String ?? ""
//        let diaryWeight = data["diaryWeight"] as? Double ?? 0
//        let diaryMuscle = data["diaryMuscle"] as? Double ?? 0
//        let diaryFat = data["diaryFat"] as? Double ?? 0
//
//        self.isWrite = true
//        return DietPost(id: .init(), diaryDate: diaryDate, diaryFull: diaryFull, diaryShare: diaryShare, diaryWeight: diaryWeight, diaryMuscle: diaryMuscle, diaryFat: diaryFat)
//      }
//    }
//  }
//}
