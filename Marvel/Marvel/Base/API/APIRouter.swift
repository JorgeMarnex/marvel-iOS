//
//  APIRouter.swift
//  Marvel
//
//  Created by Jorge Martínez on 24/10/2020.
//

import Foundation
import Alamofire

enum APIRouter: APIConfiguration {
    
    case getData
    
    var method: HTTPMethod {
        switch self {
        case .getData:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getData:
            return ""
        }
    }
    var parameters: RequestParams {
        switch self {
        case .getData:
            return .body([:])
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        // Base URL + endpoint
        let url = try APIConstants.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        switch parameters {
        case .body(let params):
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
        case .url(let params):
            let queryParams = params.map { pair  in
                return URLQueryItem(name: pair.key, value: "\(pair.value)")
            }
            var components = URLComponents(string:url.appendingPathComponent(path).absoluteString)
            components?.queryItems = queryParams
            urlRequest.url = components?.url
        }
        
        return urlRequest
    }

}
