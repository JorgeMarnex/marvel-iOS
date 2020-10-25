//
//  CreateAccountCoordinator.swift
//  Marvel
//
//  Created by Jorge Martínez on 24/10/2020.
//

import Foundation
import UIKit

protocol CharactersDetailCoordinatorDelegate: class {
    func didFinish()
}

final class CharactersDetailCoordinator: BaseCoordinator, CharactersDetailCoordinatorDelegate {
    
    private var viewModel: CharactersDetailViewModel?
    private var viewController: CharactersDetailViewController?
    var character: Character?
    
    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
    }
    
    override func start(parentCoordinator: CoordinatorType? = nil) {
        super.start(parentCoordinator: parentCoordinator)
        viewController = CharactersDetailViewController.instantiate()
        viewModel = CharactersDetailViewModel(coordinatorDelegate: self, visualResponseDelegate: viewController)
        viewModel?.character = character
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
