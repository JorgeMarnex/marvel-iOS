//
//  CreateAccountViewModel.swift
//  Marvel
//
//  Created by Jorge Martínez on 24/10/2020.
//

import Foundation
import UIKit

class CreateAccountViewModel {
    
    weak var coordinatorDelegate: CreateAccountCoordinatorDelegate?
    
    init(coordinatorDelegate: CreateAccountCoordinatorDelegate) {
        self.coordinatorDelegate = coordinatorDelegate
    }
    
    func didFinish() {
        coordinatorDelegate?.didFinish()
    }
}
