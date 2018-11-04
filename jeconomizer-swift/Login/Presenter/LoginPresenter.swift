//
//  LoginPresenter.swift
//  jeconomizer-swift
//
//  Created by Jose Pol Sastre on 27/8/18.
//  Copyright © 2018 Jose Pol Sastre. All rights reserved.
//

class LoginPresenter: LoginPresenterProtocol {
    var view: LoginViewProtocol?
    var interactor: LoginInteractorInputProtocol?
    var wireFrame: LoginWireFrameProtocol?
    
    func viewDidLoad() {
    }
    
    func login(username: String, password: String) {
        let loginData: LoginData = LoginData(username: username, password: password)
        print("username is \(loginData.username) and password is \(loginData.password)")
        
        interactor?.loginRequest(loginData: loginData)
    }
    
    func navigateToRegister() {
        wireFrame?.navigateToRegister()
    }
}

extension LoginPresenter: LoginInteractorOutputProtocol {
    func loginResponse(token: Any) {
        wireFrame?.redirectToHome(from: view!)
    }
}
