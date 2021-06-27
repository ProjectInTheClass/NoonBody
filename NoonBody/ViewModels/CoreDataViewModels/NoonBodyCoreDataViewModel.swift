//
//  NoonBodyCoreDataViewModel.swift
//  NoonBody
//
//  Created by 윤진영 on 2021/06/26.
//

import Foundation

class NoonBodyCoreDataViewModel: ObservableObject {
  @Published var diaryPosts = [DiaryPost]()

  func fetchData() {

  }
}
