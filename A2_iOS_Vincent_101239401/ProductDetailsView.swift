//
//  ProductDetailsView.swift
//  A2_iOS_Vincent_101239401
//
//  Created by Vincent Luu on 2026-04-09.
//

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
