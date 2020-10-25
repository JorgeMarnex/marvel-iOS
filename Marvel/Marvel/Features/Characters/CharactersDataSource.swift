//
//  HomeDataSource.swift
//  Marvel
//
//  Created by Jorge Martínez on 24/10/2020.
//

import Foundation
import Alamofire

class CharactersDataSource: BaseNetwork {
        
    func getCharacters(delegate: NetworkRequestProtocol?,
                       success: @escaping (CharactersResponse) -> Void,
                       failure: @escaping (AFError) -> Void) {
        
        getData(endpoint: .getCharacters, delegate: delegate, success: success, failure: failure)
    }
}
