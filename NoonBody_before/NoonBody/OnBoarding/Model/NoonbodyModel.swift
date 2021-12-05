//
//  NoonbodyModel.swift
//  Onboarding
//
//  Created by Jen on 2021-02-02.
//

import SwiftUI

// MARK: - NOONBODY DATA MODEL

struct Illustration: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
}
