//
//  StringUtils.swift
//  Mobile2You
//
//  Created by Julio Cezar de Souza on 13/11/20.
//

import Foundation

struct StringUtils {
    
    static func getFormattedDate(string: String , formatter:String) -> String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy"

        let date: Date? = dateFormatterGet.date(from: string)
        return dateFormatterPrint.string(from: date ?? Date());
    }
}
