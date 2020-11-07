//
//  DetalhesInteractor.swift
//  Mobile2You
//
//  Created by Julio Cezar de Souza on 06/11/20.
//

import UIKit

protocol InterfaceDetalhesInteractor {
    func carregaDetalhesFilme()
}

class DetalhesInteractor: InterfaceDetalhesInteractor {
    
    //MARK: Variables
    
    var worker: DetalhesWorker?
    var presenter: DetalhesPresenter?
    
    
    
    func carregaDetalhesFilme() {
        
        worker = DetalhesWorker()
        let request = DetalhesFilmeEnum.Request(service: .get)
        
        worker?.getDetalhesFilmes(request: request, completion: { (result) in
            switch result {
            case .success(let response):
                guard let resp = response else {
                    self.presenter?.presentDefaultError()
                    return }
                self.presenter?.presentList(response: resp)
            case .failure(let error):
                print(error.localizedDescription)
                self.presenter?.presentDefaultError()
            }
        })
        
    }
    
    
}
