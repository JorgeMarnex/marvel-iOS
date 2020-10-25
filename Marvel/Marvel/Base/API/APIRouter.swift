//
//  APIRouter.swift
//  Marvel
//
//  Created by Jorge Martínez on 24/10/2020.
//

import Foundation
import Alamofire

enum APIRouter: APIConfiguration {
    
    case getCharacters
    
    var method: HTTPMethod {
        switch self {
        case .getCharacters:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getCharacters:
            return "/v1/public/characters"
        }
    }
    var parameters: RequestParams {
        switch self {
        case .getCharacters:
            return .none
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        func setURLComponents(_ params: [URLQueryItem]) {
            var components = URLComponents(string:url.appendingPathComponent(path).absoluteString)
            components?.queryItems = queryParams
            urlRequest.url = components?.url
        }
        
        // Base URL + endpoint
        let url = try APIConstants.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Session parameters
        let queryParams = APIConstants.sessionParameters.map({ URLQueryItem(name: $0.key, value: "\($0.value)") })
        setURLComponents(queryParams)
        
        // Parameters
        switch parameters {
        case .body(let params):
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
        case .url(let params):
            let queryParams = params.map({ URLQueryItem(name: $0.key, value: "\($0.value)") })
            setURLComponents(queryParams)
        case .none:
            break
        }
        
        return urlRequest
    }
}
