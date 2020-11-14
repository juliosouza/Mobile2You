//
//  CellInfosFilme.swift
//  Mobile2You
//
//  Created by Julio Cezar de Souza on 11/11/20.
//

import UIKit

class CellInfosFilme: UITableViewCell {


    @IBOutlet weak var infosFilme: UILabel!
    @IBOutlet weak var curtidasLabel: UILabel!
    @IBOutlet weak var popularidadeLabel: UILabel!
    
    func configurar(_ detalhes: DetalhesFilmeEnum.Response?) {
        infosFilme.text = detalhes?.title
        curtidasLabel.text = "\(detalhes?.vote_count.arredondar ?? "0") curtidas"
        popularidadeLabel.text = "popularidade: \(detalhes?.popularity ?? 0)"
    }
}
