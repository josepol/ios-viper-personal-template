//
//  HomeTableViewCell.swift
//  jeconomizer-swift
//
//  Created by Jose Pol Sastre on 7/12/18.
//  Copyright © 2018 Jose Pol Sastre. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var stackview: UIStackView!

    let amountLabel = UILabel()
    let descriptionLabel = UILabel()
    let dateLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.amountLabel.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let font = UIFont(name: "Helvetica", size: 20.0)
        self.amountLabel.font = font
        self.descriptionLabel.font = font
        self.dateLabel.font = font
        
        self.stackview = self.setupStackview()
        self.contentView.addSubview(stackview)
        self.setupStackviewConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /*override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = UIEdgeInsetsInsetRect(contentView.frame, UIEdgeInsetsMake(7, 7, 7, 7))
    }*/

    func setupStackview() -> UIStackView {
        let stackview = UIStackView()
        stackview.addArrangedSubview(self.amountLabel)
        stackview.addArrangedSubview(self.descriptionLabel)
        stackview.addArrangedSubview(self.dateLabel)
        
        stackview.addBackground(color: UIColor.red)
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        
        return stackview
    }
    
    func setupStackviewConstraints() {
        self.stackview.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.stackview.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor).isActive = true
        self.stackview.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.stackview.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
}

extension UIStackView {
    
    func addBackground(color: UIColor) {
        let subview = UIView(frame: bounds)
        subview.backgroundColor = color
        subview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subview, at: 0)
    }
    
}
