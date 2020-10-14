//
//  NoonBody.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/12.
//
import Foundation
import SwiftUI

//Identifiable -> 데이터 목록을 테이블뷰나 컬렉션 뷰에 쉽게 바인딩할 수 있음
//ObservableObject -> 반응형 UI를 구현하기 위해서 필요
class NoonBody: Identifiable, ObservableObject{
    //프로토콜이 요구하는 속성과 메모를 저장하는데 필요한 속성 선언
    
    //Identifiable이 요구하는 속성. NoonBody를 유일하게 구분할 때 사용
    let id: UUID
    let image: UIImage
    let isPrivate: String
    //여기에는 NoonBody 메모 내용을 저장
    //Published 특성을 추가하면 새로운 값이 저장될 때 마다
    //바인딩되어있는 UI가 자동으로 업데이트됨
    @Published var content: String
    //NoonBody를 생성한 날짜를 저장
    let insertDate: Date
    
    //앞에서 선언한 5가지 속성을 초기화하는 생성자
    init(id: UUID = UUID(), image: UIImage = UIImage(), isPrivate: String ,content: String, insertDate: Date = Date()) {
        self.id = id
        self.image = image
        self.isPrivate = isPrivate
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
