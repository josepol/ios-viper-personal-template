//
//  HomeView.swift
//  jeconomizer-swift
//
//  Created by Jose Pol Sastre on 29/8/18.
//  Copyright © 2018 Jose Pol Sastre. All rights reserved.
//

import UIKit

struct Movement {
    var description: String
    var amount: String
    var date: String
}

class HomeView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let items: [Movement] = [
        Movement(description: "description 123", amount: "123", date: "123123123"),
        Movement(description: "description 234", amount: "234", date: "234234234"),
    ]
    
    var presenter: HomePresenterProtocol?
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupNav()
        // setupMovements()
    }
    
    private func setupNav() {
        let nav = NavigationBarView()
        nav.layer.zPosition = 1
        self.setupNavItem(nav: nav)
        self.view.addSubview(nav)
        self.setupNavConstraints(nav: nav)
        
        let navBackground = self.setupNavBackground()
        self.view.addSubview(navBackground)
        self.setupNavBackgroundConstraints(navBackground: navBackground, nav: nav)
    }
    
    private func setupNavItem(nav: NavigationBarView) {
        let navItem = UINavigationItem()
        navItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addMovement))
        navItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(openMenu))
        navItem.title = "Home"
        nav.setItems([navItem], animated: false)
    }
    
    private func setupNavBackground() -> UIImageView {
        let size = UIScreen.main.bounds.size
        let navBackground = UIImageView(image: UIImage(named: "login-bg"))
        navBackground.frame.size.width = size.width
        navBackground.frame.size.height = size.height
        navBackground.contentMode = .scaleToFill
        navBackground.layer.zPosition = 0
        return navBackground
    }
    
    private func setupNavConstraints(nav: NavigationBarView) {
        nav.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        nav.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        nav.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        nav.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupNavBackgroundConstraints(navBackground: UIImageView, nav: NavigationBarView) {
        navBackground.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        navBackground.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        navBackground.bottomAnchor.constraint(equalTo: nav.bottomAnchor).isActive = true
        navBackground.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupMovements() {
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        tableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        self.view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let leadingTable = NSLayoutConstraint(item: tableView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
        
        let trailingTable = NSLayoutConstraint(item: tableView, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0)
        
        let topTable = NSLayoutConstraint(item: tableView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 1, constant: 0)
        
        let bottomTable = NSLayoutConstraint(item: tableView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
        
        let margins = view.layoutMarginsGuide
        tableView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        
        view.addConstraints([leadingTable, trailingTable/*, topTable*/, bottomTable])
    }
    
    @objc private func addMovement()  {
        print("add")
    }
    
    @objc private func openMenu() {
        print("open menu")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath as IndexPath) as! TableViewCell
        print(cell.descriptionLabel)
        cell.descriptionLabel.text = items[indexPath.row].description
        cell.amountLabel.text = items[indexPath.row].amount
        cell.dateLabel.text = items[indexPath.row].date
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(items[indexPath.row].description)")
    }

}

extension HomeView: HomeViewProtocol {
    
}
