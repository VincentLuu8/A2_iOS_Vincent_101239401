//
//  ProductCardView.swift
//  A2_iOS_Vincent_101239401
//
//  Created by Vincent Luu on 2026-04-09.
//

import SwiftUI

struct ProductCardView: View {
    let product: Product

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text(product.wrappedName)
                    .font(.title2)
                    .fontWeight(.bold)

                Spacer()

                Text(product.priceText)
                    .font(.headline)
                    .foregroundColor(.blue)
            }

            Text("Product ID: \(product.productId)")
                .font(.subheadline)
                .foregroundColor(.secondary)

            Text(product.wrappedDescription)
                .font(.body)

            Divider()

            HStack {
                Image(systemName: "building.2")
                Text(product.wrappedProvider)
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}
