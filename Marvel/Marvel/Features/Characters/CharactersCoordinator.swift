//
//  HomeCoordinator.swift
//  Marvel
//
//  Created by Jorge Martínez on 24/10/2020.
//

import Foundation
import UIKit

protocol CharactersCoordinatorDelegate: class {
    func pushToCharactersDetail(character: Character?)
    func didFinish()
}

final class CharactersCoordinator: BaseCoordinator {
    
    private var viewModel: CharactersViewModel?
    private var viewController: CharactersViewController?
    
    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
    }
    
    override func start(parentCoordinator: CoordinatorType? = nil) {
        super.start(parentCoordinator: parentCoordinator)
        viewController = CharactersViewController.instantiate()
        viewModel = CharactersViewModel(coordinatorDelegate: self, visualResponseDelegate: viewController)
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

extension CharactersCoordinator: CharactersCoordinatorDelegate {
    
    func pushToCharactersDetail(character: Character?) {
        let child = CharactersDetailCoordinator(navigationController: navigationController)
        child.character = character
        child.start(parentCoordinator: self)
    }
}
