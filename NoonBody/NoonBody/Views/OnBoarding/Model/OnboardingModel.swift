//
//  OnboardingModel.swift
//  NoonBody
//
//  Created by 윤진영 on 2021/12/20.
//

import SwiftUI

struct Illustration: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
}
