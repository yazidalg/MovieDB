//
//  MoyaProvider+defaultProvider.swift
//  MovieDB
//
//  Created by Yazid Al Ghozali on 21/02/24.
//

import Foundation
import Moya

extension MoyaProvider {
    static func defaultProvider() -> MoyaProvider {
        return MoyaProvider(plugins: [NetworkLoggerPlugin()])
    }
}
