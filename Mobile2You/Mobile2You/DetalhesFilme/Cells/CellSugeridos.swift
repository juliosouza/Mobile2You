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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tabelaSugeridosInfo.delegate = self
        tabelaSugeridosInfo.dataSource = self
    }
    
    var sugeridos: [SugeridosEnum.results] = []
    
    func configurar(_ lista: [SugeridosEnum.results]) {
        sugeridos = lista
        tabelaSugeridosInfo.reloadData()
        alturaTabelaSugeridos.constant = tabelaSugeridosInfo.contentSize.height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sugeridos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celulaSugeridosInfo") as! CellSugeridosInfo
        cell.configurar(sugeridos[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
