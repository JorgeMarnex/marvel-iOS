//
//  Coordinator.swift
//  Marvel
//
//  Created by Jorge Martínez on 23/10/2020.
//

import Foundation
import UIKit

protocol CoordinatorType: AnyObject {
    
    var parentCoordinator: CoordinatorType? { get set }
    var childCoordinators: [CoordinatorType] { get set }
    var navigationController: UINavigationController { get set }
    
    func start(parentCoordinator: CoordinatorType?)
    func didFinish()
    func childDidFinish()
    
    func add(child: CoordinatorType)
    func remove(child: CoordinatorType)
}
