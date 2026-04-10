//
//  MainTabView.swift
//  A2_iOS_Vincent_101239401
//
//  Created by Vincent Luu on 2026-04-09.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            BrowseProductsView()
                .tabItem {
                    Label("Browse", systemImage: "house")
                }

            ProductListView()
                .tabItem {
                    Label("Products", systemImage: "list.bullet")
                }

            AddProductView()
                .tabItem {
                    Label("Add", systemImage: "plus.circle")
                }
        }
    }
}
