//
//  ObserverbleObjects.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/11/04.
//

import SwiftUI


class ChoosedContent: ObservableObject {
    @Published var count: Int = 0
    
    @Published var date: String = ""
    @Published var image: String = ""
    @Published var weight: Double = 0
    @Published var muscle: Double = 0
    @Published var fat: Double = 0
}


