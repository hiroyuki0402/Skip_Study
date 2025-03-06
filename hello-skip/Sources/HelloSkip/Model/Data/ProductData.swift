import Foundation

// MARK: - ProductData
struct ProductData: Codable, Hashable, Identifiable {
    let id: Int?
    let title: String
    let price: Double
    let description: String
    let category: Category
    let image: URL
    let rating: Rating?
}

enum Category: String, Codable, Hashable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
}

// MARK: - Rating
struct Rating: Codable, Hashable {
    let rate: Double
    let count: Int
}

typealias ProductDatas = [ProductData]
