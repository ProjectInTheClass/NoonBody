//
//  DietCoreDataViewModel.swift
//  NoonBody
//
//  Created by 윤진영 on 2021/06/26.
//

import Foundation

class DietCoreDataViewModel: ObservableObject {
  @Published var dietPosts = [DietPost]()

  func fetchData() {
    
  }
}
