import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "A2_iOS_Vincent_101239401")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Failed to load Core Data store: \(error), \(error.userInfo)")
            }
        }

        container.viewContext.automaticallyMergesChangesFromParent = true
    }

    func seedProductsIfNeeded() {
        let context = container.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")

        do {
            let count = try context.count(for: request)

            if count > 0 {
                return
            }

            let sampleProducts: [(Int64, String, String, Double, String)] = [
                (1, "Gaming PC", "High-end gaming PC featuring an RTX 5090.", 2999.99, "Alienware"),
                (2, "iPhone 18 Pro", "Features a design refresh with longer lasting battery-life and A20 Chip.", 1499.99, "Apple"),
                (3, "Headphones", "Fully bluetooth and new sound boosting technology. ", 199.99, "Logitech"),
                (4, "Vitamins", "All-in-one with all the essentials needed daily.", 24.99, "HealthMax"),
                (5, "Mechanical Keyboard", "Fully RGB keyboard featuring linear switches.", 179.99, "Razer"),
                (6, "Runners", "Latest cutting-edge zoom bounce foam with extra laces.", 139.99, "Nike"),
                (7, "TV", "80-inch 4k TV with HDR display.", 2299.99, "Samsung"),
                (8, "Tracksuit", "Comfy and loose fitted featuring 100% cotton material.", 159.99, "Alo"),
                (9, "Desk", "Stand-up functionality with 2 drawers for storage. ", 199.99, "SecretLabs"),
                (10, "Candle", "3-wick slow burning wax with included wick lighter.", 14.99, "WaxJar")
            ]

            for item in sampleProducts {
                let product = Product(context: context)
                product.productId = item.0
                product.productName = item.1
                product.productDescription = item.2
                product.productPrice = item.3
                product.productProvider = item.4
            }

            try context.save()
        } catch {
            print("Could not seed products: \(error.localizedDescription)")
        }
    }
}
