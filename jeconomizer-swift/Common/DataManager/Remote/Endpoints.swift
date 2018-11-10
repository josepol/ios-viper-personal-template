//
//  Endpoints.swift
//  jeconomizer-swift
//
//  Created by Jose Pol Sastre on 30/8/18.
//  Copyright © 2018 Jose Pol Sastre. All rights reserved.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

struct API {
    static let baseUrl = "http://localhost:8080/api"
}

enum Endpoints {
    enum Auth: String {
        case URL
        
        func login() -> String {
            return "\(API.baseUrl)/authenticate"
        }
        
        func register() -> String {
            return "\(API.baseUrl)/register"
        }
    }
}
