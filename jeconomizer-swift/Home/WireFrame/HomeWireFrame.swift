//
//  HomeWireFrame.swift
//  jeconomizer-swift
//
//  Created by Jose Pol Sastre on 29/8/18.
//  Copyright © 2018 Jose Pol Sastre. All rights reserved.
//

import UIKit

class HomeWireFrame: HomeWireFrameProtocol {
    class func createHomeModule() -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "HomeController")
        if let view = viewController as? HomeView {
            let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
            let interactor: HomeInteractorInputProtocol & HomeInteractorOutputProtocol = HomeInteractor()
            let wireframe: HomeWireFrameProtocol = HomeWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireframe = wireframe
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            let preferences = UserDefaults.standard
            if preferences.object(forKey: "token") == nil {
                print("No token")
            } else {
                let token = preferences.string(forKey: "token")
                print("The token is \(String(describing: token))")
            }
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
