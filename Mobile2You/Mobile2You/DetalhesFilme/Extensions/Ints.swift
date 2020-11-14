//
//  Ints.swift
//  Mobile2You
//
//  Created by Julio Cezar de Souza on 14/11/20.
//

import Foundation

extension Int {
    var arredondar: String {
        let number = Double(self)
        let thousand = number / 1000
        let million = number / 1000000
        if million >= 1.0 {
            return "\(round(million*10)/10)M"
        }
        else if thousand >= 1.0 {
            return "\(round(thousand*10)/10)K"
        }
        else {
            return "\(self)"
        }
    }
}
