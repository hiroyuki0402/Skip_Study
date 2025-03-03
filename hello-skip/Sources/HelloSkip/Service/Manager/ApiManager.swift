import Foundation

struct ApiManager {
    static let shared = ApiManager()
    private init() {}


    func callProducts(_ url: URL?) async throws -> ProductDatas {
        guard let url = url else {
            fatalError("URL is nil")
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([ProductData].self, from: data)
    }
}
