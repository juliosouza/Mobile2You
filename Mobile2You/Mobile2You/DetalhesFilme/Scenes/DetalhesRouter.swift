//
//  DetalhesRouter.swift
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

@objc protocol DetalhesRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol DetalhesDataPassing
{
  var dataStore: DetalhesDataStore? { get }
}

class DetalhesRouter: NSObject, DetalhesRoutingLogic, DetalhesDataPassing
{
  weak var viewController: DetalhesViewController?
  var dataStore: DetalhesDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: DetalhesViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: DetalhesDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
