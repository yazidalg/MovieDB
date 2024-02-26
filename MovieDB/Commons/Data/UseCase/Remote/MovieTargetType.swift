//
//  UserTargetTYpe.swift
//  MovieDB
//
//  Created by Yazid Al Ghozali on 24/02/24.
//

import Foundation
import Moya

enum MovieTargetType {
    case getPopularMovies
    case getTopRatedMovies
    case getUpcomingMovies
}

extension MovieTargetType: DefaultTargetType {
    var parameters: [String : Any] {
        switch self {
        case .getPopularMovies:
            return [:]
        case .getTopRatedMovies:
            return [:]
        case .getUpcomingMovies:
            return [:]
        }
    }
    
    var path: String {
        switch self {
        case .getPopularMovies:
            Endpoint.getPopularMovies
        case .getTopRatedMovies:
            Endpoint.getTopRatedMovies
        case .getUpcomingMovies:
            Endpoint.getUpcomingMovies
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPopularMovies:
            return .get
        case .getTopRatedMovies:
            return .get
        case .getUpcomingMovies:
            return .get
        }
    }
    
    var task: Task {
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }
}
