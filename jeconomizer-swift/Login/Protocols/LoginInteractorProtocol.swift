//
//  LoginInteractorProtocol.swift
//  jeconomizer-swift
//
//  Created by Jose Pol Sastre on 27/8/18.
//  Copyright © 2018 Jose Pol Sastre. All rights reserved.
//

import UIKit

protocol LoginInteractorInputProtocol: class {
    var presenter: LoginInteractorOutputProtocol? { get set }
    
    func loginRequest(loginData: LoginData)
    func loginHttpRequest(loginData: LoginData)
    func saveToken(token: String)
    func loginFailedResponse()
}

protocol LoginInteractorOutputProtocol: class {
    func loginResponse(token: Any)
    func loginFailedResponse()
}
