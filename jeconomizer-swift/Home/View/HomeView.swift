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
        Movement(description: "description 345", amount: "234", date: "345345344"),
        Movement(description: "description 567", amount: "234", date: "678678"),
        Movement(description: "description 567", amount: "234", date: "678678"),
    ]
    
    var presenter: HomePresenterProtocol?
    
    var tableView: UITableView!
    var navigationBar: NavigationBarView!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupNav()
        setupMovements()
    }
    
    private func setupNav() {
        self.navigationBar = NavigationBarView()
        self.navigationBar.layer.zPosition = 1
        self.setupNavItem()
        self.view.addSubview(self.navigationBar)
        self.setupNavConstraints()
        
        let navBackground = self.setupNavBackground()
        self.view.addSubview(navBackground)
        self.setupNavBackgroundConstraints(navBackground: navBackground)
    }
    
    private func setupNavItem() {
        let navItem = UINavigationItem()
        navItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addMovement))
        navItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(openMenu))
        navItem.title = "Home"
        self.navigationBar.setItems([navItem], animated: false)
    }
    
    private func setupNavBackground() -> UIImageView {
        let navBackground = UIImageView(image: UIImage(named: "login-bg"))
        navBackground.contentMode = .scaleToFill
        navBackground.layer.zPosition = 0
        return navBackground
    }
    
    private func setupNavConstraints() {
        self.navigationBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.navigationBar.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.navigationBar.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.navigationBar.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupNavBackgroundConstraints(navBackground: UIImageView) {
        navBackground.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        navBackground.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        navBackground.bottomAnchor.constraint(equalTo: self.navigationBar.bottomAnchor).isActive = true
        navBackground.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupMovements() {
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        self.tableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.tableView.separatorStyle = .none
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.view.addSubview(tableView)
        self.setupMovementsConstraints(tableView: tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setupMovementsConstraints(tableView: UITableView) {
        self.tableView.topAnchor.constraint(equalTo: self.navigationBar.bottomAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    @objc private func addMovement()  {
        print("add")
    }
    
    @objc private func openMenu() {
        print("open menu")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return items.count
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath as IndexPath) as! TableViewCell
        cell.selectionStyle = .none
        cell.descriptionLabel.text = items[indexPath.section].description
        cell.amountLabel.text = items[indexPath.section].amount
        cell.dateLabel.text = items[indexPath.section].date
        
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.section)")
        print("Value: \(items[indexPath.section].description)")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }

}

extension HomeView: HomeViewProtocol {
    
}
