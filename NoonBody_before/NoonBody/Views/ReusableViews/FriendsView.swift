//
//  FriendsView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct FriendsView: View {
    var passed_friendUser: String
    var passed_friendDescription: String
    var passed_friendNumberOfLikes: Int
    var passed_friendImage: String
    
    var body: some View {
        
        HStack{
            //URI로 이미지 보여주도록 수정
            AnimatedImage(url: URL(string: passed_friendImage)!)
                .resizable()
                .frame(width:50, height: 50)
                .clipShape(Circle())
                .aspectRatio(contentMode: .fit)
                .background(Color.init(red: 0.95, green: 0.95, blue: 0.95).opacity(0.6))
            
            VStack {
                
                HStack{
                    Text("\(passed_friendUser)")
                    
                    Spacer()
                }.font(.system(size: 12, weight: .bold))
                HStack{
                    Text("\(passed_friendDescription)")
                    Spacer()
                }.font(.system(size: 12, weight: .regular))
            }.padding()
            
            HStack{
                Image(systemName: "flame.fill")
                    .foregroundColor(.red)
                Text("\(passed_friendNumberOfLikes)")
                    .foregroundColor(.red)
            }
            
        }.padding()
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView(passed_friendUser: "지현", passed_friendDescription: "나는 지현", passed_friendNumberOfLikes: 1000, passed_friendImage: "")
    }
}
