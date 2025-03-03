import SwiftUI
import Observation

@Observable
class ProductViewModel {
    var products: ProductDatas = []

    private let url = URL(string: "https://fakestoreapi.com/products")

    public init() {
        fetchProduct()
    }

    private func fetchProduct() {
        Task {
            let product = try? await ApiManager.shared.callProducts(url)
            if let product {
                self.products = product
            }
        }
    }
}
