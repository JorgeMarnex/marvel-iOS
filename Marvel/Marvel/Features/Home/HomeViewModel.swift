//
//  HomeViewModel.swift
//  Marvel
//
//  Created by Jorge Martínez on 24/10/2020.
//

import Foundation
import UIKit

class HomeViewModel {
    
    weak var coordinatorDelegate: HomeCoordinatorDelegate?
    
    init(coordinatorDelegate: HomeCoordinatorDelegate) {
        self.coordinatorDelegate = coordinatorDelegate
    }
    
    func pushToCreateAccount() {
        coordinatorDelegate?.pushToCreateAccount()
    }
    
    func didFinish() {
        coordinatorDelegate?.didFinish()
    }
}
