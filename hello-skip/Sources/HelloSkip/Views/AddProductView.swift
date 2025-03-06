import SwiftUI

struct AddProductView: View {

    @Environment(ProductViewModel.self) var viewModel
    @Environment(\.dismiss) var dismiss

    @State var title: String = ""
    @State var price: String = ""
    @State var category: String = ""
    @State var description: String = ""

    private var categories: [String] = [
        "electronics",
        "jewelery",
        "men's clothing",
        "women's clothing"
    ]

    var body: some View {
        Form {
            Section(header: Text("Product Details")) {
                TextField("Title", text: $title)
                TextField("Price", text: $price)

                TextEditor(text: $description)
                    .frame(height: 200)

                Picker("Category", selection: $category) {
                    ForEach(categories, id: \.self) {
                        Text($0)
                            .tag($0)
                    }
                }
            }

            Button {

                guard let price = Double(price), !title.isEmpty else {
                    return
                }

                let product = ProductData(
                    id: 1,
                    title: title,
                    price: price,
                    description: description,
                    category: Category(rawValue: category) ?? .electronics,
                    image: URL(string: "https://picsum.photos/id/1/200/300")!,
                    rating: .init(rate: 10, count: 1)
                )

                Task {
                    do {
                        try await viewModel.postProduct(product)
                        dismiss()
                    } catch {

                    }
                }

            } label: {
                Text("Save")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
