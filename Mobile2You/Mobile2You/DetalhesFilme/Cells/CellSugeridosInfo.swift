//
//  CellSugeridosInfo.swift
//  Mobile2You
//
//  Created by Julio Cezar de Souza on 13/11/20.
//

import UIKit

class CellSugeridosInfo: UITableViewCell {

    @IBOutlet weak var imagemSugeridos: UIImageView!
    @IBOutlet weak var tituloSugeridos: UILabel!
    @IBOutlet weak var anoSugeridos: UILabel!
    @IBOutlet weak var generoSugeridos: UILabel!
    
    func configurar(_ sugeridos: SugeridosEnum.results) {
        imagemSugeridos.download(from: Constants.baseImageURL + (sugeridos.poster_path))
        tituloSugeridos.text = sugeridos.title
        anoSugeridos.text = StringUtils.getFormattedDate(string: sugeridos.release_date, formatter: "yyyy")
    }

}
