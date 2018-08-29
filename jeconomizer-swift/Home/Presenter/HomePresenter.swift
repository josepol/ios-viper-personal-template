//
//  HomePresenter.swift
//  jeconomizer-swift
//
//  Created by Jose Pol Sastre on 29/8/18.
//  Copyright © 2018 Jose Pol Sastre. All rights reserved.
//

class HomePresenter: HomePresenterProtocol {
    var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireframe: HomeWireFrameProtocol?

    func viewDidLoad() {
        print("view did load in presenter")
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    
}
