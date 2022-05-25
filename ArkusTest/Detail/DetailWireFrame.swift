//
//  DetailWireFrame.swift
//  ArkusTest
//
//  Created by Mauricio Zarate on 24/05/22.
//  
//

import Foundation
import UIKit

class DetailWireFrame: DetailWireFrameProtocol {
    
    static func createDetailModule(with data: ArkaElement) -> UIViewController {
        let viewCo = mainStoryboard.instantiateViewController(withIdentifier: "DetailView")
        if let view = viewCo as? DetailView {
            let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
            let interactor: DetailInteractorInputProtocol & DetailRemoteDataManagerOutputProtocol = DetailInteractor()
            let localDataManager: DetailLocalDataManagerInputProtocol = DetailLocalDataManager()
            let remoteDataManager: DetailRemoteDataManagerInputProtocol = DetailRemoteDataManager()
            let wireFrame: DetailWireFrameProtocol = DetailWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            presenter.datoArkaReceived = data
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return viewCo
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "DetailView", bundle: Bundle.main)
    }
    
    
    
}
