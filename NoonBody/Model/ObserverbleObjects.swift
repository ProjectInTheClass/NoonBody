//
//  ObserverbleObjects.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/11/04.
//

import SwiftUI


class ChoosedCount: ObservableObject {
    @Published var count: Int = 0
    
}

class ChoosedContent1: ObservableObject {
    
    @Published var date1: String = ""
    @Published var image1: String = ""
    @Published var weight1: Double = 0
    @Published var muscle1: Double = 0
    @Published var fat1: Double = 0

}

class ChoosedContent2: ObservableObject {
    
    @Published var date2: String = ""
    @Published var image2: String = ""
    @Published var weight2: Double = 0
    @Published var muscle2: Double = 0
    @Published var fat2: Double = 0
}

class SelectedDay: ObservableObject {
    @Published var day: String = "9월 3주"
}
