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
