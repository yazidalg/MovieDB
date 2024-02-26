//
//  DefaultTargetType.swift
//  MovieDB
//
//  Created by Yazid Al Ghozali on 24/02/24.
//

import Foundation
import Moya

protocol DefaultTargetType: TargetType {
    var parameters: [String : Any] { get }
}

extension DefaultTargetType {
    var baseURL: URL {
        return URL(string: Constant.baseUrl) ?? (NSURL() as URL)
    }
    
    var parameterEncoding: Moya.ParameterEncoding {
        JSONEncoding.default
    }
    
    var task: Task {
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }
    
    var headers: [String : String]? {
        return [
            "accept": "application/json",
            "Authorization": Constant.accessToken
        ]
    }
}
