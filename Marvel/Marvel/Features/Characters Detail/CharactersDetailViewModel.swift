//
//  CreateAccountViewModel.swift
//  Marvel
//
//  Created by Jorge Martínez on 24/10/2020.
//

import Foundation
import UIKit

final class CharactersDetailViewModel: BaseViewModel {
    
    weak var coordinatorDelegate: CharactersDetailCoordinatorDelegate?
    
    var character: Character?
    
    var characterName: String? {
        character?.name
    }
    
    var characterDescription: String? {
        let description = character?.description
        return description != "" ? description : "Empty description"
    }
    
    var characterImageURL: URL? {
        character?.characterImageURL
    }
    
    init(coordinatorDelegate: CharactersDetailCoordinatorDelegate, visualResponseDelegate: VisualResponseProtocol?) {
        super.init(visualResponseDelegate: visualResponseDelegate)
        self.coordinatorDelegate = coordinatorDelegate
    }
}

// MARK: Navigation
extension CharactersDetailViewModel {
    
    func didFinish() {
        coordinatorDelegate?.didFinish()
    }
}
