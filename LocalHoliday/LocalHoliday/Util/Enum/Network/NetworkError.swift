//
//  NetworkError.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case encodingError
    case invalidResponse
}
