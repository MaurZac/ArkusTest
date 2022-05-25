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
        interactor?.getData()
    }
    func showDetailView(with data: ArkaElement) {
        wireFrame?.presentNewViewDetail(from: view!, withData: data)
    }
}

extension TableOnePresenter: TableOneInteractorOutputProtocol {
    // TODO: implement interactor output methods
    func interPushDataPresenter(receivedData: [ArkaElement]) {
        view?.presenterPushDataView(received: receivedData)
        
    }
    
}
