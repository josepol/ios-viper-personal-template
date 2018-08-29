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
        print("view did load!")
    }
    
    func login(username: String, password: String) {
        print("username is \(username) and password is \(password)")
        wireFrame?.redirectToHome(from: view!)
    }
}

extension LoginPresenter: LoginInteractorOutputProtocol {
    
}
