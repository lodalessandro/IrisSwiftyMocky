import Foundation

enum ApiError: LocalizedError {
    case requestFailed(description: String)
    case invalidData
    case responseUnsuccessful(description: String)
    case jsonConversionFailure(description: String)
    case jsonParsingFailure
    case failedSerialization
    case noInternet
    case invalidURL
    
    var errorDescription: String {
        switch self {
        case let .requestFailed(description):
            return "Request Failed: \(description)"
        case .invalidData:
            return "Invalid Data"
        case let .responseUnsuccessful(description):
            return "Unsuccessful: \(description)"
        case let .jsonConversionFailure(description):
            return "JSON Conversion Failure: \(description)"
        case .jsonParsingFailure:
            return "JSON Parsing Failure"
        case .failedSerialization:
            return "Serialization failed."
        case .noInternet:
            return "No internet connection"
        case .invalidURL:
            return "Invalid URL"
        }
    }
}
