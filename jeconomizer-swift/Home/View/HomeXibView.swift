//
//  HomeXibView.swift
//  jeconomizer-swift
//
//  Created by Jose Pol Sastre on 9/11/18.
//  Copyright © 2018 Jose Pol Sastre. All rights reserved.
//

import UIKit

class HomeXibView: UIView {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var label: UILabel!

    let viewFromNib: UIView? = Bundle.main.loadNibNamed("HomeXibView", owner: nil, options: nil)?.first as! UIView
}
