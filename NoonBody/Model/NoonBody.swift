//
//  NoonBody.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/12.
//
import Foundation


class NoonBody: Identifiable, ObservableObject{
    
    let id: UUID
    
    @Published var content: String
    
    let insertDate: Date
    
    
    init(id: UUID = UUID(), content: String, insertDate: Date = Date()) {
        self.id = id
        self.content = content
        self.insertDate = insertDate
    }
}

//새로운 extention을 추가하고 Equatable 프로토콜을 구현
extension NoonBody: Equatable{
    static func == (lhs: NoonBody, rhs: NoonBody) -> Bool{
        return lhs.id == rhs.id  //id 속성값만 비교
    }
}
