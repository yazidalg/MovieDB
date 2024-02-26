//
//  DefaultResponseType.swift
//  MovieDB
//
//  Created by Yazid Al Ghozali on 24/02/24.
//

import Foundation

struct AllDataResponse<T: Codable>: Codable {
    var results: [T]?
}

struct DetailResponse<T: Codable>: Codable {
    var results: T?
}
