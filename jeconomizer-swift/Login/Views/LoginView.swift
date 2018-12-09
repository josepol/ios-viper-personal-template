//
//  LoginView.swift
//  jeconomizer-swift
//
//  Created by Jose Pol Sastre on 27/8/18.
//  Copyright © 2018 Jose Pol Sastre. All rights reserved.
//

import UIKit

class LoginView: UIViewController {
    var presenter: LoginPresenterProtocol?
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var invalidCredentialsMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func navigateToRegister(_ sender: Any) {
        presenter?.navigateToRegister()
    }
    
}

extension LoginView: LoginViewProtocol {

    @IBAction func login(_ sender: Any) {
        if !username.hasText || !password.hasText {
            invalidCredentialsMessage.isHidden = false
            return
        }
        presenter?.login(username: username.text!, password: password.text!)
    }
    
    @IBAction func usernameEditingChange(_ sender: Any) {
        self.textChanged()
    }
    
    @IBAction func passwordTextChanged(_ sender: Any) {
        self.textChanged()
    }
    
    func textChanged() {
        invalidCredentialsMessage.isHidden = true
    }
    
    func showErrorMessage() {
        invalidCredentialsMessage.isHidden = false
    }
}
