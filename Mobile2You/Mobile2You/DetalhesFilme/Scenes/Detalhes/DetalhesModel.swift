//
//  DetalhesModel.swift
//  Mobile2You
//
//  Created by Julio Cezar de Souza on 06/11/20.
//

import Foundation

enum DetalhesFilmeEnum {
    
    struct Response: Codable {
        let id: Int
        let backdrop_path: String
        let popularity: Double
        let vote_count: Int
    }
    
    struct Request {
        let service: DetalhesFilmeAPI
    }
    
    enum DetalhesFilmeAPI {
        case get
    }
}

extension DetalhesFilmeEnum.DetalhesFilmeAPI: Endpoint {
    var base: String {
        return Constants.baseURL
    }
    
    var path: String {
        switch self {
        case .get: return Constants.pathDetail
        }
    }


}
