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
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet var nav: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        self.setupNav()
    }
    
    private func setupNav() {
    
    }
}

extension HomeView: HomeViewProtocol {
    
}
