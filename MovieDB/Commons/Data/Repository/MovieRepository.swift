//
//  MovieRepository.swift
//  MovieDB
//
//  Created by Yazid Al Ghozali on 24/02/24.
//

import Foundation
import Moya

protocol MovieRepository {
    func getPopularMovie() async throws -> AllResultResponse<Result>
}

final class DefaultMovieRepository: MovieRepository {
    private let provider: MoyaProvider<MovieTargetType>
    
    init(provider: MoyaProvider<MovieTargetType> = .defaultProvider()) {
        self.provider = provider
    }
    
    func getPopularMovie() async throws -> AllResultResponse<Result> {
        try await provider.asyncRequest(.getPopularMovies, model: AllResultResponse<Result>.self)
    }
}
