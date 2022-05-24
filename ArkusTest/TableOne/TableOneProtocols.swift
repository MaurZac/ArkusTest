//
//  TableOneProtocols.swift
//  ArkusTest
//
//  Created by Mauricio Zarate on 22/05/22.
//  
//

import Foundation
import UIKit

protocol TableOneViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: TableOnePresenterProtocol? { get set }
    func presenterPushDataView(received: [ArkaElement])
}

protocol TableOneWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createTableOneModule() -> UIViewController
}

protocol TableOnePresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: TableOneViewProtocol? { get set }
    var interactor: TableOneInteractorInputProtocol? { get set }
    var wireFrame: TableOneWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol TableOneInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
    func interPushDataPresenter(receivedData: [ArkaElement])
}

protocol TableOneInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: TableOneInteractorOutputProtocol? { get set }
    var localDatamanager: TableOneLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: TableOneRemoteDataManagerInputProtocol? { get set }
    
    func getData() 
}

protocol TableOneDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER

}

protocol TableOneRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: TableOneRemoteDataManagerOutputProtocol? { get set }
    func externalGetData()
}

protocol TableOneRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func remoteDataManagerCallBackData(with Arka: [ArkaElement])
}

protocol TableOneLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
