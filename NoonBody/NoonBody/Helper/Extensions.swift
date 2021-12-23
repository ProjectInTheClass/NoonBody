//
//  Extensions.swift
//  NoonBody
//
//  Created by 윤진영 on 2021/12/22.
//

import Foundation

extension View {
    func endEditing(_ force: Bool) {
        UIApplication.shared.windows.forEach { $0.endEditing(force)}
    }
}
