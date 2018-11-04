//
//  LoginResponseData.swift
//  jeconomizer-swift
//
//  Created by Jose Pol Sastre on 4/11/18.
//  Copyright © 2018 Jose Pol Sastre. All rights reserved.
//

import UIKit

import ObjectMapper

class LoginResponseData: Mappable {
    var token: String?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        token <- map["id_token"]
    }
}
