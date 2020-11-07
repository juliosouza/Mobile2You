//
//  DetalhesViewController.swift
//  Mobile2You
//
//  Created by Julio Cezar de Souza on 06/11/20.
//

import UIKit


class DetalhesViewController: UIViewController {
    
    
    //MARK: Variables
    
    var interactor: InterfaceDetalhesInteractor?
    
    
    
    
    
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
        
        viewController.interactor = interactor
    }
    
    
    
    
    //MARK: Functions
    
    func carregaDetalhes() {
        
        interactor?.carregaDetalhesFilme()
    }
}
