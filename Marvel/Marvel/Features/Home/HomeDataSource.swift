//
//  HomeDataSource.swift
//  Marvel
//
//  Created by Jorge Martínez on 24/10/2020.
//

import Foundation
import Alamofire

class HomeDataSource {
        
    func getData() {
        AF.request(APIRouter.getData).responseDecodable { (response: DataResponse<HomeResponse, AFError>) in
            switch response.result {
            case .success(let response):
                debugPrint(response.id ?? "")
            case .failure(let error):
                debugPrint(error.errorDescription ?? "")
            }
        }
    }
}
