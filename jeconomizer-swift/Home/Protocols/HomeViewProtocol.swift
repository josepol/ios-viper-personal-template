//
//  HomeViewProtocol.swift
//  jeconomizer-swift
//
//  Created by Jose Pol Sastre on 29/8/18.
//  Copyright © 2018 Jose Pol Sastre. All rights reserved.
//

import UIKit

protocol HomeViewProtocol: class {
    var presenter: HomePresenterProtocol? { get set }
}
