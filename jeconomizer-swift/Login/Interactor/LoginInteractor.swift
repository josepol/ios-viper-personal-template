//
//  LoginInteractorProtocol.swift
//  jeconomizer-swift
//
//  Created by Jose Pol Sastre on 27/8/18.
//  Copyright © 2018 Jose Pol Sastre. All rights reserved.
//

import UIKit

class LoginInteractor: LoginInteractorInputProtocol {
    var presenter: LoginInteractorOutputProtocol?
    
    func loginRequest() {
        self.presenter?.loginResponse(response: "ok")
    }
}
