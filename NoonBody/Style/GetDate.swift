//
//  GetDate.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/21.
//

import Foundation
import SwiftUI

func getDate(num:Int) -> String {
    var dayComponent = DateComponents()
    dayComponent.day = -num
    let calendar = Calendar.current
    let Day =  calendar.date(byAdding: dayComponent, to: Date())!
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "Ko_KR")
    formatter.dateFormat = "YYYY.MM.DD"
    formatter.dateStyle = .medium
    return formatter.string(from: Day) //Output is "March 6, 2020
}
