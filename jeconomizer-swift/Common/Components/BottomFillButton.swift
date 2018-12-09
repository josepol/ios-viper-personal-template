//
//  BottomFillButton.swift
//  jeconomizer-swift
//
//  Created by Jose Pol Sastre on 28/8/18.
//  Copyright © 2018 Jose Pol Sastre. All rights reserved.
//

import UIKit

class BottomFillButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        let view = UIView(frame: rect)
        view.backgroundColor = UIColor(red: 125/255, green: 125/255, blue: 125/255, alpha: 1.0)
        view.tintColor = UIColor.white
        view.isUserInteractionEnabled = false
        view.autoresizingMask = [.flexibleWidth]
        
        let gradient = CAGradientLayer()
        let endColor = UIColor(red: 125/255, green: 125/255, blue: 125/255, alpha: 1.0)
        let startColor = UIColor(red: 225/255, green: 225/255, blue: 225/255, alpha: 1.0)
        gradient.frame = view.bounds
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        view.layer.insertSublayer(gradient, at: 0)
        
        self.addSubview(view)
        self.sendSubview(toBack: view)
    }

}
