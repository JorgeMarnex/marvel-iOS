//
//  CreateAccountViewModel.swift
//  Marvel
//
//  Created by Jorge Martínez on 24/10/2020.
//

import Foundation
import UIKit

class CharactersDetailViewModel: BaseViewModel {
    
    weak var coordinatorDelegate: CharactersDetailCoordinatorDelegate?
    
    init(coordinatorDelegate: CharactersDetailCoordinatorDelegate, visualResponseDelegate: VisualResponseProtocol?) {
        super.init(visualResponseDelegate: visualResponseDelegate)
        self.coordinatorDelegate = coordinatorDelegate
    }
}

// MARK: Navigation
extension CreateAccountViewModel {
    
    func didFinish() {
        coordinatorDelegate?.didFinish()
    }
}
