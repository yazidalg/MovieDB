//
//  DefaultTargetType.swift
//  MovieDB
//
//  Created by Yazid Al Ghozali on 21/02/24.
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
    
    var parameterEndcoding: Moya.ParameterEncoding {
        JSONEncoding.default
    }
    
    var task: Task {
        return .requestParameters(parameters: parameters, encoding: parameterEndcoding)
    }
    
    var headers: [String : String]? {
        return [
            "accept" : "application/json",
            "Authorization" : 
        ]
    }
}
