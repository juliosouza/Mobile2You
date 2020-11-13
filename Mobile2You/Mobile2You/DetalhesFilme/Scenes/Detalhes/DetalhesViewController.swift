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


class DetalhesViewController: UIViewController, DetalhesFilmeDisplayLogic, UITableViewDataSource, UITableViewDelegate {

    
    
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
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
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
                    
                case 2:
                    let cellSugeridos = tableView.dequeueReusableCell(withIdentifier: "cellSugeridos", for: indexPath) as! CellSugeridos
                    cellSugeridos.imagemSugeridos.download(from: Constants.baseImageURL + (sugeridos?.results[indexPath.row].poster_path ?? ""))
                    cellSugeridos.tituloSugeridos.text = sugeridos?.results[indexPath.row].title
                    cellSugeridos.anoSugeridos.text = sugeridos?.results[indexPath.row].release_date
                    return cellSugeridos
                    
                default:
                return UITableViewCell()
        }
        
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
    }
    
    func exibirSugeridos(response: SugeridosEnum.Response) {
        sugeridos = response
    }
    
    
    func exibirErroDetalhesFilme() {
        print("Alert: Erro da requisição")
    }
}
