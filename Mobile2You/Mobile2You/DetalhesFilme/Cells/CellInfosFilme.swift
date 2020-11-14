//
//  CellInfosFilme.swift
//  Mobile2You
//
//  Created by Julio Cezar de Souza on 11/11/20.
//

import UIKit

class CellInfosFilme: UITableViewCell {


    @IBOutlet weak var infosFilme: UILabel!
    
    func configurar(_ detalhes: DetalhesFilmeEnum.Response?) {
        infosFilme.text = detalhes?.title
    }
}
