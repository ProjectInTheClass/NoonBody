//
//  DateFormatter.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/14.
//

import Foundation

//여기에 extention을 추가한 다음에 DateFormatter의 TypeProperty를 추가
extension DateFormatter{
    static let memoDateFormatter: DateFormatter = {
        //closure에서 DateFormatter를 생성하고 return
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .none
        f.locale = Locale(identifier: "Ko_kr")  //한국
        return f
    }()
}

//새로운 extention을 추가하고 DateFormatter 클래스의 ObservableObject protocol 구현 추가
extension DateFormatter: ObservableObject{
    //필수 멤버는 따로 없기 때문에 이렇게 선언만 추가
}
