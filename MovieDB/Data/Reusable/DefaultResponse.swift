//
//  DefaultResponse.swift
//  MovieDB
//
//  Created by Yazid Al Ghozali on 21/02/24.
//

import Foundation

struct AllDataResponse<T: Codable>: Codable {
    var data: [T]?
}
