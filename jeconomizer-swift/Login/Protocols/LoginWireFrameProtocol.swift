//
//  LoginWireFrameProtocol.swift
//  jeconomizer-swift
//
//  Created by Jose Pol Sastre on 27/8/18.
//  Copyright © 2018 Jose Pol Sastre. All rights reserved.
//

import UIKit

protocol LoginWireFrameProtocol: class {
    static func createLoginModule() -> UIViewController
    func redirectToHome(from view: LoginViewProtocol)
}
