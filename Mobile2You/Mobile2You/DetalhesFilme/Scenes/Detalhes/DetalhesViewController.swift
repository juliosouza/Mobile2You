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


class DetalhesViewController: UIViewController, DetalhesFilmeDisplayLogic, UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        
                case 0:
                    let cellImagem = tableView.dequeueReusableCell(withIdentifier: "cellImagem", for: indexPath) as! CellImagemFilme
                    cellImagem.imagemFilme.download(from: Constants.baseImageURL + (detalhes?.backdrop_path ?? ""))
                    return cellImagem
                    
                case 1:
                     let cellInfos = tableView.dequeueReusableCell(withIdentifier: "cellInfos") as! CellInfosFilme
                     cellInfos.infosFilme.text = detalhes?.title
                    return cellInfos
                    
                default:
                return UITableViewCell()
        }
        
    }
    
    
    
    
    //MARK: Outlets
    
    @IBOutlet weak var tabelaFilmes: UITableView!
    
    
    
    
    
    //MARK: Variables
    
    var interactor: InterfaceDetalhesInteractor?
    var detalhes: DetalhesFilmeEnum.Response?
    
    
    
    //MARK: View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabelaFilmes.dataSource = self
        self.tabelaFilmes.delegate = self
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
        
        guard let infos = detalhes else { return }
        
//        tituloFilme.text = infos.title
//
//        imagemFilme.download(from: Constants.baseImageURL + infos.backdrop_path)
    }
    
    func exibirErroDetalhesFilme() {
        print("Alert: Erro da requisição")
    }
}
