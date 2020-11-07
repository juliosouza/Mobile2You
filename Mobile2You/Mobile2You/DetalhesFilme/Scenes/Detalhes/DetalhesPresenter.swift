//
//  DetalhesPresenter.swift
//  Mobile2You
//
//  Created by Julio Cezar de Souza on 06/11/20.
//

import UIKit


protocol DetalhesFilmePresentationLogic {
    func presentList(response: DetalhesFilmeEnum.Response)
    func presentDefaultError()
    
}

class DetalhesPresenter: DetalhesFilmePresentationLogic {
    
    weak var viewController: DetalhesFilmeDisplayLogic?
    
    func presentList(response: DetalhesFilmeEnum.Response) {
        viewController?.exibirDetalhesFilme(response: response)
    }
    
    func presentDefaultError() {
        viewController?.exibirErroDetalhesFilme()
    }
    
}
