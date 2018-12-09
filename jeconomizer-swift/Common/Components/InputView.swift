//
//  InputView.swift
//  jeconomizer-swift
//
//  Created by Jose Pol Sastre on 2/12/18.
//  Copyright © 2018 Jose Pol Sastre. All rights reserved.
//

import UIKit

class InputView: UITextField {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setBackgroundColor()
    }
    
    override func draw(_ rect: CGRect) {
        createBorderBottom(rect: rect)
    }
    
    func setBackgroundColor() {
        self.backgroundColor = .white
    }
    
    func createBorderBottom(rect: CGRect) {
        let border = CALayer()
        let width = CGFloat(4.0)
        border.borderColor = UIColor(red: 125/255, green: 125/255, blue: 125/255, alpha: 1.0).cgColor
        border.frame = CGRect(x: 0, y: rect.height-width, width: rect.width, height: rect.height)
        border.borderWidth = width
        self.layer.cornerRadius = CGFloat(5.0)
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }

}
