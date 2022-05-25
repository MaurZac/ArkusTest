//
//  TableOneWireFrame.swift
//  ArkusTest
//
//  Created by Mauricio Zarate on 22/05/22.
//  
//

import Foundation
import UIKit

class TableOneWireFrame: TableOneWireFrameProtocol {

    class func createTableOneModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "navigation")
        if let view = navController.children.first as? TableOneView {
            let presenter: TableOnePresenterProtocol & TableOneInteractorOutputProtocol = TableOnePresenter()
            let interactor: TableOneInteractorInputProtocol & TableOneRemoteDataManagerOutputProtocol = TableOneInteractor()
            let localDataManager: TableOneLocalDataManagerInputProtocol = TableOneLocalDataManager()
            let remoteDataManager: TableOneRemoteDataManagerInputProtocol = TableOneRemoteDataManager()
            let wireFrame: TableOneWireFrameProtocol = TableOneWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "TableOne", bundle: Bundle.main)
    }
    
    func presentNewViewDetail(from view: TableOneViewProtocol, withData: ArkaElement) {
        //crear nuevo modulo y llamado
        let newDetailView = DetailWireFrame.createDetailModule(with: withData)
        if let newView =  view as? UIViewController{
            newView.navigationController?.pushViewController(newDetailView, animated: true)
        }
    }
    
}
