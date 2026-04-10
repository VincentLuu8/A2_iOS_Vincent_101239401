import SwiftUI

struct ProductListView: View {
    @FetchRequest(fetchRequest: Product.allProductsRequest())
    private var products: FetchedResults<Product>

    @State private var searchText = ""

    private var filteredProducts: [Product] {
        let cleanSearch = searchText.trimmingCharacters(in: .whitespacesAndNewlines)

        if cleanSearch.isEmpty {
            return Array(products)
        }

        return products.filter { product in
            product.wrappedName.localizedCaseInsensitiveContains(cleanSearch) ||
            product.wrappedDescription.localizedCaseInsensitiveContains(cleanSearch)
        }
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(filteredProducts) { product in
                    NavigationLink(destination: ProductDetailsView(product: product)) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(product.wrappedName)
                                .font(.headline)

                            Text(product.wrappedDescription)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .lineLimit(2)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("All Products")
            .searchable(text: $searchText, prompt: "Search by product name or description.")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
