import Foundation

struct ApiManager {
    static let shared = ApiManager()
    private init() {}


    func callProducts() async throws -> ProductDatas {
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            fatalError("URL is nil")
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([ProductData].self, from: data)
    }

    func postProducts(_ data: ProductData) async throws -> ProductData? {
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            fatalError("URL is nil")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody =  try JSONEncoder().encode(data)

        let (data, _) = try await URLSession.shared.data(for: request)
        return try? JSONDecoder().decode(ProductData.self, from: data)
    }
}
