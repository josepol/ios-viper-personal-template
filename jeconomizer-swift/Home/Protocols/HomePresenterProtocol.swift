//
//  HomePresenterProtocol.swift
//  jeconomizer-swift
//
//  Created by Jose Pol Sastre on 29/8/18.
//  Copyright © 2018 Jose Pol Sastre. All rights reserved.
//

import UIKit

protocol HomePresenterProtocol: class {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireframe: HomeWireFrameProtocol? { get set }
    
    func viewDidLoad()
}
