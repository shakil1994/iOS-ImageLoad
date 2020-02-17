//
//  APIError.swift
//  SImageLoad
//
//  Created by DhakaLive on 1/16/20.
//  Copyright © 2020 DhakaLive. All rights reserved.
//

import Foundation

enum APIError: Error {
    case invalidResponse(code: Int)
}
