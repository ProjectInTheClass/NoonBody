//
//  DietPostView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DietPostView: View {
    
    var passed_dietWhen: String
    var passed_dietTime: String
    var passed_dietText: String
    var passed_dietImage: String
    
    var body: some View {
        
        HStack{
            
            VStack {
                
                HStack{
                    VStack(alignment: .leading){
                        Text("\(passed_dietWhen)")
                            .font(.system(size: 20))
                            .bold()
                        Text("\(passed_dietTime)")
                            .font(.system(size: 15))
                            .bold()
                        Text("\(passed_dietText)")
                    }
                    
                    Spacer()
                    
                    //URI로 이미지 보여주도록 수정
                    AnimatedImage(url: URL(string: passed_dietImage)!)
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .trailing)
                }
                
            }
            
        }.padding()
    }
}

struct DietPostView_Previews: PreviewProvider {
    static var previews: some View {
        DietPostView(passed_dietWhen: "아침", passed_dietTime: "9시 30분", passed_dietText: "아침 먹었당", passed_dietImage: "https://firebasestorage.googleapis.com/v0/b/noonbody-9af0d.appspot.com/o/NoonbodyWriteImages%2F66D155D9-1338-4A6B-A4AE-B30E449D8F44%2F2020.%2010.%2028.?alt=media&token=c57c94e5-d8f2-4048-b048-8d261866f595")
    }
}
