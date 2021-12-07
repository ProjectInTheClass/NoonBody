//
//  NoonBodyApp.swift
//  NoonBody
//
//  Created by 윤진영 on 2021/12/05.
//

import SwiftUI

@main
struct NoonBodyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
