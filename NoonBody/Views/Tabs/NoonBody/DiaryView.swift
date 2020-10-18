//
//  ShareView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/12.
//

import SwiftUI

struct CompareView: View {
    @State var date = Date()
    
    var body: some View {
            
        ScrollView {
            HStack{
                    VStack{
                        Text("어제")
                        
                        Image("body1")
                            .resizable()
                            .frame(width: 180, height: 300, alignment: .trailing)
                    }
                    VStack{
                        Text("오늘")
                            
                        Image("body2")
                            .resizable()
                            .frame(width: 180, height: 300, alignment: .trailing)
                        
                    }
                    
                    
            }
        }
            
        }
        
    }


struct CompareView_Previews: PreviewProvider {
    static var previews: some View {
        CompareView()
    }
}
