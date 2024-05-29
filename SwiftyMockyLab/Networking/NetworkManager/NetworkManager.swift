import Foundation

final class NetworkManager {
    
    let session: URLSession
    let baseURL: URL
    
    static var shared: NetworkManager!
    
    init(configuration: URLSessionConfiguration, baseURL: URL) {
        self.session = URLSession(configuration: configuration)
        self.baseURL = baseURL
    }
    
    convenience init(baseURL: URL) {
        self.init(configuration: .default, baseURL: baseURL)
    }
}

extension NetworkManager {
    
    /// Fetch da URL assoluto
    /// - Parameters:
    ///   - type: tipo del dato in response
    ///   - stringURL: URL assoluto
    ///   - queryItems: query items opzionali
    /// - Returns: dato di tipo type
    func fetch<T: Decodable>(type: T.Type, from absoluteURL: URL?, queryItems: [URLQueryItem]? = nil) async throws -> T {
        guard let absoluteURL,
              var URLComponents = URLComponents(url: absoluteURL, resolvingAgainstBaseURL: true)
        else {
            throw ApiError.invalidURL
        }
        
        if let queryItems {
            URLComponents.queryItems = queryItems
        }
        
        guard let url = URLComponents.url
        else {
            throw ApiError.invalidURL
        }
        
        print(url)
                
        let request = URLRequest(url: url)
        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ApiError.requestFailed(description: "Invalid response")
        }
        guard httpResponse.statusCode == 200 else {
            throw ApiError.responseUnsuccessful(description: "Status code: \(httpResponse.statusCode)")
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(type, from: data)
    }
    
    /// Fetch da URL relativo a baseURL
    /// - Parameters:
    ///   - type: tipo del dato in response
    ///   - stringURL: URL relativo come stringa
    ///   - queryItems: query items opzionali
    /// - Returns: dato di tipo type
    func fetch<T: Decodable>(type: T.Type, from stringURL: String, queryItems: [URLQueryItem]? = nil) async throws -> T {
        guard let absoluteURL = URL(string: stringURL, relativeTo: baseURL) else { throw ApiError.invalidURL }
        return try await fetch(type: type, from: absoluteURL, queryItems: queryItems)
    }
}
