//
//  CreateAccountCoordinator.swift
//  Marvel
//
//  Created by Jorge Martínez on 24/10/2020.
//

import Foundation
import UIKit

protocol CreateAccountCoordinatorDelegate: class {
    func didFinish()
}

class CreateAccountCoordinator: BaseCoordinator, CreateAccountCoordinatorDelegate {
    
    private var viewModel: CreateAccountViewModel?
    private var viewController: CreateAccountViewController?
    
    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
    }
    
    override func start(parentCoordinator: CoordinatorType? = nil) {
        super.start(parentCoordinator: parentCoordinator)
        viewController = CreateAccountViewController.instantiate()
        viewModel = CreateAccountViewModel(coordinatorDelegate: self)
        viewController?.viewModel = viewModel
        
        if let vc = viewController {
            navigationController.pushViewController(vc, animated: true)
        }
    }
    
    override func didFinish() {
        super.didFinish()
        viewModel = nil
    }
}
