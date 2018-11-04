//
//  LoginInteractorProtocol.swift
//  jeconomizer-swift
//
//  Created by Jose Pol Sastre on 27/8/18.
//  Copyright © 2018 Jose Pol Sastre. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class LoginInteractor: LoginInteractorInputProtocol {
    var presenter: LoginInteractorOutputProtocol?
    
    func loginRequest(loginData: LoginData) {
        print(loginData)
        self.loginHttpRequest(loginData: loginData)
    }
    
    func loginHttpRequest(loginData: LoginData) {
        let parameters: Parameters = ["username": loginData.username, "password": loginData.password]
        Alamofire.request(Endpoints.Auth.DEV.login(), method: .post, parameters: parameters, encoding: JSONEncoding.default)
        .responseObject { (response: DataResponse<LoginResponseData>) in
            if let loginResponse: LoginResponseData = response.result.value {
                self.saveToken(token: loginResponse.token!)
                self.loginResponse(token: loginResponse.token!)
            }
                
        }
    }
    
    func saveToken(token: String) {
        let preferences = UserDefaults.standard
        preferences.set(token, forKey: "token")
        preferences.synchronize()
    }
}

extension LoginInteractor: LoginInteractorOutputProtocol {
    func loginResponse(token: Any) {
        self.presenter?.loginResponse(token: token)
    }
}
