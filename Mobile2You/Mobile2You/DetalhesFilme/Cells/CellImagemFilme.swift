//
//  CellImagemFilme.swift
//  Mobile2You
//
//  Created by Julio Cezar de Souza on 10/11/20.
//

import UIKit

class CellImagemFilme: UITableViewCell {
    
    @IBOutlet weak var imagemFilme: UIImageView!
    
    func configurar(_ detalhes: DetalhesFilmeEnum.Response?) {
        if let path = detalhes?.backdrop_path {
            imagemFilme.download(from: Constants.baseImageURL + path)
        }
    }
}
