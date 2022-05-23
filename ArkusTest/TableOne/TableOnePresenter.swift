//
//  TableOnePresenter.swift
//  ArkusTest
//
//  Created by Mauricio Zarate on 22/05/22.
//  
//

import Foundation

class TableOnePresenter  {
    
    // MARK: Properties
    weak var view: TableOneViewProtocol?
    var interactor: TableOneInteractorInputProtocol?
    var wireFrame: TableOneWireFrameProtocol?
    
}

extension TableOnePresenter: TableOnePresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        print("heydesdeelpresenter")
        interactor?.getData()
    }
}

extension TableOnePresenter: TableOneInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
