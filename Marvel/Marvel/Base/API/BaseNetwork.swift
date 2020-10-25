//
//  BaseNetwork.swift
//  Marvel
//
//  Created by Jorge Martínez on 25/10/2020.
//

import Foundation
import Alamofire

class BaseNetwork {
    
    func getData<T: Codable>(endpoint: APIRouter,
                             delegate: NetworkRequestProtocol?,
                             success: @escaping (T) -> Void,
                             failure: @escaping (AFError) -> Void) {
        delegate?.networkRequestWillStart()
        AF.request(APIRouter.getCharacters).responseDecodable { (response: DataResponse<T, AFError>) in
            switch response.result {
            case .success(let response):
                success(response)
                delegate?.networkRequestDidFinish()
            case .failure(let error):
                failure(error)
                delegate?.networkRequestDidFinish(error: error.localizedDescription)
            }
        }
    }
}
