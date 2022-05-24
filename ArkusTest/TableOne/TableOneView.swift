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
    var datResView = [ArkaElement]()
    
    let tableV: UITableView = {
       let tableV = UITableView()
        tableV.backgroundColor = .red
      return tableV
    }()
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavBar()
        tableV.dataSource = self
        tableV.delegate = self
        setUpView()
        tableV.register(TableOneViewCell.self, forCellReuseIdentifier: TableOneViewCell.identifier)
        //tableV.reloadData()
        tableV.layoutMargins = UIEdgeInsets.zero
        tableV.separatorInset = UIEdgeInsets.zero
        
        presenter?.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableV.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datResView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableV.dequeueReusableCell(withIdentifier: TableOneViewCell.identifier, for: indexPath as IndexPath) as! TableOneViewCell
        cell.photoImg.downloaded(from: datResView[indexPath.row].thumbnail)
        cell.nameLabel.text = datResView[indexPath.row].placeName
        cell.adddressLabel1.text = datResView[indexPath.row].addressLine1
        cell.adddressLabel2.text = datResView[indexPath.row].addressLine2
        cell.distancelbl.text = "10.0 m"
        if datResView[indexPath.row].isPetFriendly {
            cell.petImg.image = UIImage(named: "dogFriendlyActive")
            cell.petlbl.text = "Pet Friendly"
            cell.petlbl.textColor = .systemGreen
        }else{
            cell.petImg.image = UIImage(named: "")
            cell.petlbl.text = "Pet Friendly"
            cell.petlbl.textColor = UIColor(named: "addressColor")
        }
        cell.layoutMargins = UIEdgeInsets.zero
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
    func presenterPushDataView(received: [ArkaElement]) {
        self.datResView = received
        DispatchQueue.main.async {
            self.tableV.reloadData()
        }
    }
}

extension UIImageView {
    
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}


