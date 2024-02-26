//
//  MoyaProvider+asyncRequest.swift
//  MovieDB
//
//  Created by Yazid Al Ghozali on 21/02/24.
//

import Foundation
import Moya

extension MoyaProvider {
    func asyncRequest<T: Codable>(_ target: Target, model: T.Type) async throws -> T {
        return try await withCheckedThrowingContinuation({ continuation in
            self.request(target) { result in
                switch result {
                case .failure(let moyaError):
                    continuation.resume(throwing: moyaError)
                case .success(let response):
                    let jsonDecode = JSONDecoder()
                    jsonDecode.dateDecodingStrategy = .iso8601
                    
                    do {
                        let decodeData = try jsonDecode.decode(model.self, from: response.data)
                        
                        continuation.resume(returning: decodeData)
                    } catch {
                        continuation.resume(throwing: error)
                    }
                }
            }
        })
    }
}
