//
//  ShareButton.swift
//  NoonBody
//
//  Created by 윤진영 on 2022/02/05.
//

import SwiftUI

struct ShareButton: View {
    @State private var isShareSheetShowing = false
    
    var body: some View {
        Button(action: shareButton) {
            Image(systemName: "square.and.arrow.up")
                .font(.largeTitle)
        }
    }
    
    func shareButton() {
        isShareSheetShowing.toggle()
        
        let url = URL(string:"https://apple.com")
        let activityView = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?
            .present(activityView, animated: true, completion: nil)
        
    }
}

struct ShareButton_Previews: PreviewProvider {
    static var previews: some View {
        ShareButton()
    }
}
