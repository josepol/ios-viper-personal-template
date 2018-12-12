//
//  NavigationBarView.swift
//  jeconomizer-swift
//
//  Created by Jose Pol Sastre on 6/12/18.
//  Copyright © 2018 Jose Pol Sastre. All rights reserved.
//

import UIKit

class NavigationBarView: UINavigationBar {
    
    override func draw(_ rect: CGRect) {
        self.backgroundColor = .clear
        self.frame.size.width = UIScreen.main.bounds.width
        self.tintColor = UIColor.white
        self.barTintColor = UIColor.white
        self.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
    }

}
