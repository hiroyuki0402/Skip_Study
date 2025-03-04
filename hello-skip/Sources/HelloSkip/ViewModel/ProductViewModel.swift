import SwiftUI
import Observation

@Observable
class ProductViewModel {
    var products: ProductDatas = []

    public init() {
        fetchProduct()
    }

    private func fetchProduct() {
        Task {
            let product = try? await ApiManager.shared.callProducts()
            if let product {
                self.products = product
            }
        }
    }

    func postProduct(_ product: ProductData) async throws {
        if let newProduct = try await ApiManager.shared.postProducts(product) {
            products.append(newProduct)
        }
    }
}
