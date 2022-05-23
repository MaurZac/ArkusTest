//
//  TableOneView.swift
//  ArkusTest
//
//  Created by Mauricio Zarate on 22/05/22.
//  
//

import Foundation
import UIKit

class TableOneView: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    

    // MARK: Properties
    var presenter: TableOnePresenterProtocol?
    let tableV: UITableView = {
       let tableV = UITableView()
        tableV.backgroundColor = .red
        tableV.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
      return tableV
    }()
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavBar()
        tableV.dataSource = self
        tableV.delegate = self
        setUpView()
        presenter?.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableV.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableV.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        cell.textLabel?.text = "uno dos"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func setUpView(){
        view.addSubview(tableV)
        tableV.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        tableV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    
    func configNavBar() {
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 40, height: 40))
        let image = UIImage(named: "logomain")
            imageView.image = image
            navigationItem.titleView = imageView
            view.backgroundColor = .systemGray5
            self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
            self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            self.navigationController?.navigationBar.layer.shadowRadius = 4.0
            self.navigationController?.navigationBar.layer.shadowOpacity = 1.0
            self.navigationController?.navigationBar.layer.masksToBounds = false
    }
}



extension TableOneView: TableOneViewProtocol {
    // TODO: implement view output methods
}


