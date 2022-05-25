//
//  DetailPresenter.swift
//  ArkusTest
//
//  Created by Mauricio Zarate on 24/05/22.
//  
//

import Foundation

class DetailPresenter: DetailPresenterProtocol  {
    
    
    
    
    
    // MARK: Properties
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var wireFrame: DetailWireFrameProtocol?
    var datoArkaReceived: ArkaElement?
    func viewDidLoad() {
        print("Hola desde el presenter y tengo el dato \(datoArkaReceived)")
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
