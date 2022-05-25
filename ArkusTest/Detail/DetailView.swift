//
//  DetailView.swift
//  ArkusTest
//
//  Created by Mauricio Zarate on 24/05/22.
//  
//

import Foundation
import UIKit
import GoogleMaps

class DetailView: UIViewController {

    // MARK: Properties
    var presenter: DetailPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavBarDetail()
        presenter?.viewDidLoad()
    }
    
    func configNavBarDetail() {
            title = "DETAIL"
        navigationController?.navigationBar.tintColor = .darkGray
            view.backgroundColor = .white
    }
}

extension DetailView: DetailViewProtocol {
    // TODO: implement view output methods
}
