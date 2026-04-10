import SwiftUI
import CoreData

struct AddProductView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State private var productId = ""
    @State private var productName = ""
    @State private var productDescription = ""
    @State private var productPrice = ""
    @State private var productProvider = ""

    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Product Information")) {
                    TextField("Product ID", text: $productId)
                        .keyboardType(.numberPad)

                    TextField("Product Name", text: $productName)

                    TextEditor(text: $productDescription)
                        .frame(height: 100)

                    TextField("Product Price", text: $productPrice)
                        .keyboardType(.decimalPad)

                    TextField("Product Provider", text: $productProvider)
                }

                Section {
                    Button(action: saveProduct) {
                        Text("Save Product")
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .navigationTitle("Add a Product")
            .alert(alertTitle, isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(alertMessage)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    private func saveProduct() {
        let cleanName = productName.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanDescription = productDescription.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanProvider = productProvider.trimmingCharacters(in: .whitespacesAndNewlines)

        guard let idValue = Int64(productId) else {
            showMessage(title: "Invalid ID", message: "Please enter a valid number for Product ID.")
            return
        }

        guard let priceValue = Double(productPrice) else {
            showMessage(title: "Invalid Price", message: "Please enter a valid number for Product Price.")
            return
        }

        guard !cleanName.isEmpty, !cleanDescription.isEmpty, !cleanProvider.isEmpty else {
            showMessage(title: "Missing Information", message: "Please fill in all fields before saving.")
            return
        }

        let request: NSFetchRequest<Product> = Product.fetchRequest()
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "productId == %lld", idValue)

        do {
            let existingProduct = try viewContext.fetch(request)

            if !existingProduct.isEmpty {
                showMessage(title: "Duplicate ID", message: "A product with that ID already exists.")
                return
            }

            let newProduct = Product(context: viewContext)
            newProduct.productId = idValue
            newProduct.productName = cleanName
            newProduct.productDescription = cleanDescription
            newProduct.productPrice = priceValue
            newProduct.productProvider = cleanProvider

            try viewContext.save()

            clearForm()
            showMessage(title: "Saved", message: "The product was added successfully!")
        } catch {
            showMessage(title: "Save Error", message: "The product could not be saved.")
        }
    }

    private func clearForm() {
        productId = ""
        productName = ""
        productDescription = ""
        productPrice = ""
        productProvider = ""
    }

    private func showMessage(title: String, message: String) {
        alertTitle = title
        alertMessage = message
        showAlert = true
    }
}
