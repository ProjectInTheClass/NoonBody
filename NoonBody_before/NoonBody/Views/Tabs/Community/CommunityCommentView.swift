//
//  CommunityCommentView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/12/16.
//

import SwiftUI

struct CommunityCommentView: View {

    var commentor: String
    var comment_content: String
    
    var body: some View {
        HStack {
            Text(commentor)
                .bold()
            Text(comment_content)
        }
    }
}

struct CommunityCommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityCommentView(commentor: "현아98", comment_content: "늦은시간에 미안... 참을 수 없었어..")
    }
}
