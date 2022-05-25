//
//  TableOneRemoteDataManager.swift
//  ArkusTest
//
//  Created by Mauricio Zarate on 22/05/22.
//  
//

import Foundation

class TableOneRemoteDataManager:TableOneRemoteDataManagerInputProtocol {

    var remoteRequestHandler: TableOneRemoteDataManagerOutputProtocol?
    
    func externalGetData() {
        print("externalRomateDM")
        guard let url = URL(string: "http://www.mocky.io/v2/5bf3ce193100008900619966") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let res = try? JSONDecoder().decode(Arka.self, from: data) {
                    self.remoteRequestHandler?.remoteDataManagerCallBackData(with: res)
                } else {
                    print("Invalid Response")
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        task.resume()
    }
    
    
}
