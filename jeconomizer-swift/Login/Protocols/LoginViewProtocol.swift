//
//  LoginViewProtocol.swift
//  jeconomizer-swift
//
//  Created by Jose Pol Sastre on 27/8/18.
//  Copyright © 2018 Jose Pol Sastre. All rights reserved.
//

import UIKit

protocol LoginViewProtocol: class {
    var presenter: LoginPresenterProtocol? { get set }
    
    func login(_ sender: Any)
    func usernameEditingChange(_ sender: Any)
    func textChanged()
    func navigateToRegister(_ sender: Any)
}
