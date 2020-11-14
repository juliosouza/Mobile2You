//
//  DetalhesViewController.swift
//  Mobile2You
//
//  Created by Julio Cezar de Souza on 06/11/20.
//

import UIKit

protocol DetalhesFilmeDisplayLogic: class {
    func exibirDetalhesFilme(response: DetalhesFilmeEnum.Response)
    func exibirSugeridos(response: SugeridosEnum.Response)
    func exibirErroDetalhesFilme()
}

class DetalhesViewController: UIViewController, DetalhesFilmeDisplayLogic {
    
    //MARK: Outlets
    
    @IBOutlet weak var tabelaFilmes: UITableView!
    
    //MARK: Variables
    
    var interactor: InterfaceDetalhesInteractor?
    var detalhes: DetalhesFilmeEnum.Response?
    var sugeridos: SugeridosEnum.Response?
    
    //MARK: View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabelaFilmes.dataSource = self
        self.tabelaFilmes.delegate = self
        carregaDetalhes()
        carregaSugeridos()
        tabelaFilmes.tableFooterView = UIView()
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
    
    func carregaSugeridos() {
        interactor?.carregaSugeridos()
    }
    
    func exibirDetalhesFilme(response: DetalhesFilmeEnum.Response) {
        detalhes = response
//        tabelaFilmes.reloadData()
    }
    
    func exibirSugeridos(response: SugeridosEnum.Response) {
        sugeridos = response
        tabelaFilmes.reloadData()
    }
    
    func exibirErroDetalhesFilme() {
        print("Alert: Erro da requisição")
    }
    
}

extension DetalhesViewController: UITableViewDataSource, UITableViewDelegate {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cellImagem = tableView.dequeueReusableCell(withIdentifier: "cellImagem") as! CellImagemFilme
            cellImagem.configurar(detalhes)
            return cellImagem
        case 1:
            let cellInfos = tableView.dequeueReusableCell(withIdentifier: "cellInfos") as! CellInfosFilme
            cellInfos.configurar(detalhes)
            return cellInfos
        
        case 2:
            let cellSugeridos = tableView.dequeueReusableCell(withIdentifier: "cellSugeridos") as! CellSugeridos
            cellSugeridos.configurar(sugeridos?.results ?? [])
            return cellSugeridos
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0: return 200
        case 1: return 80
        case 2: return UITableView.automaticDimension
        default: return UITableView.automaticDimension
        }
    }
}
