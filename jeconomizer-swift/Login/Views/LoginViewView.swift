//
//  LoginViewView.swift
//  jeconomizer-swift
//
//  Created by Jose Pol Sastre on 2/12/18.
//  Copyright © 2018 Jose Pol Sastre. All rights reserved.
//

import UIKit

class LoginViewView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func draw(_ rect: CGRect) {
        addBackground()
    }
    
    func addBackground() {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageViewBackground.image = UIImage(named: "login-bg.png")
        imageViewBackground.contentMode = UIViewContentMode.scaleAspectFill
        imageViewBackground.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.addSubview(imageViewBackground)
        self.sendSubview(toBack: imageViewBackground)
    }
    
}


