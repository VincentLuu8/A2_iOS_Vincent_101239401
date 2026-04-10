import Foundation
import CoreData

extension Product {
    var wrappedName: String {
        productName ?? "Product has no name"
    }

    var wrappedDescription: String {
        productDescription ?? "Description is not available"
    }

    var wrappedProvider: String {
        productProvider ?? "Provider is unknown"
    }

    var priceText: String {
        String(format: "$%.2f", productPrice)
    }

    static func allProductsRequest() -> NSFetchRequest<Product> {
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "productId", ascending: true)]
        return request
    }
}
