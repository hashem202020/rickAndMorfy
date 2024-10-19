//
//  RemoteAPI.swift
//  Rick and Morty
//
//  Created by Khaled hashem on 18/10/2024.
//

import Foundation
import Alamofire

public protocol RemoteAPI {
    func request<T: Codable>(endPoint: String, method: HTTPMethod, parameters: Parameters?) async throws -> T
}

extension RemoteAPI {
    public func request<T: Codable>(endPoint: String, method: HTTPMethod, parameters: Parameters?) async throws -> T {
        
        let baseUrl = Bundle.main.infoDictionary?[NetworkConstants.apiBaseURL] ?? ""
        
        return try await withCheckedThrowingContinuation { continuation in
            AF.request("\(baseUrl)\(endPoint)", parameters: parameters)
                .validate()
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let value):
                        continuation.resume(returning: value)
                    case .failure(let error):
                        if let httpResponse = response.response {
                            if !(200...299).contains(httpResponse.statusCode) {
                                continuation.resume(throwing: NetworkError.invalidResponse)
                            } else if let decodingError = error.underlyingError as? DecodingError {
                                continuation.resume(throwing: NetworkError.decodingFailed(decodingError))
                            } else {
                                continuation.resume(throwing: NetworkError.requestFailed(error))
                            }
                        } else {
                            continuation.resume(throwing: NetworkError.requestFailed(error))
                        }
                        
                    }
                }
        }
    }
}
