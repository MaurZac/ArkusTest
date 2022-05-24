//
//  TableOneInteractor.swift
//  ArkusTest
//
//  Created by Mauricio Zarate on 22/05/22.
//  
//

import Foundation

class TableOneInteractor: TableOneInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: TableOneInteractorOutputProtocol?
    var localDatamanager: TableOneLocalDataManagerInputProtocol?
    var remoteDatamanager: TableOneRemoteDataManagerInputProtocol?
    
    var dataResponse = [ArkaElement]()
    
    func getData() {
        remoteDatamanager?.externalGetData()
    }
    
}

extension TableOneInteractor: TableOneRemoteDataManagerOutputProtocol {
    
    func remoteDataManagerCallBackData(with Arka: [ArkaElement]) {
        dataResponse = Arka
        presenter?.interPushDataPresenter(receivedData: dataResponse)
    }
    
    // TODO: Implement use case methods
}
