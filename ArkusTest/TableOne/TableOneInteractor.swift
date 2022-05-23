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
    
    func getData() {
        remoteDatamanager?.externalGetData()
    }
}

extension TableOneInteractor: TableOneRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
