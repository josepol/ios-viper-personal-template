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
    static let baseUrl = "http://localhost:8080"
}

enum Endpoints {
    enum Auth {
        public var login: String {
            return "\(API.baseUrl)/login)"
        }
        
        public var register: String {
            return "\(API.baseUrl)/register)"
        }
    }
}
