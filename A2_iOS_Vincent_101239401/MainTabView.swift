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
