//
//  DetalhesViewController.swift
//  Mobile2You
//
//  Created by Julio Cezar de Souza on 06/11/20.
//

import UIKit

protocol DetalhesFilmeDisplayLogic: class {
    func exibirDetalhesFilme(response: DetalhesFilmeEnum.Response)
    func exibirErroDetalhesFilme()
}


class DetalhesViewController: UIViewController, DetalhesFilmeDisplayLogic {
    
    //MARK: Variables
    
    var interactor: InterfaceDetalhesInteractor?
    var detalhes: DetalhesFilmeEnum.Response?
    
    
    
    //MARK: View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carregaDetalhes()
    }
    
    
    
    // MARK: Initializer
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        
        let viewController = self
        let interactor = DetalhesInteractor()
        let presenter = DetalhesPresenter()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    
    
    
    //MARK: Functions
    
    func carregaDetalhes() {
        
        interactor?.carregaDetalhesFilme()
    }
    
    func exibirDetalhesFilme(response: DetalhesFilmeEnum.Response) {
        detalhes = response
    }
    
    func exibirErroDetalhesFilme() {
        print("Alert: Erro da requisição")
    }
}
