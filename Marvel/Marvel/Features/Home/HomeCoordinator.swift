//
//  HomeCoordinator.swift
//  Marvel
//
//  Created by Jorge Martínez on 24/10/2020.
//

import Foundation
import UIKit

protocol HomeCoordinatorDelegate: class {
    func pushToCreateAccount()
    func didFinish()
}

class HomeCoordinator: BaseCoordinator {
    
    private var viewModel: HomeViewModel?
    private var viewController: HomeViewController?
    
    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
    }
    
    override func start(parentCoordinator: CoordinatorType? = nil) {
        super.start(parentCoordinator: parentCoordinator)
        viewController = HomeViewController.instantiate()
        viewModel = HomeViewModel(coordinatorDelegate: self)
        viewController?.viewModel = viewModel
        
        if let vc = viewController {
            navigationController.pushViewController(vc, animated: false)
        }
    }
    
    override func didFinish() {
        super.didFinish()
        viewModel = nil
    }
}

extension HomeCoordinator: HomeCoordinatorDelegate {
    
    func pushToCreateAccount() {
        let child = CreateAccountCoordinator(navigationController: navigationController)
        child.start(parentCoordinator: self)
    }
}
