//
//  A2_iOS_Vincent_101239401App.swift
//  A2_iOS_Vincent_101239401
//
//  Created by Vincent Luu on 2026-04-09.
//

import SwiftUI

@main
struct A2_iOS_Vincent_101239401App: App {
    let persistenceController = PersistenceController.shared

    init() {
        persistenceController.seedProductsIfNeeded()
    }

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
