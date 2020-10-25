//
//  BaseViewModel.swift
//  Marvel
//
//  Created by Jorge Martínez on 25/10/2020.
//

import Foundation

protocol NetworkRequestProtocol: class {
    func networkRequestWillStart()
    func networkRequestDidFinish()
    func networkRequestDidFinish(error: String)
}

class BaseViewModel: NetworkRequestProtocol {

    weak var visualResponseDelegate: VisualResponseProtocol?
    
    init(visualResponseDelegate: VisualResponseProtocol?) {
        self.visualResponseDelegate = visualResponseDelegate
    }
    
    func networkRequestWillStart() {
        visualResponseDelegate?.showLoader()
    }
    
    func networkRequestDidFinish() {
        visualResponseDelegate?.hideLoader()
    }
    
    func networkRequestDidFinish(error: String) {
        visualResponseDelegate?.hideLoader()
        visualResponseDelegate?.showError(error: error)
    }
}
