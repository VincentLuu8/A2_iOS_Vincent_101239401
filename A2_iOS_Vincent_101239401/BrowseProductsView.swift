//
//  BrowseProductsView.swift
//  A2_iOS_Vincent_101239401
//
//  Created by Vincent Luu on 2026-04-09.
//

import SwiftUI

struct BrowseProductsView: View {
    @FetchRequest(fetchRequest: Product.allProductsRequest())
    private var products: FetchedResults<Product>

    @State private var currentIndex = 0

    private var currentProduct: Product? {
        guard !products.isEmpty else { return nil }
        let safeIndex = min(currentIndex, products.count - 1)
        return products[safeIndex]
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                if let product = currentProduct {
                    Text("This application starts with automatically displaying the first product in the database.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.top)

                    ProductCardView(product: product)
                        .padding(.horizontal)

                    Text("Product \(min(currentIndex, products.count - 1) + 1) of \(products.count)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    HStack(spacing: 16) {
                        Button(action: previousProduct) {
                            Text("Previous")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue.opacity(0.15))
                                .cornerRadius(12)
                        }
                        .disabled(currentIndex == 0)

                        Button(action: nextProduct) {
                            Text("Next")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.green.opacity(0.15))
                                .cornerRadius(12)
                        }
                        .disabled(currentIndex >= products.count - 1)
                    }
                    .padding(.horizontal)
                } else {
                    VStack(spacing: 12) {
                        Text("No products found")
                            .font(.title3)
                            .fontWeight(.semibold)

                        Text("Go to the Add tab and create a product.")
                            .foregroundColor(.secondary)
                    }
                }

                Spacer()
            }
            .navigationTitle("Browse Products")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    private func previousProduct() {
        if currentIndex > 0 {
            currentIndex -= 1
        }
    }

    private func nextProduct() {
        if currentIndex < products.count - 1 {
            currentIndex += 1
        }
    }
}
