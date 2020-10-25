//
//  HomeViewModel.swift
//  Marvel
//
//  Created by Jorge Martínez on 24/10/2020.
//

import Foundation
import UIKit

class CharactersViewModel: BaseViewModel {
    
    weak var coordinatorDelegate: CharactersCoordinatorDelegate?
    private var dataSource: CharactersDataSource = CharactersDataSource()
    
    var characters: CharactersResponse? {
        didSet {
            updateCharacters()
        }
    }
    
    var charactersCount: Int {
        characters?.data?.results?.count ?? 0
    }
    
    var updateCharacters: (() -> Void) = {}
    
    init(coordinatorDelegate: CharactersCoordinatorDelegate, visualResponseDelegate: VisualResponseProtocol?) {
        super.init(visualResponseDelegate: visualResponseDelegate)
        self.coordinatorDelegate = coordinatorDelegate
    }
}

// MARK: WebServices
extension CharactersViewModel {
    
    func getCharacters() {
        dataSource.getCharacters(delegate: self) { [weak self] response in
            guard let `self` = self else { return }
            self.characters = response
        } failure: { (error) in
            
        }
    }
}

// MARK: Navigation
extension CharactersViewModel {
    
    func pushToCreateAccount() {
        coordinatorDelegate?.pushToCreateAccount()
    }
    
    func didFinish() {
        coordinatorDelegate?.didFinish()
    }
}
