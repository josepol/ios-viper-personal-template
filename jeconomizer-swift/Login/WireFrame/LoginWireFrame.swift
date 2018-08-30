//
//  LoginWireFrame.swift
//  jeconomizer-swift
//
//  Created by Jose Pol Sastre on 27/8/18.
//  Copyright © 2018 Jose Pol Sastre. All rights reserved.
//

import UIKit

class LoginWireFrame: LoginWireFrameProtocol {

    class func createLoginModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "JeconomizerNavigationController")
        if let view = navController.childViewControllers.first as? LoginView {
            let presenter: LoginPresenterProtocol & LoginInteractorOutputProtocol = LoginPresenter()
            let interactor: LoginInteractorInputProtocol = LoginInteractor()
            let wireframe: LoginWireFrameProtocol = LoginWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireframe
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func redirectToHome(from view: LoginViewProtocol) {
        let homeViewController = HomeWireFrame.createHomeModule()
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(homeViewController, animated: true)
        }
    }
    
    func navigateToRegister() {
        
    }
}
