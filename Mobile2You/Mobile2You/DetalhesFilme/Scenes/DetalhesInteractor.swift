//
//  DetalhesInteractor.swift
//  Mobile2You
//
//  Created by Julio Cezar de Souza on 06/11/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DetalhesBusinessLogic
{
  func doSomething(request: Detalhes.Something.Request)
}

protocol DetalhesDataStore
{
  //var name: String { get set }
}

class DetalhesInteractor: DetalhesBusinessLogic, DetalhesDataStore
{
  var presenter: DetalhesPresentationLogic?
  var worker: DetalhesWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: Detalhes.Something.Request)
  {
    worker = DetalhesWorker()
    worker?.doSomeWork()
    
    let response = Detalhes.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
