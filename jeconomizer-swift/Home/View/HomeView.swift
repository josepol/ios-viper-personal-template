//
//  HomeView.swift
//  jeconomizer-swift
//
//  Created by Jose Pol Sastre on 29/8/18.
//  Copyright © 2018 Jose Pol Sastre. All rights reserved.
//

import UIKit

class HomeView: UIViewController {
    var presenter: HomePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension HomeView: HomeViewProtocol {
    
}
