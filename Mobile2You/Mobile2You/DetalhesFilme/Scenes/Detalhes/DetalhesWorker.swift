//
//  DetalhesWorker.swift
//  Mobile2You
//
//  Created by Julio Cezar de Souza on 06/11/20.
//

import UIKit

class DetalhesWorker: APIClient {
    
    var session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func getDetalhesFilmes(request: DetalhesFilmeEnum.Request, completion: @escaping (Result<DetalhesFilmeEnum.Response?, APIError>) -> Void) {
        let endpoint = request.service
        var request = endpoint.request

        guard let url = request.url else { return }
        guard let abs = url.absoluteString.removingPercentEncoding else { return }

        request.url = URL(string: abs)
        request.httpMethod = "get"
        fetch(with: request, decode: { json -> DetalhesFilmeEnum.Response? in
            guard let feedResult = json as? DetalhesFilmeEnum.Response else {
                return  nil }
            return feedResult
        }, completion: completion)
    }
    
}
