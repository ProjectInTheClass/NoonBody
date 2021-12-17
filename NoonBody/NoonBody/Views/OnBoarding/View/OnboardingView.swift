//
//  OnboardingView.swift
//  NoonBody
//
//  Created by 윤진영 on 2021/12/13.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTIES
    
    var illustrations: [Illustration] = illustrationsData
    
    // MARK: - BODY
    var body: some View {
        TabView {
            ForEach(illustrations[0...4]) { item in
                NoonbodyCardView(noonbody: item)
            } //: Loop
        } //: TAB
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

// MARK: - PREVIEW

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(illustrations: illustrationsData)
            .previewDevice("iphone 11 Pro")
    }
}
