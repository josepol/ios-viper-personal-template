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
import Foundation

class LoginInteractor: LoginInteractorInputProtocol {
    var presenter: LoginInteractorOutputProtocol?
    
    func loginRequest(loginData: LoginData) {
        self.loginHttpRequest(loginData: loginData)
    }
    
    func loginHttpRequest(loginData: LoginData) {
        let MOCK = Bundle.main.object(forInfoDictionaryKey: ENV.MOCK) as! String
        if MOCK == PLIST.YES {
            self.saveToken(token: "asdqwea2313ssasdsd")
            self.loginResponse(token: "asdqwea2313ssasdsd")
        } else {
            let parameters: Parameters = ["username": loginData.username, "password": loginData.password]
            Alamofire.request(Endpoints.Auth.URL.login(), method: .post, parameters: parameters, encoding: JSONEncoding.default)
                .responseObject { (response: DataResponse<LoginResponseData>) in
                    switch response.result {
                    case .success:
                        if let loginResponse: LoginResponseData = response.result.value {
                            if loginResponse.token == nil {
                                self.loginFailedResponse()
                            } else {
                                self.saveToken(token: loginResponse.token!)
                                self.loginResponse(token: loginResponse.token!)
                            }
                        }
                    case .failure:
                        self.loginFailedResponse()
                    }
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
    
    func loginFailedResponse() {
        self.presenter?.loginFailedResponse()
    }
}
