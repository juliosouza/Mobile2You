//
//  CellSugeridos.swift
//  Mobile2You
//
//  Created by Julio Cezar de Souza on 12/11/20.
//

import UIKit

class CellSugeridos: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tabelaSugeridosInfo: UITableView!
    @IBOutlet weak var alturaTabelaSugeridos: NSLayoutConstraint!
    
    
    
    var sugeridos: [SugeridosEnum.results] = []
    
    func configurar(_ lista: [SugeridosEnum.results]) {
        sugeridos = lista
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sugeridos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celulaSugeridosInfo", for: indexPath) as! CellSugeridosInfo
        cell.configurar(sugeridos[indexPath.row])
        return cell
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tabelaSugeridosInfo.delegate = self
        tabelaSugeridosInfo.dataSource = self
        alturaTabelaSugeridos.constant = tabelaSugeridosInfo.contentSize.height
        tabelaSugeridosInfo.reloadData()
    }
}
