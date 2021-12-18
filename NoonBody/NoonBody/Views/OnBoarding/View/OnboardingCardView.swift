//
//  OnboardingCardView.swift
//  NoonBody
//
//  Created by 윤진영 on 2021/12/17.
//

import SwiftUI

struct OnboardingCardView: View {
    // MARK: - PROPERTIES
    
    var noonbody: Illustration
    
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                
                Image(noonbody.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color(red: 0, green:0, blue:0, opacity: 0.15), radius: 8, x:6, y: 8)
                    .scaleEffect(isAnimating ? 1.0 : 0.6)
                
                
                
                Text(noonbody.title)
                    .foregroundColor(Color.white)
                    .font(.title)
                    .fontWeight(.heavy)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
                
                
                Text(noonbody.headline)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)
                
                
                // BUTTON: START
                StartButtonView()
                
                
                
            } //: VSTACK
        } //: ZSTACK
        .onAppear{
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: noonbody.gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
}
struct OnboardingCardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCardView(noonbody: illustrationsData[1])
            .previewLayout(.fixed(width: 320, height: 640))
    }
}
