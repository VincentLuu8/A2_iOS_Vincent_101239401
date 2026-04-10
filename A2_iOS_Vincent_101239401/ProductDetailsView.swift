import SwiftUI

struct ProductDetailsView: View {
    let product: Product

    var body: some View {
        ScrollView {
            ProductCardView(product: product)
                .padding()
        }
        .navigationTitle("Product Details")
    }
}
